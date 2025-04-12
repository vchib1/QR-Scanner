import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestCameraPermission(BuildContext context) async {
  PermissionStatus status = await Permission.camera.request();

  if (!context.mounted) return;

  if (status == PermissionStatus.denied) {
    await showPermissionDialog(context);
  } else if (status == PermissionStatus.permanentlyDenied) {
    await showPermissionDialog(context, isPermanentlyDenied: true);
  } else if (status == PermissionStatus.granted) {
    Navigator.pushNamed(context, "/qr_scanner");
  }
}

Future<void> showPermissionDialog(
  BuildContext context, {
  bool isPermanentlyDenied = false,
}) async {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(
            isPermanentlyDenied
                ? context.locale.cameraPermissionDeniedTitle
                : context.locale.cameraPermissionRequiredTitle,
          ),
          content: Text(
            isPermanentlyDenied
                ? context.locale.cameraPermissionDeniedSubtitle
                : context.locale.cameraPermissionRequiredSubtitle,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.locale.cancel),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Close dialog before opening settings

                if (isPermanentlyDenied) {
                  bool settingsOpened = await openAppSettings();

                  if (settingsOpened) {
                    // Wait before checking permission again
                    await Future.delayed(const Duration(seconds: 2));

                    if (context.mounted) {
                      await requestCameraPermission(context);
                    }
                  } else {
                    if (!context.mounted) return;

                    SnackBarUtils.showSnackBar(
                      context.locale.openSettingsError,
                      context: context,
                    );
                  }
                } else {
                  await requestCameraPermission(context);
                }
              },
              child: Text(
                isPermanentlyDenied
                    ? context.locale.openSettings
                    : context.locale.allowPermission,
              ),
            ),
          ],
        ),
  );
}
