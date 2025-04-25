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
  /// Save QR code image to device
  Future<bool> saveQRImage() async {
    try {
      showLoadingDialog(context);

      // get QR code screenshot image
      Uint8List image = await captureQRScreenshot(
        context,
        data: widget.qrData,
        size: ref.read(qrEditorProvider).qrSize.value,
        child: _buildQRView(ref.read(qrEditorProvider).qrSize.value),
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

    if (imgPath == null && mounted) {
      SnackBarUtils.showErrorBar(context.locale.addLogoInvalidError);
      return;
    }

    File file = File(imgPath as String);

    Uint8List bytes = await file.readAsBytes();

    final state = ref.read(qrEditorProvider);

    ref
        .read(qrEditorProvider.notifier)
        .changeState(state.copyWith(selectedLogo: bytes, logoSize: null));
  }

  Future<Map<String, dynamic>?> showLogoPickerModal() async {
    String? imgPath;

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
                    Navigator.pop(context, {"image": imgPath});
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
          // Share
          IconButton(
            tooltip: context.locale.shareQR,
            icon: const Icon(Icons.share_outlined),
            onPressed:
                () => shareQRImage(
                  context,
                  data: widget.qrData,
                  size: state.qrSize.value,
                  child: _buildQRView(),
                ),
          ),

          // Save
          IconButton(
            tooltip: context.locale.saveQR,
            icon: const Icon(Icons.save),
            onPressed: () => saveQRImage(),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: QRSliverView(
                height: state.qrSize.value + 50,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: Theme.of(context).colorScheme.surface,
                  child: SizedBox.square(
                    dimension: state.qrSize.value,
                    child: Center(child: _buildQRView()),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  spacing: 8.0,
                  children: [
                    const SizedBox(height: 8.0),
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
                      trailing: _buildColoredBox(state.bgColor),
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
                      trailing: _buildColoredBox(state.patternColor),
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
                      trailing: _buildColoredBox(state.eyeColor),
                    ),

                    // Add Logo
                    ListTile(
                      onTap: processLogo,
                      title: Text(context.locale.addLogoTitle),
                      subtitle: Text(context.locale.addLogoSubtitle),
                      trailing:
                          (state.selectedLogo != null)
                              ? IconButton(
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                  vertical: -4,
                                ),
                                onPressed: () {
                                  provider.changeState(
                                    state.copyWith(clearLogo: true),
                                  );
                                },
                                icon: const Icon(Icons.delete),
                              )
                              : const Icon(Icons.image_outlined),
                    ),

                    // Logo Size
                    ListTile(
                      enabled: (state.selectedLogo != null),
                      onTap: processLogo,
                      title: Text(context.locale.logoSizeTitle),
                      subtitle: Text(context.locale.logoSizeSubtitle),
                      trailing: SizedBox(
                        width: MediaQuery.sizeOf(context).width * .40,
                        child: Slider(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          //ignore: deprecated_member_use
                          year2023: false,
                          value: state.logoSize.size,
                          label: state.logoSize.name.toUpperCase(),
                          min: QRLogoSize.values.first.size,
                          max: QRLogoSize.values.last.size,
                          divisions: QRLogoSize.values.length - 1,
                          onChanged:
                              (state.selectedLogo != null)
                                  ? (double newValue) {
                                    provider.changeState(
                                      state.copyWith(
                                        logoSize: QRLogoSize.parseValue(
                                          newValue,
                                        ),
                                      ),
                                    );
                                  }
                                  : null,
                        ),
                      ),
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
                          value: state.qrSize.value,
                          label: state.qrSize.name.toUpperCase(),
                          min: QRSize.values.first.value,
                          max: QRSize.values.last.value,
                          divisions: QRSize.values.length - 1,
                          onChanged: (double newValue) {
                            provider.changeState(
                              state.copyWith(
                                qrSize: QRSize.parseValue(newValue),
                              ),
                            );
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
                          provider.changeState(state.copyWith(allowGap: value));
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

                    const SizedBox(height: 8.0),
                  ],
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

    final logoSize = (size ?? state.qrSize.value) * (state.logoSize.size / 100);

    return QrImageView(
      padding: EdgeInsets.all((size ?? state.qrSize.value) * 0.04),
      data: widget.qrData,
      errorCorrectionLevel: config.errorCorrectionLevel,
      version: config.version,
      size: size ?? state.qrSize.value,
      gapless: !state.allowGap,
      backgroundColor: state.bgColor,
      embeddedImageStyle: QrEmbeddedImageStyle(size: Size.square(logoSize)),
      embeddedImage:
          state.selectedLogo != null ? MemoryImage(state.selectedLogo!) : null,
      dataModuleStyle: QrDataModuleStyle(
        color: state.patternColor,
        dataModuleShape: state.patternShape,
      ),
      eyeStyle: QrEyeStyle(color: state.eyeColor, eyeShape: state.eyeShape),
    );
  }

  Widget _buildColoredBox(Color color) {
    return CircleAvatar(radius: 16.0, backgroundColor: color);
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

class QRSliverView extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  const QRSliverView({required this.height, required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
