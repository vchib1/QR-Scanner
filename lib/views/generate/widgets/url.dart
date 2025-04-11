import 'dart:async';

import 'package:flutter/material.dart';

class QRUrl extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const QRUrl({super.key, required this.onChanged});

  @override
  State<QRUrl> createState() => _QRUrlState();
}

class _QRUrlState extends State<QRUrl> {
  late final TextEditingController urlController;

  String? errorText;
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    urlController = TextEditingController();
  }

  @override
  void dispose() {
    urlController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  bool isValidUrl(String url) {
    final uri = Uri.tryParse(url);

    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      return false;
    }

    // Allow only 'http' and 'https'
    if (uri.scheme != 'http' && uri.scheme != 'https') {
      return false;
    }

    // Ensure the host contains at least one dot (.) or is a valid IP address
    final domain = uri.host;
    final isValidDomain =
        domain.contains('.') ||
        RegExp(r'^\d+\.\d+\.\d+\.\d+$').hasMatch(domain);

    return isValidDomain;
  }

  void onChanged(String value) {
    debounce?.cancel();

    debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        errorText =
            value.isEmpty || isValidUrl(value) ? null : "Enter a valid URL";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: urlController,
      onChanged: onChanged,
      keyboardType: TextInputType.url,
      maxLines: 1,
      decoration: InputDecoration(hintText: "URL", errorText: errorText),
    );
  }
}
