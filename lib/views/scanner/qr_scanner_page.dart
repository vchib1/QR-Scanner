import 'dart:io';
import 'dart:math';
import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:ez_qr/views/history/viewmodel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScannerPage extends ConsumerStatefulWidget {
  const QrScannerPage({super.key});

  @override
  ConsumerState<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends ConsumerState<QrScannerPage>
    with SingleTickerProviderStateMixin {
  late final MobileScannerController controller;
  late final AnimationController animationController;
  late final Animation<Offset> scannerAnimation;

  bool foundResult = false;

  bool flashOn = false;

  double zoomLevel = 0.0;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(returnImage: true);
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

  Future<void> _launchUrl(String data) async {
    final uri = Uri.parse(data);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result == null) return;

      final imagePath = result.files.first.path;
      if (imagePath == null) {
        throw "No image path found";
      }

      final data = await controller.analyzeImage(
        imagePath,
        formats: [BarcodeFormat.all],
      );

      if (data == null || data.barcodes.isEmpty) {
        throw "No QR code found in the image";
      }

      await onDetect(data);
    } catch (e) {
      SnackBarUtils.showSnackBar(e.toString());
    }
  }

  Future<void> onDetect(BarcodeCapture capture) async {
    try {
      if (foundResult) return;

      foundResult = true;
      animationController.stop();
      await controller.pause();

      final data = capture.barcodes.first.rawValue;

      if (data != null) {
        final scannedItem = ScannedItem(data: data);

        await ref.read(historyViewModel.notifier).addItem(scannedItem);

        if (mounted) {
          await showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(data),

                      if (QrType.getQrType(data).canOpen)
                        TextButton(
                          onPressed: () => _launchUrl(data),
                          child: Text("Open"),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        if (mounted) Navigator.popUntil(context, (ModalRoute.withName('/')));
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
    final size = MediaQuery.sizeOf(context);
    final iconColor = Colors.white;

    final scannerHeight = size.width * .65;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            MobileScanner(controller: controller, onDetect: onDetect),

            Align(
              alignment: Alignment.center,
              child: ColoredBox(
                color: Colors.white.withValues(alpha: 0.15),
                child: SizedBox.square(dimension: scannerHeight),
              ),
            ),

            Positioned(
              left: 0,
              bottom: 50,
              child: SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    spacing: 20,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.remove_circle, color: iconColor),
                          Flexible(
                            child: Slider(
                              value: zoomLevel,
                              min: 0.0,
                              max: 1.0,
                              thumbColor: iconColor,
                              activeColor: iconColor,
                              inactiveColor: Colors.grey.shade700,
                              onChanged: (value) {
                                setState(() {
                                  zoomLevel = value;
                                });
                                controller.setZoomScale(zoomLevel);
                              },
                            ),
                          ),
                          Icon(Icons.add_circle, color: iconColor),
                        ],
                      ),

                      Row(
                        spacing: 50,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: pickImage,
                            color: iconColor,
                            icon: Icon(Icons.image),
                          ),
                          IconButton(
                            onPressed: toggleFlash,
                            color: iconColor,
                            icon: Icon(
                              flashOn ? Icons.flash_on : Icons.flash_off,
                            ),
                          ),
                          IconButton(
                            onPressed: flipCamera,
                            color: iconColor,
                            icon: Icon(Icons.flip_camera_android),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
