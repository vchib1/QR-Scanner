import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:ez_qr/utils/extensions/qr_type_extension.dart';
import 'package:ez_qr/utils/helper_functions/share_qr_image.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Chip(
                  label: Text(QrType.getQrType(data).localizedName(context)),
                ),
              ),
            ),
            IconButton(
              tooltip: context.locale.copy,
              onPressed: () => copyText(context, data),
              icon: const Icon(Icons.copy),
            ),
            IconButton(
              tooltip: context.locale.share,
              onPressed: () async {
                await shareQRImage(context, data: data);
                if (!context.mounted) return;
                Navigator.pop(context);
              },
              icon: const Icon(Icons.share_outlined),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(context.locale.cancel),
          ),
          if (QrType.getQrType(data).canOpen)
            TextButton(
              onPressed: () => launchQRData(data),
              child: Text(context.locale.open),
            )
          else
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(context.locale.ok),
            ),
        ],
        content: Container(
          padding: const EdgeInsets.all(12.0),
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

Future<void> copyText(BuildContext context, String text) async {
  await Clipboard.setData(ClipboardData(text: text));
  if (context.mounted) {
    SnackBarUtils.showSnackBar(context.locale.copied);
  }
}
