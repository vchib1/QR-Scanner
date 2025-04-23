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

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Future<void> pickImage() async {
    try {
      showLoadingDialog(context);

      FilePickerResult? result;

      try {
        result = await FilePicker.platform.pickFiles(type: FileType.image);
      } catch (e) {
        if (mounted) throw "${context.locale.imagePickFailed}: ${e.toString()}";
      } finally {
        // pop loading
        if (mounted) Navigator.pop(context);
      }

      if (result == null) return;

      final imagePath = result.files.first.path;

      if (imagePath == null && mounted) {
        throw context.locale.imageNotExists;
      }

      final croppedImgFile = await cropImage(imagePath!);

      if (croppedImgFile == null && mounted) {
        throw context.locale.noQRFound;
      }

      final data = await controller.analyzeImage(
        croppedImgFile!.path,
        formats: [BarcodeFormat.all],
      );

      if ((data == null || data.barcodes.isEmpty) && mounted) {
        throw context.locale.noQRFound;
      }

      await onDetect(data!);
    } catch (e) {
      SnackBarUtils.showSnackBar(e.toString());
    }
  }

  Future<void> onDetect(BarcodeCapture capture) async {
    try {
      final data = capture.barcodes.first.rawValue;

      if (data != null) {
        await controller.pause();
        final scannedItem = ScannedItem(data: data);

        await ref.read(historyAsyncProvider.notifier).addItem(scannedItem);

        if (mounted) {
          await showQRDataDialog(context, data: data);
        }
      }
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
    }
  }

  Future<File?> cropImage(String imagePath) async {
    final imgFile = File(imagePath);

    final cropController = CropController();

    final image = await imgFile.readAsBytes();

    if (!mounted) return null;

    Uint8List? croppedData = await showDialog<Uint8List?>(
      context: context,
      builder: (context) {
        return IntrinsicHeight(
          child: Dialog(
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              height: 300,
              child: Crop(
                controller: cropController,
                image: image,
                onCropped: (result) {
                  switch (result) {
                    case CropSuccess():
                      Navigator.pop(context, result.croppedImage);
                    case CropFailure():
                      Navigator.pop(context);
                  }
                },
              ),
            ),
          ),
        );
      },
    );

    if (croppedData == null) return null;

    return await uint8ListToFile(croppedData, "cropTemp.png");
  }

  Future<File> uint8ListToFile(Uint8List data, String fileName) async {
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/$fileName';

    final file = await File(filePath).writeAsBytes(data);

    return file;
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(title: Text(context.locale.scanImageTitle)),
      body: Center(
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          onPressed: pickImage,
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
      ),
    );
  }
}
