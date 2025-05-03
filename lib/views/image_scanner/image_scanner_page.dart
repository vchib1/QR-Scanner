import 'dart:io';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:ez_qr/model/scanned_item_model.dart';
import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:ez_qr/utils/helper_functions/loading_dialog.dart';
import 'package:ez_qr/utils/helper_functions/qr_data_dialog.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:ez_qr/views/history/provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:path_provider/path_provider.dart';

class ImageScannerPage extends ConsumerStatefulWidget {
  const ImageScannerPage({super.key});

  @override
  ConsumerState<ImageScannerPage> createState() => _ImageScannerPageState();
}

class _ImageScannerPageState extends ConsumerState<ImageScannerPage> {
  late final MobileScannerController controller;
  late final CropController cropController;

  Uint8List? selectedImageData;
  Uint8List? croppedImageData;

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
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      final imagePath = result?.files.first.path;

      if (imagePath == null && mounted) {
        throw context.locale.imageNotExists;
      }

      return imagePath;
    } catch (e) {
      if (mounted) throw "${context.locale.imagePickFailed}: $e";
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

  void cropImage() {
    showLoadingDialog(context);
    cropController.crop();
  }

  Future<void> handleCropSuccess(CropSuccess result) async {
    try {
      final newData = result.croppedImage;

      setState(() => croppedImageData = newData);

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

    final selectionIsNotNull = (selectedImageData != null);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.scanImageTitle),
        actions: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            reverseDuration: const Duration(milliseconds: 150),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child:
                (selectionIsNotNull)
                    ? IconButton(
                      tooltip: context.locale.delete,
                      icon: const Icon(Icons.delete),
                      onPressed: () => setState(() => selectedImageData = null),
                    )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
      floatingActionButton:
          (selectionIsNotNull)
              ? FloatingActionButton(
                onPressed: cropImage,
                child: const Icon(Icons.check),
              )
              : null,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 150),
        reverseDuration: const Duration(milliseconds: 150),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: Center(
          child:
              (selectionIsNotNull)
                  ? Crop(
                    image: selectedImageData!,
                    controller: cropController,
                    baseColor: Theme.of(context).colorScheme.surface,
                    maskColor: Theme.of(
                      context,
                    ).colorScheme.surface.withAlpha(100),
                    onCropped: (result) async {
                      switch (result) {
                        case CropSuccess():
                          handleCropSuccess(result);
                        case CropFailure():
                          // pop loading dialog called before calling crop method
                          if (mounted) Navigator.pop(context);
                      }
                    },
                  )
                  : MaterialButton(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    onPressed: () async {
                      final imagePath = await pickImage();

                      if (imagePath == null) return;

                      setState(() {
                        selectedImageData = File(imagePath).readAsBytesSync();
                      });
                    },
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      side: BorderSide(
                        color:
                            Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                        width: 1.25,
                      ),
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
        ),
      ),
    );
  }
}
