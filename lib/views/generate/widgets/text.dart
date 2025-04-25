import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class QRText extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const QRText({super.key, required this.onChanged});

  @override
  State<QRText> createState() => _QRTextState();
}

class _QRTextState extends State<QRText> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void onChanged(String value) => widget.onChanged(value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5 * 24.0,
      child: TextField(
        controller: textController,
        onChanged: onChanged,
        maxLines: 10,
        textInputAction: TextInputAction.newline,
        decoration: InputDecoration(hintText: context.locale.text),
      ),
    );
  }
}
