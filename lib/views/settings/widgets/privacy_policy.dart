import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  PrivacyPolicyScreenState createState() => PrivacyPolicyScreenState();
}

class PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  String _htmlContent = '';

  @override
  void initState() {
    super.initState();
    loadHtml();
  }

  Future<void> loadHtml() async {
    final htmlData = await rootBundle.loadString('assets/privacy_policy.html');
    setState(() {
      _htmlContent = htmlData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _htmlContent.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
          child: Html(
            data: _htmlContent,
            style: {
              "body": Style(
                backgroundColor:
                    Theme.of(context).colorScheme.surfaceContainerHigh,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            },
          ),
        );
  }
}
