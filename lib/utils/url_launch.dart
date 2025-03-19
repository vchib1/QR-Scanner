import 'package:url_launcher/url_launcher.dart';

Future<void> launchQRData(String data) async {
  final uri = Uri.parse(data);

  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}