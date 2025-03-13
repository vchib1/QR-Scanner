import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'widgets/mail.dart';
import 'widgets/phone.dart';
import 'widgets/sms.dart';
import 'widgets/text.dart';
import 'widgets/url.dart';

enum QROption { text, mail, url, phone, sms }

class QrGeneratePage extends StatefulWidget {
  const QrGeneratePage({super.key});

  @override
  State<QrGeneratePage> createState() => _QrGeneratePageState();
}

class _QrGeneratePageState extends State<QrGeneratePage> {
  late final TextEditingController controller;

  String qrData = "AddHere";

  QROption? selectedOption = QROption.values.first;

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: DropdownButton<QROption>(
                    value: selectedOption,
                    items:
                        QROption.values.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          );
                        }).toList(),
                    onChanged:
                        (value) => {
                          setState(() {
                            selectedOption = value;
                          }),
                        },
                  ),
                ),

                switch (selectedOption) {
                  QROption.text => QRText(onChanged: onChanged),
                  QROption.sms => QRSms(onChanged: onChanged),
                  QROption.phone => QRPhone(onChanged: onChanged),
                  QROption.url => QRUrl(onChanged: onChanged),
                  QROption.mail => QRMail(onChanged: onChanged),
                  null => SizedBox.shrink(),
                },

                MaterialButton(
                  color: Theme.of(context).colorScheme.primary,
                  minWidth: size.width * .95,
                  onPressed: () => generateQR(size),
                  child: Text("Generate"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
