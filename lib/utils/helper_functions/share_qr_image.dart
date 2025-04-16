import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'loading_dialog.dart';

Future<bool> shareQRImage(
  BuildContext context, {
  required String data,
  Widget? child,
}) async {
  try {
    showLoadingDialog(context);

    // get QR code screenshot image
    Uint8List image = await captureQRScreenshot(
      context,
      data: data,
      child: child,
    );

    Directory tempDir = await getTemporaryDirectory();

    File file = File("${tempDir.path}/qr.png");

    File result = await file.writeAsBytes(image);

    ShareResult? res = await Share.shareXFiles([
      XFile(result.path),
    ], text: "QR Code");

    return (res.status == ShareResultStatus.success);
  } finally {
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}

/// Capture QR code screenshot and return as Uint8List
Future<Uint8List> captureQRScreenshot(
  BuildContext context, {
  Widget? child,
  required String data,
}) async {
  final screenshotController = ScreenshotController();

  final qrWidget = MediaQuery(
    data: MediaQueryData.fromView(View.of(context)),
    child: child ?? QrImageView(data: data, backgroundColor: Colors.white),
  );

  // Workaround for inverted image in debugMode
  final imageBytes = await screenshotController.captureFromWidget(qrWidget);

  return imageBytes;
}
