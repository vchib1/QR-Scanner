import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          keyboardType: TextInputType.phone,
          onChanged: onChanged,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(hintText: context.locale.phone),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        SizedBox(
          height: 5 * 24.0,
          child: TextFormField(
            controller: msgController,
            onChanged: onChanged,
            maxLines: 10,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(hintText: context.locale.message),
          ),
        ),
      ],
    );
  }
}
