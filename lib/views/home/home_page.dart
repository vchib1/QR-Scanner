import 'package:ez_qr/utils/helper_functions/camera_permission_dialog.dart';
import 'package:ez_qr/utils/tile_shapes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const iconSize = 32.0;

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16.0),
            const Icon(Icons.qr_code_2_rounded, size: 200.0),

            const SizedBox(height: 16.0),
            ListTile(
              shape: topRoundedBorder(),
              onTap: () async => await requestCameraPermission(context),
              leading: const Icon(Icons.qr_code_scanner, size: iconSize),
              title: const Text("Scan QR Code"),
              subtitle: const Text("Scan QR codes using device camera."),
            ),

            ListTile(
              shape: noneBorder(),
              onTap: () => Navigator.pushNamed(context, "/image_scanner"),
              leading: const Icon(Icons.image_search, size: iconSize),
              title: const Text("Scan Image"),
              subtitle: const Text("Find QR codes from images."),
            ),

            ListTile(
              shape: bottomRoundedBorder(),
              onTap: () => Navigator.pushNamed(context, "/generate"),
              leading: const Icon(Icons.qr_code_2_outlined, size: iconSize),
              title: const Text("QR Generator"),
              subtitle: const Text("Create your own QR Codes."),
            ),
          ],
        ),
      ),
    );
  }
}
