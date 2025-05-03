import 'package:ez_qr/utils/snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'loading_dialog.dart';

Future<bool> shareQRImage(
  BuildContext context, {
  double size = 300,
  required String data,
  Widget? child,
}) async {
  bool dialogShown = false;

  try {
    showLoadingDialog(context);
    dialogShown = true;

    // Capture QR image
    Uint8List image = await captureQRScreenshot(
      context,
      data: data,
      size: size,
      child: child,
    );

    // Dismiss dialog before showing share sheet
    if (dialogShown && context.mounted) {
      Navigator.of(context).pop();
      dialogShown = false;
    }

    // Share the image
    ShareResult? res = await SharePlus.instance.share(
      ShareParams(
        title: "qr.png",
        files: [XFile.fromData(image, mimeType: "image/png")],
      ),
    );

    return (res.status == ShareResultStatus.success);
  } catch (e) {
    if (context.mounted) SnackBarUtils.showErrorBar(e.toString());
    return false;
  } finally {
    if (dialogShown && context.mounted) Navigator.of(context).pop();
  }
}

Future<Uint8List> captureQRScreenshot(
  BuildContext context, {
  Widget? child,
  required double size,
  required String data,
}) async {
  final screenshotController = ScreenshotController();

  final qrWidget = MediaQuery(
    data: MediaQueryData.fromView(View.of(context)),
    child:
        child ??
        QrImageView(data: data, size: size, backgroundColor: Colors.white),
  );

  final imageBytes = await screenshotController.captureFromWidget(qrWidget);

  return imageBytes;
}
