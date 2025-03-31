import 'package:ez_qr/services/shared_pref.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:ez_qr/utils/theme/theme.dart';
import 'package:ez_qr/views/editor/editor_page.dart';
import 'package:ez_qr/views/generate/qr_generate_page.dart';
import 'package:ez_qr/views/history/history_page.dart';
import 'package:ez_qr/views/home/home_page.dart';
import 'package:ez_qr/views/image_scanner/image_scanner_page.dart';
import 'package:ez_qr/views/nav_page.dart';
import 'package:ez_qr/views/qr_scanner/qr_scanner_page.dart';
import 'package:ez_qr/views/settings/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final sharedPref = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPrefProvider.overrideWithValue(sharedPref)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      scaffoldMessengerKey: SnackBarUtils.snackBarKey,
      debugShowCheckedModeBanner: false,
      title: 'EZ-QR',
      themeMode: ref.watch(settingsProvider).themeMode,
      theme: MaterialTheme(textTheme).light(),
      darkTheme: MaterialTheme(textTheme).darkHighContrast(),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(builder: (context) => const NavPage());
          case "/home":
            return MaterialPageRoute(builder: (context) => const HomePage());
          case "/qr_scanner":
            return MaterialPageRoute(
              builder: (context) => const QrScannerPage(),
            );
          case "/image_scanner":
            return MaterialPageRoute(
              builder: (context) => const ImageScannerPage(),
            );
          case "/generator":
            return MaterialPageRoute(
              builder: (context) => const QrGeneratePage(),
            );
          case "/history":
            return MaterialPageRoute(builder: (context) => const HistoryPage());
        }

        if (settings.name == "/editor") {
          final qrData = settings.arguments as String;

          return MaterialPageRoute(
            builder: (context) => EditorPage(qrData: qrData),
          );
        }

        return null;
      },
    );
  }
}
