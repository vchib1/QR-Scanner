import 'dart:io';
import 'dart:async';
import 'package:ez_qr/utils/enums/qr_logo_size.dart';
import 'package:ez_qr/utils/enums/qr_size.dart';
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
        dialogTitle: "Save QR Code",
        fileName: "$uid.png",
        type: FileType.image,
        bytes: image,
      );

      final fileSaved = result != null;

      if (fileSaved) {
        SnackBarUtils.showSuccessBar("QR Saved");
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
    final size = result["size"];

    if (imgPath == null) {
      SnackBarUtils.showErrorBar("Please pick a valid logo.");
      return;
    }

    File file = File(imgPath as String);
    QRLogoSize logoSize = size as QRLogoSize;

    Uint8List bytes = await file.readAsBytes();

    final state = ref.read(qrEditorProvider);

    ref
        .read(qrEditorProvider.notifier)
        .changeState(state.copyWith(selectedLogo: bytes, logoSize: logoSize));
  }

  Future<Map<String, dynamic>?> showLogoPickerModal() async {
    String? imgPath;
    QRLogoSize logoSize = QRLogoSize.large;

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
                  title: const Text("Pick Logo"),
                  subtitle: const Text(
                    "Adding a logo could cause QR readability issues.",
                  ),
                  leading: const Icon(Icons.image),
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
                  title: const Text("Confirm Selection"),
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
        title: const Text("QR Editor"),
        actions: [
          IconButton(
            tooltip: "Save QR Code",
            icon: const Icon(Icons.save),
            onPressed: () => saveQRImage(),
          ),
          IconButton(
            tooltip: "Share QR Code",
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
      body: Column(
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
                      title: const Text("Background Color"),
                      subtitle: const Text(
                        "Choose a color that contrasts with the pattern to ensure clear scanning.",
                      ),
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
                      title: const Text("Pattern Color"),
                      subtitle: const Text(
                        "Set the main QR code color. Use a dark color for better scanning.",
                      ),
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
                      title: const Text("Eye Color"),
                      subtitle: const Text(
                        "Pick a color for the QR code's eye patterns (corner markers).",
                      ),
                      trailing: _buildColoredBox(context, state.eyeColor),
                    ),

                    // Background Color
                    ListTile(
                      onTap: processLogo,
                      title: const Text("Pick Custom Logo"),
                      subtitle: const Text(
                        "Add a your custom logo in the center of the QR code.",
                      ),
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
                      title: const Text("Export Size"),
                      subtitle: const Text(
                        "Larger sizes provide better quality.",
                      ),
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
                      title: const Text("Enable Gap"),
                      subtitle: const Text("Allows the squares to have some gap."),
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
                        label: const Text("Pattern Shape"),
                        onSelected:
                            (value) => provider.changeState(
                              state.copyWith(patternShape: value),
                            ),
                        dropdownMenuEntries:
                            QrDataModuleShape.values
                                .map(
                                  (shape) => DropdownMenuEntry(
                                    value: shape,
                                    label: shape.toString().split('.').last,
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
                        label: const Text("Eye Shape"),
                        onSelected:
                            (value) => provider.changeState(
                              state.copyWith(eyeShape: value),
                            ),
                        dropdownMenuEntries:
                            QrEyeShape.values
                                .map(
                                  (shape) => DropdownMenuEntry(
                                    value: shape,
                                    label: shape.toString().split('.').last,
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
    );
  }

  Widget _buildQRView([double? size]) {
    final state = ref.read(qrEditorProvider);

    return QrImageView(
      data: widget.qrData,
      size: size ?? qrSize.value,
      gapless: !state.allowGap,
      backgroundColor: state.bgColor,
      version: state.version,
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
      child: ColoredBox(color: color, child: const SizedBox.square(dimension: 32.0)),
    );
  }
}
