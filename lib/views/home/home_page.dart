import 'package:ez_qr/utils/helper_functions/camera_permission_dialog.dart';
import 'package:ez_qr/utils/tile_shapes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final iconSize = 32.0;

    return Scaffold(
      appBar: AppBar(title: Text("HOME")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16.0),
            Icon(Icons.qr_code_2_rounded, size: 200.0),

            const SizedBox(height: 16.0),
            ListTile(
              shape: topRoundedBorder(),
              onTap: () async => await requestCameraPermission(context),
              leading: Icon(Icons.qr_code_scanner, size: iconSize),
              title: Text("Scan QR Code"),
              subtitle: Text("Scan QR codes using device camera."),
            ),

            ListTile(
              shape: noneBorder(),
              onTap: () => Navigator.pushNamed(context, "/image_scanner"),
              leading: Icon(Icons.image_search, size: iconSize),
              title: Text("Scan Image"),
              subtitle: Text("Find QR codes from images."),
            ),

            ListTile(
              shape: bottomRoundedBorder(),
              onTap: () => Navigator.pushNamed(context, "/generate"),
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
