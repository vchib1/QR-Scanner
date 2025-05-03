import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FullscreenQrPage extends StatelessWidget {
  final String qrData;
  final Widget? child;

  const FullscreenQrPage({super.key, required this.qrData, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 5 || details.delta.dy < -5) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: Hero(
          tag: qrData,
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [child ?? QrImageView(data: qrData)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
