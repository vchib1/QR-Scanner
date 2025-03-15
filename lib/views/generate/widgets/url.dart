import 'package:flutter/material.dart';

class QRUrl extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const QRUrl({super.key, required this.onChanged});

  @override
  State<QRUrl> createState() => _QRUrlState();
}

class _QRUrlState extends State<QRUrl> {
  late final TextEditingController urlController;

  @override
  void initState() {
    super.initState();
    urlController = TextEditingController();
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  bool isUrlValid(String value) {
    Uri? uri = Uri.tryParse(value);

    return uri != null && (uri.hasScheme && uri.scheme.isNotEmpty);
  }

  void onChanged(String value) => widget.onChanged(value);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: urlController,
      onChanged: onChanged,
      keyboardType: TextInputType.url,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "URL",
        errorText:
            isUrlValid(urlController.text) || urlController.text.isEmpty
                ? null
                : "Enter a valid URL",
      ),
    );
  }
}
