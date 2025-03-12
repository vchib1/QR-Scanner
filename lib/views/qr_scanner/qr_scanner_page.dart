import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/services/database/database.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage>
    with SingleTickerProviderStateMixin {
  late final MobileScannerController controller;
  late final AnimationController animationController;
  late final Animation<Offset> scannerAnimation;

  bool foundResult = false;

  bool flashOn = false;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    scannerAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 1),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  Future<void> onDetect(BarcodeCapture capture) async {
    try {
      if (foundResult) return;

      foundResult = true;
      animationController.stop();
      await controller.pause();

      final data = capture.barcodes.first.rawValue!;

      await LocalDatabase.insertScannedItem(ScannedItem(data: data));

      if (mounted) {
        await showDialog(
          context: context,
          builder: (context) {
            return Dialog(child: Text(data));
          },
        );

        foundResult = false;
        animationController.repeat(reverse: true);
        await controller.start();
      }
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
    }
  }

  Future<void> toggleFlash() async {
    await controller.toggleTorch();
    setState(() => flashOn = !flashOn);
  }

  Future<void> flipCamera() async {
    await controller.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // CAMERA FLIP
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: flipCamera,
              icon: Icon(Icons.flip_camera_ios_sharp),
            ),
          ),

          // FLASH TOGGLE
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: toggleFlash,
              icon: Icon(flashOn ? Icons.flash_on : Icons.flash_off),
            ),
          ),
        ],
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double containerHeight = constraints.maxWidth * 0.90;
            double scannerHeight = constraints.maxWidth * 0.10;

            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: containerHeight,
              width: constraints.maxWidth * .90,
              child: Stack(
                children: [
                  MobileScanner(controller: controller, onDetect: onDetect),
                  AnimatedBuilder(
                    animation: scannerAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          0,
                          scannerAnimation.value.dy *
                              (containerHeight - scannerHeight),
                        ),
                        child: child,
                      );
                    },
                    child: Container(
                      height: scannerHeight,
                      width: constraints.maxWidth,
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
