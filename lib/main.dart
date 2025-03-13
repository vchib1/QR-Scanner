import 'package:ez_qr/views/generate/qr_generate_page.dart';
import 'package:ez_qr/views/history/history_page.dart';
import 'package:ez_qr/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/scanner/qr_scanner_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EZ-QR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/scanner": (context) => const QrScannerPage(),
        "/generate": (context) => const QrGeneratePage(),
        "/history": (context) => const HistoryPage(),
      },
    );
  }
}
