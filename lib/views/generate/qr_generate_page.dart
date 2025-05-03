import 'package:ez_qr/utils/constants.dart';
import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:ez_qr/utils/extensions/qr_type_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screenshot/screenshot.dart';
import 'widgets/mail.dart';
import 'widgets/phone.dart';
import 'widgets/sms.dart';
import 'widgets/text.dart';
import 'widgets/url.dart';

class QrGeneratePage extends ConsumerStatefulWidget {
  const QrGeneratePage({super.key});

  @override
  ConsumerState<QrGeneratePage> createState() => _QrGeneratePageState();
}

class _QrGeneratePageState extends ConsumerState<QrGeneratePage> {
  late final ScreenshotController screenshotController;

  String qrData = "";

  QrType selectedOption = QrType.values.first;

  @override
  void initState() {
    super.initState();
    screenshotController = ScreenshotController();
  }

  void onChanged(String value) {
    setState(() => qrData = value);
  }

  void unFocusKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  void navigateToEditor() {
    unFocusKeyboard();
    Navigator.pushNamed(context, "/editor", arguments: qrData);
  }

  @override
  Widget build(BuildContext context) {
    bool qrDataNotEmpty = qrData.isNotEmpty;

    return GestureDetector(
      onTap: unFocusKeyboard,
      child: Scaffold(
        appBar: AppBar(title: Text(context.locale.qrGeneratorTitle)),
        floatingActionButton:
            qrDataNotEmpty
                ? FloatingActionButton(
                  onPressed: navigateToEditor,
                  tooltip: context.locale.next,
                  child: const Icon(Icons.arrow_forward),
                )
                : null,
        body: Padding(
          padding: bodyPaddingHorizontal,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    for (final option in QrType.values)
                      ChoiceChip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        selected: selectedOption == option,
                        label: Text(option.localizedName(context)),
                        onSelected: (selected) {
                          setState(() {
                            selectedOption = selected ? option : selectedOption;
                          });
                        },
                      ),
                  ],
                ),

                const SizedBox(height: 8),

                switch (selectedOption) {
                  QrType.text => QRText(onChanged: onChanged),
                  QrType.sms => QRSms(onChanged: onChanged),
                  QrType.phone => QRPhone(onChanged: onChanged),
                  QrType.url => QRUrl(onChanged: onChanged),
                  QrType.mail => QRMail(onChanged: onChanged),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
