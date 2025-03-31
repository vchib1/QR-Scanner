import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'url_launch.dart';

Future<T?> showQRDataDialog<T>(BuildContext context, {required String data}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Chip(label: Text(QrType.getQrType(data).getName)),
            IconButton(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: data));
                SnackBarUtils.showSnackBar("Content Copied");
              },
              icon: Icon(Icons.copy),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('CANCEL'),
          ),
          if (QrType.getQrType(data).canOpen)
            TextButton(onPressed: () => launchQRData(data), child: Text("OPEN"))
          else
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
        ],
        content: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8.0),
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
          child: Text(data),
        ),
      );
    },
  );
}
