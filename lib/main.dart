import 'package:ez_qr/views/history/history_page.dart';
import 'package:ez_qr/views/home/home_page.dart';
import 'package:ez_qr/views/qr_scanner/qr_scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/scanner": (context) => const QrScannerPage(),
        "/history": (context) => const HistoryPage(),
      },
    );
  }
}
