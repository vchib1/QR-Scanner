import 'dart:io';
import 'dart:async';
import 'package:ez_qr/utils/enums/qr_logo_size.dart';
import 'package:ez_qr/utils/enums/qr_size.dart';
import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:ez_qr/utils/extensions/eye_shape_extension.dart';
import 'package:ez_qr/utils/extensions/pattern_shape_extension.dart';
import 'package:ez_qr/utils/helper_functions/colorpicker_dialog.dart';
import 'package:ez_qr/utils/helper_functions/loading_dialog.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:ez_qr/utils/tile_shapes.dart';
import 'package:ez_qr/views/editor/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ez_qr/services/database/history/history_db.dart';
import '../../utils/helper_functions/share_qr_image.dart';

class EditorPage extends ConsumerStatefulWidget {
  final String qrData;

  const EditorPage({super.key, required this.qrData});

  @override
  ConsumerState<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends ConsumerState<EditorPage> {
  QrSize qrSize = QrSize.m;

  /// Save QR code image to device
  Future<bool> saveQRImage() async {
    try {
      showLoadingDialog(context);

      // get QR code screenshot image
      Uint8List image = await captureQRScreenshot(
        context,
        data: widget.qrData,
        child: _buildQRView(),
      );

      // create a random file name to save
      String uid = ref.read(uuidProvider).v4().split("-").last;

      // save image to device
      String? result = await FilePicker.platform.saveFile(
        fileName: "$uid.png",
        type: FileType.image,
        bytes: image,
      );

      final fileSaved = result != null;

      if (fileSaved && mounted) {
        SnackBarUtils.showSuccessBar(context.locale.qrSaved);
      }

      return fileSaved;
    } finally {
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  Future<void> processLogo() async {
    Map<String, dynamic>? result = await showLogoPickerModal();

    if (result == null) return;

    final imgPath = result["image"];
    //final size = result["size"];

    if (imgPath == null && mounted) {
      SnackBarUtils.showErrorBar(context.locale.addLogoInvalidError);
      return;
    }

    File file = File(imgPath as String);
    //QRLogoSize logoSize = size as QRLogoSize;

    Uint8List bytes = await file.readAsBytes();

    final state = ref.read(qrEditorProvider);

    ref
        .read(qrEditorProvider.notifier)
        .changeState(state.copyWith(selectedLogo: bytes, logoSize: null));
  }

  Future<Map<String, dynamic>?> showLogoPickerModal() async {
    String? imgPath;
    QRLogoSize logoSize = QRLogoSize.medium;

    final result = await showModalBottomSheet(
      context: context,
      isDismissible: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  shape: topRoundedBorder(),
                  title: Text(context.locale.addLogoTitle),
                  subtitle: Text(context.locale.addLogoWarning),
                  leading:
                      imgPath == null
                          ? const Icon(Icons.image)
                          : SizedBox.square(
                            dimension: 24,
                            child: Image.memory(
                              File(imgPath!).readAsBytesSync(),
                            ),
                          ),
                  onTap: () async {
                    FilePickerResult? res = await FilePicker.platform.pickFiles(
                      allowedExtensions: ["png", "jpg", "jpeg"],
                      type: FileType.custom,
                    );

                    if (res == null) return;

                    String? path = res.files.first.path;

                    if (path != null) {
                      setState(() {
                        imgPath = path;
                      });
                    }
                  },
                ),
                ListTile(
                  shape: noneBorder(),
                  title: Text(context.locale.confirm),
                  leading: const Icon(Icons.check),
                  onTap: () {
                    Navigator.pop(context, {
                      "image": imgPath,
                      "size": logoSize,
                    });
                  },
                ),
              ],
            );
          },
        );
      },
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(qrEditorProvider);
    final provider = ref.watch(qrEditorProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        scrolledUnderElevation: 0.0,
        title: Text(context.locale.qrEditor),
        actions: [
          IconButton(
            tooltip: context.locale.saveQR,
            icon: const Icon(Icons.save),
            onPressed: () => saveQRImage(),
          ),
          IconButton(
            tooltip: context.locale.shareQR,
            icon: const Icon(Icons.share),
            onPressed:
                () => shareQRImage(
                  context,
                  data: widget.qrData,
                  child: _buildQRView(),
                ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              alignment: Alignment.center,
              color: Theme.of(context).colorScheme.surface,
              child: SizedBox.square(dimension: 200, child: _buildQRView(200)),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Theme.of(context).listTileTheme.tileColor,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    spacing: 8.0,
                    children: [
                      // Background Color
                      ListTile(
                        tileColor: Colors.transparent,
                        onTap: () {
                          colorPickerDialog(
                            context,
                            state.bgColor,
                            (color) => provider.changeState(
                              state.copyWith(bgColor: color),
                            ),
                          );
                        },
                        title: Text(context.locale.bgColorTitle),
                        subtitle: Text(context.locale.bgColorSubtitle),
                        trailing: _buildColoredBox(context, state.bgColor),
                      ),

                      // Pattern Color
                      ListTile(
                        onTap: () {
                          colorPickerDialog(
                            context,
                            state.patternColor,
                            (color) => provider.changeState(
                              state.copyWith(patternColor: color),
                            ),
                          );
                        },
                        title: Text(context.locale.patternColorTitle),
                        subtitle: Text(context.locale.patternColorSubtitle),
                        trailing: _buildColoredBox(context, state.patternColor),
                      ),

                      // Eye Color
                      ListTile(
                        onTap: () {
                          colorPickerDialog(
                            context,
                            state.eyeColor,
                            (color) => provider.changeState(
                              state.copyWith(eyeColor: color),
                            ),
                          );
                        },
                        title: Text(context.locale.eyeColorTitle),
                        subtitle: Text(context.locale.eyeColorSubtitle),
                        trailing: _buildColoredBox(context, state.eyeColor),
                      ),

                      // Background Color
                      ListTile(
                        onTap: processLogo,
                        title: Text(context.locale.addLogoTitle),
                        subtitle: Text(context.locale.addLogoSubtitle),
                        trailing:
                            state.selectedLogo != null
                                ? IconButton(
                                  onPressed: () {
                                    provider.changeState(
                                      state.copyWith(clearLogo: true),
                                    );
                                  },
                                  icon: const Icon(Icons.delete),
                                )
                                : const Icon(Icons.image_outlined),
                      ),

                      // Export Size
                      ListTile(
                        isThreeLine: true,
                        title: Text(context.locale.exportSizeTitle),
                        subtitle: Text(context.locale.exportSizeSubtitle),
                        trailing: SizedBox(
                          width: MediaQuery.sizeOf(context).width * .40,
                          child: Slider(
                            padding: const EdgeInsets.symmetric(vertical: 0.0),
                            //ignore: deprecated_member_use
                            year2023: false,
                            value: qrSize.value,
                            label: qrSize.name.toUpperCase(),
                            min: QrSize.values.first.value,
                            max: QrSize.values.last.value,
                            divisions: QrSize.values.length - 1,
                            onChanged: (double newValue) {
                              setState(() {
                                qrSize = QrSize.parseValue(newValue);
                              });
                            },
                          ),
                        ),
                      ),

                      // Gap
                      ListTile(
                        onTap: () {
                          colorPickerDialog(
                            context,
                            state.eyeColor,
                            (color) => provider.changeState(
                              state.copyWith(eyeColor: color),
                            ),
                          );
                        },
                        title: Text(context.locale.enableGapTitle),
                        subtitle: Text(context.locale.enableGapSubtitle),
                        trailing: Switch(
                          value: state.allowGap,
                          onChanged: (value) {
                            provider.changeState(
                              state.copyWith(allowGap: value),
                            );
                          },
                        ),
                      ),

                      // Pattern Shape
                      ListTile(
                        title: DropdownMenu<QrDataModuleShape>(
                          width: double.infinity,

                          initialSelection: state.patternShape,
                          label: Text(context.locale.patternShape),
                          onSelected:
                              (value) => provider.changeState(
                                state.copyWith(patternShape: value),
                              ),
                          dropdownMenuEntries:
                              QrDataModuleShape.values
                                  .map(
                                    (shape) => DropdownMenuEntry(
                                      value: shape,
                                      label: shape.localizedName(context),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),

                      // Eye Shape
                      ListTile(
                        tileColor: Colors.transparent,
                        title: DropdownMenu<QrEyeShape>(
                          width: double.infinity,
                          initialSelection: state.eyeShape,
                          label: Text(context.locale.eyeShape),
                          onSelected:
                              (value) => provider.changeState(
                                state.copyWith(eyeShape: value),
                              ),
                          dropdownMenuEntries:
                              QrEyeShape.values
                                  .map(
                                    (shape) => DropdownMenuEntry(
                                      value: shape,
                                      label: shape.localizedName(context),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQRView([double? size]) {
    final state = ref.read(qrEditorProvider);

    final config = calculateQRConfig(
      data: widget.qrData,
      withLogo: state.selectedLogo != null,
    );

    return QrImageView(
      data: widget.qrData,
      errorCorrectionLevel: config.errorCorrectionLevel,
      version: config.version,
      size: size ?? qrSize.value,
      gapless: !state.allowGap,
      backgroundColor: state.bgColor,
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: Size.square(state.logoSize.size),
      ),
      embeddedImage:
          state.selectedLogo != null ? MemoryImage(state.selectedLogo!) : null,
      dataModuleStyle: QrDataModuleStyle(
        color: state.patternColor,
        dataModuleShape: state.patternShape,
      ),
      eyeStyle: QrEyeStyle(color: state.eyeColor, eyeShape: state.eyeShape),
    );
  }

  Widget _buildColoredBox(BuildContext context, Color color) {
    return PhysicalModel(
      color: color,
      elevation: 1.0,
      shadowColor: Theme.of(context).colorScheme.shadow,
      child: ColoredBox(
        color: color,
        child: const SizedBox.square(dimension: 32.0),
      ),
    );
  }

  // calculate QR Version and Error Correction Level based in QR Data
  ({int version, int errorCorrectionLevel}) calculateQRConfig({
    required String data,
    bool withLogo = false,
  }) {
    final length = data.length;
    int version;
    int errorCorrectionLevel;

    if (length <= 50) {
      version = withLogo ? 5 : 3;
      errorCorrectionLevel =
          withLogo ? QrErrorCorrectLevel.H : QrErrorCorrectLevel.M;
    } else if (length <= 100) {
      version = withLogo ? 7 : 5;
      errorCorrectionLevel =
          withLogo ? QrErrorCorrectLevel.H : QrErrorCorrectLevel.M;
    } else if (length <= 200) {
      version = withLogo ? 10 : 7;
      errorCorrectionLevel =
          withLogo ? QrErrorCorrectLevel.H : QrErrorCorrectLevel.Q;
    } else if (length <= 400) {
      version = withLogo ? 15 : 10;
      errorCorrectionLevel =
          withLogo ? QrErrorCorrectLevel.Q : QrErrorCorrectLevel.M;
    } else {
      version = 15;
      errorCorrectionLevel = QrErrorCorrectLevel.L;
    }

    return (version: version, errorCorrectionLevel: errorCorrectionLevel);
  }
}
