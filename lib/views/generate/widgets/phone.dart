import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QRPhone extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const QRPhone({super.key, required this.onChanged});

  @override
  State<QRPhone> createState() => _QRPhoneState();
}

class _QRPhoneState extends State<QRPhone> {
  late final TextEditingController phoneController;
  String? errorText;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void onChanged(String value) {
    final phone = phoneController.text.trim();

    if (errorText == null) {
      final data = "tel:$phone";
      widget.onChanged(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(hintText: context.locale.phone),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
