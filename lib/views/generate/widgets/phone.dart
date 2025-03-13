import 'package:flutter/material.dart';

class QRPhone extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const QRPhone({super.key, required this.onChanged});

  @override
  State<QRPhone> createState() => _QRPhoneState();
}

class _QRPhoneState extends State<QRPhone> {
  late final TextEditingController phoneController;

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
    final data = "tel:${phoneController.text.trim()}";

    widget.onChanged(data);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
      decoration: const InputDecoration(hintText: "Phone"),
    );
  }
}
