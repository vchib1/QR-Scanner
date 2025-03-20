import 'package:ez_qr/utils/snackbar.dart';
import 'package:ez_qr/utils/theme/theme.dart';
import 'package:ez_qr/views/generate/qr_generate_page.dart';
import 'package:ez_qr/views/history/history_page.dart';
import 'package:ez_qr/views/home/home_page.dart';
import 'package:ez_qr/views/image_scanner/image_scanner_page.dart';
import 'package:ez_qr/views/nav_page.dart';
import 'package:ez_qr/views/qr_scanner/qr_scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      scaffoldMessengerKey: SnackBarUtils.snackBarKey,
      debugShowCheckedModeBanner: false,
      title: 'EZ-QR',
      themeMode: ThemeMode.dark,
      theme: MaterialTheme(textTheme).lightMediumContrast(),
      darkTheme: MaterialTheme(textTheme).darkMediumContrast(),
      initialRoute: "/",
      routes: {
        "/": (context) => const NavPage(),
        "/home": (context) => const HomePage(),
        "/qr_scanner": (context) => const QrScannerPage(),
        "/image_scanner": (context) => const ImageScannerPage(),
        "/generator": (context) => const QrGeneratePage(),
        "/history": (context) => const HistoryPage(),
      },
    );
  }
}
