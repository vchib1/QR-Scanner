import 'package:ez_qr/utils/enums/qr_type.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'widgets/mail.dart';
import 'widgets/phone.dart';
import 'widgets/sms.dart';
import 'widgets/text.dart';
import 'widgets/url.dart';

class QrGeneratePage extends StatefulWidget {
  const QrGeneratePage({super.key});

  @override
  State<QrGeneratePage> createState() => _QrGeneratePageState();
}

class _QrGeneratePageState extends State<QrGeneratePage> {
  late final TextEditingController controller;

  String qrData = "AddHere";

  QrType? selectedOption = QrType.values.first;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onChanged(String value) {
    setState(() {
      qrData = value;
    });
  }

  void generateQR(Size size) {
    unFocusKeyboard();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 50,
              mainAxisSize: MainAxisSize.min,
              children: [
                QrImageView(data: qrData, size: size.width * 0.70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.save_outlined),
                    ),

                    IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void unFocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: unFocusKeyboard,
      child: Scaffold(
        appBar: AppBar(title: Text("Generate QR")),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(8.0),
          height: kBottomNavigationBarHeight + 8,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            onPressed: () => generateQR(size),
            child: Text(
              "Generate",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                //Text("QR Type:"),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (final option in QrType.values)
                      ChoiceChip(
                        showCheckmark: false,
                        selected: selectedOption == option,
                        label: Text(option.getName),
                        onSelected: (selected) {
                          setState(() {
                            selectedOption = selected ? option : null;
                          });
                        },
                      ),
                  ],
                ),

                const SizedBox(height: 10),

                switch (selectedOption) {
                  QrType.text => QRText(onChanged: onChanged),
                  QrType.sms => QRSms(onChanged: onChanged),
                  QrType.phone => QRPhone(onChanged: onChanged),
                  QrType.url => QRUrl(onChanged: onChanged),
                  QrType.mail => QRMail(onChanged: onChanged),
                  null => SizedBox.shrink(),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
