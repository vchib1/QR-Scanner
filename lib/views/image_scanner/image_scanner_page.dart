import 'dart:io';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:ez_qr/utils/helper_functions/loading_dialog.dart';
import 'package:ez_qr/utils/helper_functions/qr_data_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:path_provider/path_provider.dart';
import '../../model/scanned_item_model.dart';
import '../../utils/snackbar.dart';
import '../history/provider/provider.dart';

class ImageScannerPage extends ConsumerStatefulWidget {
  const ImageScannerPage({super.key});

  @override
  ConsumerState<ImageScannerPage> createState() => _ImageScannerPageState();
}

class _ImageScannerPageState extends ConsumerState<ImageScannerPage> {
  late final MobileScannerController controller;
  late final CropController cropController;

  Uint8List? selectedData;
  Uint8List? croppedData;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController();
    cropController = CropController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Future<String?> pickImage() async {
    showLoadingDialog(context);

    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      final imagePath = result?.files.first.path;

      if (imagePath == null && mounted) {
        throw context.locale.imageNotExists;
      }

      return imagePath;
    } catch (e) {
      if (mounted) throw "${context.locale.imagePickFailed}: $e";
    } finally {
      if (mounted) Navigator.pop(context);
    }
    return null;
  }

  Future<void> onDetect(BarcodeCapture capture) async {
    final data = capture.barcodes.first.rawValue;

    if (data != null) {
      await ref
          .read(historyAsyncProvider.notifier)
          .addItem(ScannedItem(data: data));

      if (mounted) await showQRDataDialog(context, data: data);
    }
  }

  Future<File> uint8ListToFile(Uint8List data, String fileName) async {
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/$fileName';

    final file = await File(filePath).writeAsBytes(data);

    return file;
  }

  void cropImage() => cropController.crop();

  Future<void> handleCropSuccess(CropSuccess result) async {
    try {
      final newData = result.croppedImage;

      setState(() => croppedData = newData);
      showLoadingDialog(context);

      File file = await uint8ListToFile(newData, "qrTemp.png");

      BarcodeCapture? res = await controller.analyzeImage(file.path);

      if (res != null) {
        await onDetect(res);
      } else {
        if (mounted) throw context.locale.noQRFound;
      }
    } catch (e) {
      SnackBarUtils.showErrorBar(e.toString());
    } finally {
      if (mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.scanImageTitle),
        actions: [
          Visibility(
            visible: (selectedData != null),
            child: IconButton(
              tooltip: context.locale.delete,
              icon: const Icon(Icons.delete),
              onPressed: () => setState(() => selectedData = null),
            ),
          ),
        ],
      ),
      floatingActionButton:
          (selectedData != null)
              ? FloatingActionButton(
                onPressed: cropImage,
                child: const Icon(Icons.check),
              )
              : null,
      body:
          (selectedData == null)
              ? Center(
                child: MaterialButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  onPressed: () async {
                    final imagePath = await pickImage();

                    if (imagePath == null) return;

                    setState(() {
                      selectedData = File(imagePath).readAsBytesSync();
                    });
                  },
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Icon(Icons.image, color: iconColor),
                      Text(
                        context.locale.pickFromGallery,
                        style: TextStyle(color: iconColor),
                      ),
                    ],
                  ),
                ),
              )
              : Crop(
                baseColor: Theme.of(context).colorScheme.surface,
                controller: cropController,
                image: selectedData!,
                onCropped: (result) async {
                  switch (result) {
                    case CropSuccess():
                      handleCropSuccess(result);
                    case CropFailure():
                  }
                },
              ),
    );
  }
}
