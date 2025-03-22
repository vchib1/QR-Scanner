import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ez_qr/views/editor/viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:ez_qr/services/database/history/history_db.dart';

class EditorPage extends ConsumerStatefulWidget {
  final String qrData;

  const EditorPage({super.key, required this.qrData});

  @override
  ConsumerState<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends ConsumerState<EditorPage> {
  late final ScreenshotController screenshotController;

  static const qrSize = 200.0;

  @override
  void initState() {
    super.initState();
    screenshotController = ScreenshotController();
  }

  Future<void> colorPickerDialog(
    BuildContext context,
    Color color,
    Function(Color color) setState,
  ) async {
    //
    Color newColor = await showColorPickerDialog(
      context,
      color,
      heading: Text("Pick a Color"),
      pickersEnabled: <ColorPickerType, bool>{
        ColorPickerType.wheel: true,
        ColorPickerType.primary: false,
        ColorPickerType.accent: false,
      },
    );

    setState(newColor);
  }

  /// Capture QR code screenshot and return as Uint8List
  Future<Uint8List> captureQRScreenshot() async {
    Uint8List image = await screenshotController.captureFromWidget(
      _buildQRView(context),
    );

    return image;
  }

  /// Save QR code image to device
  Future<bool> saveQRImage() async {
    try {
      showLoadingDialog();

      // get QR code screenshot image
      Uint8List image = await captureQRScreenshot();

      // create a random file name to save
      String uid = ref.read(uuidProvider).v4().split("-").last;

      // save image to device
      String? result = await FilePicker.platform.saveFile(
        dialogTitle: "Save QR Code",
        fileName: "$uid.png",
        type: FileType.image,
        bytes: image,
      );

      return (result != null);
    } finally {
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  Future<bool> shareQRImage() async {
    try {
      showLoadingDialog();

      // get QR code screenshot image
      Uint8List image = await captureQRScreenshot();

      final tempDir = await getTemporaryDirectory();

      File file = File("${tempDir.path}/qr.png");

      File result = await file.writeAsBytes(image);

      ShareResult? res = await Share.shareXFiles([
        XFile(result.path),
      ], text: "QR Code");

      return (res.status == ShareResultStatus.success);
    } finally {
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  void showLoadingDialog() => showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator()),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final state = ref.watch(qrEditViewModel);
    final viewModel = ref.watch(qrEditViewModel.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("QR Editor"),
        actions: [
          IconButton(
            tooltip: "Save QR Code",
            icon: const Icon(Icons.save),
            onPressed: () => saveQRImage(),
          ),
          IconButton(
            tooltip: "Share QR Code",
            icon: const Icon(Icons.share),
            onPressed: () => shareQRImage(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 12.0,
            children: [
              const SizedBox(height: 8.0),
              SizedBox(height: qrSize, child: _buildQRView(context)),

              const SizedBox(height: 12.0),

              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // Background Color
                  ListTile(
                    onTap: () {
                      colorPickerDialog(
                        context,
                        state.bgColor,
                        (color) => viewModel.changeState(
                          state.copyWith(bgColor: color),
                        ),
                      );
                    },
                    title: Text("Background Color"),
                    subtitle: Text(
                      "Choose a color that contrasts with the pattern to ensure clear scanning.",
                    ),
                    trailing: _buildColoredBox(context, state.bgColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8.0),

                  // Pattern Color
                  ListTile(
                    onTap: () {
                      colorPickerDialog(
                        context,
                        state.patternColor,
                        (color) => viewModel.changeState(
                          state.copyWith(patternColor: color),
                        ),
                      );
                    },
                    title: Text("Pattern Color"),
                    subtitle: Text(
                      "Set the main QR code color. Use a dark color for better scanning.",
                    ),
                    trailing: _buildColoredBox(context, state.patternColor),
                  ),

                  const SizedBox(height: 8.0),

                  // Eye Color
                  ListTile(
                    onTap: () {
                      colorPickerDialog(
                        context,
                        state.eyeColor,
                        (color) => viewModel.changeState(
                          state.copyWith(eyeColor: color),
                        ),
                      );
                    },
                    title: Text("Eye Color"),
                    subtitle: Text(
                      "Pick a color for the QR code's eye patterns (corner markers).",
                    ),
                    trailing: _buildColoredBox(context, state.eyeColor),
                  ),

                  const SizedBox(height: 8.0),

                  // Gap
                  ListTile(
                    onTap: () {
                      colorPickerDialog(
                        context,
                        state.eyeColor,
                        (color) => viewModel.changeState(
                          state.copyWith(eyeColor: color),
                        ),
                      );
                    },
                    title: Text("Enable Gap"),
                    subtitle: Text(
                      "If enabled, the squares will have some gap.",
                    ),
                    trailing: Switch(
                      value: state.allowGap,
                      onChanged: (value) {
                        viewModel.changeState(state.copyWith(allowGap: value));
                      },
                    ),
                  ),

                  const SizedBox(height: 8.0),

                  // Background Color
                  ListTile(
                    onTap: () async {
                      final path = await Navigator.pushNamed(
                        context,
                        "/editor/logo",
                      );

                      if (path == null) return;

                      viewModel.changeState(
                        state.copyWith(logoPath: path as String),
                      );
                    },
                    title: Text("Custom Logo"),
                    subtitle: Text(
                      "Add a your custom logo in the center of the QR code.",
                    ),
                    trailing:
                        state.logoPath != null
                            ? IconButton(
                              onPressed: () {
                                viewModel.changeState(
                                  state.copyWith(clearLogoPath: true),
                                );
                              },
                              icon: Icon(Icons.delete),
                            )
                            : const Icon(Icons.arrow_forward),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16.0),

                  DropdownMenu<QrDataModuleShape>(
                    width: double.infinity,

                    initialSelection: state.patternShape,
                    label: const Text("Pattern Shape"),
                    onSelected:
                        (value) => viewModel.changeState(
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

                  const SizedBox(height: 16.0),

                  // Eye Shape
                  DropdownMenu<QrEyeShape>(
                    width: double.infinity,
                    initialSelection: state.eyeShape,
                    label: const Text("Eye Shape"),
                    onSelected:
                        (value) => viewModel.changeState(
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

                  const SizedBox(height: 8.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQRView(BuildContext context) {
    final state = ref.read(qrEditViewModel);

    return QrImageView(
      data: widget.qrData,
      size: qrSize,
      gapless: !state.allowGap,
      backgroundColor: state.bgColor,
      version: state.version,
      embeddedImage:
          state.logoPath != null ? FileImage(File(state.logoPath!)) : null,
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
      child: ColoredBox(color: color, child: SizedBox.square(dimension: 32.0)),
    );
  }
}
