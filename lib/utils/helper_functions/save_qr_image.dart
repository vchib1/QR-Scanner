import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'loading_dialog.dart';
import 'share_qr_image.dart';

/// Save QR code image to device
Future<bool> saveQRImage(
  BuildContext context, {
  required String qrData,
  Widget? child,
  double size = 200,
  String? fileName = "qr",
}) async {
  bool loadingActive = false;

  try {
    showLoadingDialog(context);
    loadingActive = true;

    // get QR code screenshot image
    Uint8List image = await captureQRScreenshot(
      context,
      data: qrData,
      size: size,
      child: child,
    );

    if (context.mounted && loadingActive) {
      Navigator.pop(context);
      loadingActive = false;
    }

    // save image to device
    String? result = await FilePicker.platform.saveFile(
      fileName: "$fileName.png",
      type: FileType.image,
      bytes: image,
    );

    final fileSaved = result != null;

    if (fileSaved && context.mounted) {
      SnackBarUtils.showSuccessBar(context.locale.qrSaved);
    }

    return fileSaved;
  } finally {
    if (context.mounted && loadingActive) {
      Navigator.pop(context);
    }
  }
}
