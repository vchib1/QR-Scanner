import 'package:ez_qr/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> showPermissionDialog(
    BuildContext context, {
    bool isPermanentlyDenied = false,
  }) async {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Permission Required"),
            content: Text(
              isPermanentlyDenied
                  ? "Camera permission is required to scan QR codes. Please enable it in settings."
                  : "Camera permission is required to scan QR codes. Please allow access.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(
                    context,
                  ); // Close dialog before opening settings

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
                        "Failed to open settings. Please open manually.",
                        context: context,
                      );
                    }
                  } else {
                    await requestCameraPermission(context);
                  }
                },
                child: Text(
                  isPermanentlyDenied ? "Open Settings" : "Allow Permission",
                ),
              ),
            ],
          ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    final iconSize = 32.0;

    return Scaffold(
      appBar: AppBar(title: Text("EZQR")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.min,
          children: [
            FlutterLogo(size: 200, style: FlutterLogoStyle.horizontal),
            ListTile(
              onTap: () async => await requestCameraPermission(context),
              leading: Icon(Icons.qr_code_scanner, size: iconSize),
              title: Text("Scan QR Code"),
              subtitle: Text("Scan QR codes using device camera."),
            ),

            ListTile(
              onTap: () => Navigator.pushNamed(context, "/image_scanner"),
              leading: Icon(Icons.image_search, size: iconSize),
              title: Text("Scan Image"),
              subtitle: Text("Find QR codes from images."),
            ),

            ListTile(
              onTap: () => Navigator.pushNamed(context, "/generator"),
              leading: Icon(Icons.qr_code_2_outlined, size: iconSize),
              title: Text("QR Generator"),
              subtitle: Text("Create your own QR Codes."),
            ),
          ],
        ),
      ),
    );
  }
}
