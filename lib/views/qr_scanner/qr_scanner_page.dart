import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/utils/helper_functions/qr_data_dialog.dart';
import 'package:ez_qr/views/history/provider.dart';
import 'package:ez_qr/views/qr_scanner/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'widgets/qr_frame.dart';

class QrScannerPage extends ConsumerStatefulWidget {
  const QrScannerPage({super.key});

  @override
  ConsumerState<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends ConsumerState<QrScannerPage>
    with SingleTickerProviderStateMixin {
  late MobileScannerController controller;

  late AnimationController animationController;

  Rect scanWindow = Rect.zero;

  @override
  void initState() {
    super.initState();

    controller = MobileScannerController(detectionTimeoutMs: 1500);

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animationController.repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) => setScanWindow());
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  void setScanWindow() {
    final size = MediaQuery.of(context).size;
    final scannerSize = size.width * 0.70;

    final left = (size.width - scannerSize) / 2;
    final top = (size.height - scannerSize - kToolbarHeight) / 2;

    scanWindow = Rect.fromLTWH(left, top, scannerSize, scannerSize);
    controller.updateScanWindow(scanWindow);
    setState(() {});
  }

  Future<void> onDetect(BarcodeCapture capture) async {
    final resultFound = ref.read(qrScannerViewModel).resultFound;

    try {
      if (resultFound) return;

      ref.read(qrScannerViewModel.notifier).setResultFound(true);

      final data = capture.barcodes.first.rawValue;

      if (data != null) {
        await controller.pause();
        final scannedItem = ScannedItem(data: data);

        await ref.read(historyAsyncProvider.notifier).addItem(scannedItem);

        if (mounted) {
          await showQRDataDialog(context, data: data);
        }

        ref.read(qrScannerViewModel.notifier).setResultFound(false);
        await controller.start();
        //if (mounted) Navigator.popUntil(context, (ModalRoute.withName('/')));
      }
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
    }
  }

  Future<void> toggleFlash() async {
    await controller.toggleTorch();
    ref.read(qrScannerViewModel.notifier).toggleFlash();
  }

  Future<void> changeZoomLevel(double zoomLevel) async {
    await controller.setZoomScale(zoomLevel);
    ref.read(qrScannerViewModel.notifier).setZoom(zoomLevel);
  }

  Future<void> switchCamera() async {
    await controller.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    const iconColor = Colors.white;

    final scannerHeight = size.width * .60;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: iconColor),
        ),
        actions: [
          IconButton(
            onPressed: switchCamera,
            icon: const Icon(Icons.flip_camera_ios, color: iconColor),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: toggleFlash,
            icon: Icon(
              ref.watch(qrScannerViewModel).flashOn
                  ? Icons.flash_on
                  : Icons.flash_off,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            MobileScanner(controller: controller, onDetect: onDetect),

            Center(
              child: Column(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  QRScannerFrame(
                    size: scannerHeight,
                    color: iconColor,
                    animation: animationController,
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),

            Positioned(
              left: 0,
              bottom: 50,
              child: SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.remove_circle, color: iconColor),
                      Consumer(
                        builder: (context, ref, child) {
                          final zoomLevel =
                              ref.watch(qrScannerViewModel).zoomLevel;

                          return Flexible(
                            child: Slider(
                              value: zoomLevel,
                              min: 0.0,
                              max: 1.0,
                              thumbColor: iconColor,
                              activeColor: iconColor,
                              inactiveColor: Colors.grey.shade700,
                              onChanged: changeZoomLevel,
                            ),
                          );
                        },
                      ),
                      const Icon(Icons.add_circle, color: iconColor),
                    ],
                  ),
                ),
              ),
            ),

            // if (kDebugMode)
            //   Positioned.fromRect(
            //     rect: scanWindow,
            //     child: Container(
            //       decoration: BoxDecoration(
            //         border: Border.all(color: Colors.white, width: 1),
            //         // Red border
            //         color: Colors.transparent,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
