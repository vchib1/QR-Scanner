import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:ez_qr/utils/url_launch.dart';
import 'package:ez_qr/views/history/viewmodel.dart';
import 'package:ez_qr/views/scanner/viewmodel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

import 'widgets/qr_frame.dart';

class QrScannerPage extends ConsumerStatefulWidget {
  const QrScannerPage({super.key});

  @override
  ConsumerState<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends ConsumerState<QrScannerPage> {
  late final MobileScannerController controller;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
      autoStart: false,
      facing: CameraFacing.back,
      detectionTimeoutMs: 1500,
    );
    Future.delayed(Duration.zero, handlePermission);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result == null) return;

      final imagePath = result.files.first.path;
      if (imagePath == null) {
        throw "Picked image does not exist";
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
    final resultFound = ref.read(qrScannerViewModel).resultFound;

    try {
      if (resultFound) return;

      ref.read(qrScannerViewModel.notifier).setResultFound(true);
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
                          onPressed: () => launchQRData(data),
                          child: Text("Open"),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        await controller.start();
        //if (mounted) Navigator.popUntil(context, (ModalRoute.withName('/')));
      }
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
    }
  }

  Future<void> handlePermission() async {
    final alertDialog = AlertDialog(
      title: const Text("Permission Required"),
      content: const Text(
        "Camera Permission is required to scan QR Code. Please enable it in settings.",
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            bool settingsAccessed = await openAppSettings();
            if (mounted) Navigator.pop(context);
            if (settingsAccessed) {
              handlePermission();
            }
          },
          child: const Text("Open Settings"),
        ),
      ],
    );

    try {
      PermissionStatus status =
          await Permission.camera
              .onDeniedCallback(() {
                SnackBarUtils.showSnackBar("Camera Permission Denied");
              })
              .onPermanentlyDeniedCallback(() {
                showDialog(context: context, builder: (context) => alertDialog);
              })
              .request();

      if (status == PermissionStatus.granted) {
        await controller.start();
      }
    } catch (e) {
      SnackBarUtils.showSnackBar(e.toString());
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final iconColor = Colors.white;

    final scannerHeight = size.width * .60;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            MobileScanner(controller: controller, onDetect: onDetect),
            Align(
              alignment: Alignment.center,
              child: Column(
                spacing: 30,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Scan QR Code",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: iconColor),
                  ),
                  Center(
                    child: QRScannerFrame(
                      size: scannerHeight,
                      color: iconColor,
                    ),
                  ),
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
                  child: Column(
                    spacing: 20,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.remove_circle, color: iconColor),
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
                          Consumer(
                            builder: (context, ref, child) {
                              final flashOn =
                                  ref.watch(qrScannerViewModel).flashOn;

                              return IconButton(
                                onPressed: toggleFlash,
                                color: iconColor,
                                icon: Icon(
                                  flashOn ? Icons.flash_on : Icons.flash_off,
                                ),
                              );
                            },
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
