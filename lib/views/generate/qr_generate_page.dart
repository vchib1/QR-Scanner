import 'dart:io';

import 'package:ez_qr/services/database/history/history_db.dart';
import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'widgets/mail.dart';
import 'widgets/phone.dart';
import 'widgets/sms.dart';
import 'widgets/text.dart';
import 'widgets/url.dart';

class QrGeneratePage extends ConsumerStatefulWidget {
  const QrGeneratePage({super.key});

  @override
  ConsumerState<QrGeneratePage> createState() => _QrGeneratePageState();
}

class _QrGeneratePageState extends ConsumerState<QrGeneratePage> {
  late final TextEditingController controller;
  late final ScreenshotController screenshotController;

  String qrData = "";

  QrType? selectedOption = QrType.values.first;

  static const qrViewSize = 200.0;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    screenshotController = ScreenshotController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onChanged(String value) {
    setState(() {
      qrData = value;
    });
  }

  /// Capture QR code screenshot and return as Uint8List
  Future<Uint8List> captureQRScreenshot() async {
    Uint8List image = await screenshotController.captureFromWidget(
      ColoredBox(
        color: Colors.white,
        child: SizedBox.square(
          dimension: qrViewSize + 100,
          child: Center(child: QrImageView(data: qrData, size: qrViewSize)),
        ),
      ),
    );

    return image;
  }

  /// Save QR code image to device
  Future<bool> saveQRImage() async {
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
  }

  Future<bool> shareQRImage() async {
    // get QR code screenshot image
    Uint8List image = await captureQRScreenshot();

    final tempDir = await getTemporaryDirectory();

    File file = File("${tempDir.path}/qr.png");

    File result = await file.writeAsBytes(image);

    ShareResult? res = await Share.shareXFiles([
      XFile(result.path),
    ], text: "QR Code");

    return (res.status == ShareResultStatus.success);
  }

  Future<void> generateQR(Size size, BuildContext context) async {
    bool isSaving = false;
    bool isSharing = false;

    try {
      unFocusKeyboard();

      String? result = await showModalBottomSheet(
        context: context,
        showDragHandle: true,
        builder: (context) {
          final loadingWidget = SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 3),
          );

          return StatefulBuilder(
            builder: (context, setState) {
              Future<void> saveImage() async {
                setState(() => isSaving = true);
                bool success = await saveQRImage();

                if (context.mounted) {
                  Navigator.pop(
                    context,
                    success ? "Saved QR successfully" : null,
                  );
                }
              }

              Future<void> shareImage() async {
                setState(() => isSharing = true);
                bool success = await shareQRImage();

                if (context.mounted) {
                  Navigator.pop(
                    context,
                    success ? "Shared QR successfully" : null,
                  );
                }
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    QrImageView(data: qrData, size: size.width * 0.70),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: saveImage,
                          icon: isSaving ? loadingWidget : Icon(Icons.save),
                        ),

                        IconButton(
                          onPressed: shareImage,
                          icon: isSharing ? loadingWidget : Icon(Icons.share),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      );

      if (result != null && context.mounted) {
        SnackBarUtils.showSnackBar(result, context: context);
      }
    } catch (e) {
      if (context.mounted) {
        SnackBarUtils.showSnackBar(e.toString(), context: context);
      }
    }
  }

  void unFocusKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return ScaffoldMessenger(
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: unFocusKeyboard,
            child: Scaffold(
              appBar: AppBar(title: Text("Generate QR")),
              bottomNavigationBar: Container(
                padding: EdgeInsets.all(8.0),
                height: kBottomNavigationBarHeight + 8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  onPressed: () => generateQR(size, context),
                  child: Text(
                    "Generate",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      //Text("QR Type:"),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (final option in QrType.values)
                            ChoiceChip(
                              showCheckmark: false,
                              selected: selectedOption == option,
                              label: Text(option.getName),
                              onSelected: (selected) {
                                setState(() {
                                  selectedOption = selected ? option : null;
                                });
                              },
                            ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      switch (selectedOption) {
                        QrType.text => QRText(onChanged: onChanged),
                        QrType.sms => QRSms(onChanged: onChanged),
                        QrType.phone => QRPhone(onChanged: onChanged),
                        QrType.url => QRUrl(onChanged: onChanged),
                        QrType.mail => QRMail(onChanged: onChanged),
                        null => SizedBox.shrink(),
                      },
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
