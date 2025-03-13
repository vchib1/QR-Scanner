import 'package:flutter/material.dart';

class QRSms extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const QRSms({super.key, required this.onChanged});

  @override
  State<QRSms> createState() => _QRSmsState();
}

class _QRSmsState extends State<QRSms> {
  late final TextEditingController phoneController;
  late final TextEditingController msgController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    msgController = TextEditingController();
  }

  @override
  void dispose() {
    msgController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void onChanged(String value) {
    final data =
        "sms:${phoneController.text.trim()}?body=${msgController.text.trim()}";

    widget.onChanged(data);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        TextField(
          controller: phoneController,
          onChanged: onChanged,
          maxLines: 1,
          decoration: const InputDecoration(hintText: "Phone"),
        ),
        SizedBox(
          height: 5 * 24.0,
          child: TextField(
            controller: msgController,
            onChanged: onChanged,
            maxLines: 10,
            decoration: InputDecoration(hintText: "Message"),
          ),
        ),
      ],
    );
  }
}
