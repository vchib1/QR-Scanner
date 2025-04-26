import 'package:ez_qr/utils/constants.dart';
import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:ez_qr/utils/helper_functions/camera_permission_dialog.dart';
import 'package:ez_qr/utils/tile_shapes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const iconSize = 32.0;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            pinned: true,
            expandedHeight: sliverAppBarHeight,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(context.locale.home),
              expandedTitleScale: sliverAppBarTitleScale,
              titlePadding: sliverAppBarTitlePadding,
            ),
          ),

          // Body
          SliverToBoxAdapter(
            child: Padding(
              padding: bodyPaddingHorizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Visible on on portrait orientation
                  if (MediaQuery.orientationOf(context) ==
                      Orientation.portrait) ...[
                    const SizedBox(height: sliverAppBarHeight / 2),
                    const Icon(Icons.qr_code_2_rounded, size: 200.0),
                  ],
                  ListTile(
                    shape: topRoundedBorder(),
                    onTap: () async => await requestCameraPermission(context),
                    leading: const Icon(Icons.qr_code_scanner, size: iconSize),
                    title: Text(context.locale.scanQRCodeTitle),
                    subtitle: Text(context.locale.scanQRCodeSubtitle),
                  ),

                  ListTile(
                    shape: noneBorder(),
                    onTap: () => Navigator.pushNamed(context, "/image_scanner"),
                    leading: const Icon(Icons.image_search, size: iconSize),
                    title: Text(context.locale.scanImageTitle),
                    subtitle: Text(context.locale.scanImageSubtitle),
                  ),

                  ListTile(
                    shape: bottomRoundedBorder(),
                    onTap: () => Navigator.pushNamed(context, "/generate"),
                    leading: const Icon(
                      Icons.qr_code_2_outlined,
                      size: iconSize,
                    ),
                    title: Text(context.locale.qrGeneratorTitle),
                    subtitle: Text(context.locale.qrGeneratorSubtitle),
                  ),

                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
