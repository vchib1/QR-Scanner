import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class QRMail extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const QRMail({super.key, required this.onChanged});

  @override
  State<QRMail> createState() => _QRMailState();
}

class _QRMailState extends State<QRMail> {
  late final TextEditingController emailController;
  late final TextEditingController subjectController;
  late final TextEditingController bodyController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    subjectController = TextEditingController();
    bodyController = TextEditingController();
  }

  @override
  dispose() {
    emailController.dispose();
    subjectController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  void onChanged(String? value) {
    final email = emailController.text.trim();
    final subject = subjectController.text.trim();
    final body = bodyController.text.trim();

    final data = "mailto:$email?subject=$subject&body=$body";

    widget.onChanged(data);
  }

  @override
  Widget build(BuildContext context) {
    const maxLines = 5;

    return Column(
      spacing: 10,
      children: [
        TextField(
          controller: emailController,
          onChanged: onChanged,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(hintText: context.locale.to),
        ),
        TextField(
          controller: subjectController,
          onChanged: onChanged,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(hintText: context.locale.subject),
        ),
        SizedBox(
          height: maxLines * 24.0,
          child: TextField(
            controller: bodyController,
            onChanged: onChanged,
            maxLines: maxLines,
            decoration: InputDecoration(hintText: context.locale.body),
          ),
        ),
      ],
    );
  }
}
