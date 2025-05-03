import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/utils/helper_functions/qr_data_dialog.dart';
import 'package:ez_qr/views/history/provider/provider.dart';
import 'package:ez_qr/views/qr_scanner/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late MobileScannerController mobileScannerController;

  late AnimationController animationController;
  late Animation<double> scannerAnimation;

  Rect scanWindow = Rect.zero;
  static const Color iconColor = Colors.white;

  @override
  void initState() {
    super.initState();

    mobileScannerController = MobileScannerController(detectionTimeoutMs: 1500);

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      reverseDuration: const Duration(milliseconds: 1500),
    );

    scannerAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: animationController,
    );

    animationController.repeat(reverse: true);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    WidgetsBinding.instance.addPostFrameCallback((_) => setScanWindow());
  }

  @override
  void dispose() {
    mobileScannerController.dispose();
    animationController.dispose();

    SystemChrome.setPreferredOrientations(
      DeviceOrientation.values.map((e) => e).toList(),
    );
    super.dispose();
  }

  void setScanWindow() {
    final size = MediaQuery.of(context).size;
    final scannerSize = size.width * 0.60;

    final left = (size.width - scannerSize) / 2;
    final top = (size.height - scannerSize - kToolbarHeight) / 2;

    scanWindow = Rect.fromLTWH(left, top, scannerSize, scannerSize);
    mobileScannerController.updateScanWindow(scanWindow);
    setState(() {});
  }

  Future<void> onDetect(BarcodeCapture capture) async {
    final resultFound = ref.read(qrScannerNotifierProvider).resultFound;

    if (resultFound) return;

    try {
      ref.read(qrScannerNotifierProvider.notifier).setResultFound(true);

      final data = capture.barcodes.first.rawValue;

      if (data != null) {
        await mobileScannerController.pause();
        final scannedItem = ScannedItem(data: data);

        await ref.read(historyAsyncProvider.notifier).addItem(scannedItem);

        if (mounted) {
          await showQRDataDialog(context, data: data);
        }

        ref.read(qrScannerNotifierProvider.notifier).setResultFound(false);
        await mobileScannerController.start();
      }
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
    }
  }

  Future<void> toggleFlash() async {
    await mobileScannerController.toggleTorch();
    ref.read(qrScannerNotifierProvider.notifier).toggleFlash();
  }

  Future<void> changeZoomLevel(double zoomLevel) async {
    await mobileScannerController.setZoomScale(zoomLevel);
    ref.read(qrScannerNotifierProvider.notifier).setZoom(zoomLevel);
  }

  Future<void> switchCamera() async {
    await mobileScannerController.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

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
              ref.watch(qrScannerNotifierProvider).flashOn
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
            MobileScanner(
              controller: mobileScannerController,
              onDetect: onDetect,
              scanWindow: scanWindow,
            ),
            Center(
              child: Column(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  QRScannerFrame(
                    size: scannerHeight,
                    color: iconColor,
                    animation: scannerAnimation,
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),

            Positioned(
              bottom: 24,
              right: 0,
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
                              ref.watch(qrScannerNotifierProvider).zoomLevel;

                          return Flexible(
                            child: Slider(
                              onChanged: changeZoomLevel,
                              value: zoomLevel,
                              min: 0.0,
                              max: 1.0,
                              thumbColor: iconColor,
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              inactiveColor: Colors.grey.shade700,
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
            //         border: Border.all(color: Colors.green, width: 3),
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
