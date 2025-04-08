import 'package:ez_qr/utils/helper_functions/loading_dialog.dart';
import 'package:ez_qr/utils/helper_functions/qr_data_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../model/scanned_item_model.dart';
import '../../utils/enums/qr_type.dart';
import '../../utils/snackbar.dart';
import '../../utils/helper_functions/url_launch.dart';
import '../history/provider.dart';

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
        if (mounted) Navigator.pop(context);
        throw "Failed to pick image: ${e.toString()}";
      }

      if (mounted) Navigator.pop(context);

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
        SnackBarUtils.showSnackBar("No QR code found in the image");
        return;
      }

      await onDetect(data);
    } catch (e) {
      if (mounted) Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      appBar: AppBar(title: Text("Image Scanner")),
      body: Center(
        child: MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
              Text("pick from gallery", style: TextStyle(color: iconColor)),
            ],
          ),
        ),
      ),
    );
  }
}
