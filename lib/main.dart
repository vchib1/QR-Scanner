import 'package:ez_qr/services/shared_pref.dart';
import 'package:ez_qr/utils/enums/app_language.dart';
import 'package:ez_qr/utils/enums/theme_contrast.dart';
import 'package:ez_qr/utils/snackbar.dart';
import 'package:ez_qr/utils/theme/theme.dart';
import 'package:ez_qr/views/editor/editor_page.dart';
import 'package:ez_qr/views/fullscreen_qr/fullscreen_qr_page.dart';
import 'package:ez_qr/views/generate/qr_generate_page.dart';
import 'package:ez_qr/views/history/history_page.dart';
import 'package:ez_qr/views/history/provider/provider.dart';
import 'package:ez_qr/views/home/home_page.dart';
import 'package:ez_qr/views/image_scanner/image_scanner_page.dart';
import 'package:ez_qr/views/nav_page.dart';
import 'package:ez_qr/views/qr_scanner/qr_scanner_page.dart';
import 'package:ez_qr/views/settings/provider/backup/backup_provider.dart';
import 'package:ez_qr/views/settings/provider/language/language_provider.dart';
import 'package:ez_qr/views/settings/provider/theme/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/generated/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    // DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
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

    final language = ref.watch(languageNotifierProvider);

    return _EagerInitialization(
      child: MaterialApp(
        scaffoldMessengerKey: SnackBarUtils.snackBarKey,
        debugShowCheckedModeBanner: false,
        title: 'EZ-QR',
        themeMode: ref.watch(themeProvider).themeMode,
        theme: lightThemeData(
          context,
          textTheme,
          ref.watch(themeProvider).contrastMode,
        ),
        darkTheme: darkThemeData(
          context,
          textTheme,
          ref.watch(themeProvider).contrastMode,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLanguage.values.map((e) => Locale(e.code)),
        locale: Locale(language.code),
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
            case "/generate":
              return MaterialPageRoute(
                builder: (context) => const QrGeneratePage(),
              );
            case "/history":
              return MaterialPageRoute(
                builder: (context) => const HistoryPage(),
              );
          }

          if (settings.name == "/editor") {
            final qrData = settings.arguments as String;

            return MaterialPageRoute(
              builder: (context) => EditorPage(qrData: qrData),
            );
          }

          if (settings.name == "/fullscreen_qr") {
            final args = settings.arguments as Map;

            return MaterialPageRoute(
              builder:
                  (context) => FullscreenQrPage(
                    qrData: args["qrData"] as String,
                    child: args["child"] as Widget?,
                  ),
            );
          }

          return null;
        },
      ),
    );
  }

  ThemeData lightThemeData(
    BuildContext context,
    TextTheme textTheme,
    ThemeContrastMode contrastMode,
  ) {
    return switch (contrastMode) {
      ThemeContrastMode.light => MaterialTheme(textTheme).light(),
      ThemeContrastMode.medium =>
        MaterialTheme(textTheme).lightMediumContrast(),
      ThemeContrastMode.high => MaterialTheme(textTheme).lightHighContrast(),
    };
  }

  ThemeData darkThemeData(
    BuildContext context,
    TextTheme textTheme,
    ThemeContrastMode contrastMode,
  ) {
    return switch (contrastMode) {
      ThemeContrastMode.light => MaterialTheme(textTheme).dark(),
      ThemeContrastMode.medium => MaterialTheme(textTheme).darkMediumContrast(),
      ThemeContrastMode.high => MaterialTheme(textTheme).darkHighContrast(),
    };
  }
}

class _EagerInitialization extends ConsumerWidget {
  final Widget child;

  const _EagerInitialization({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // eager initialization:
    ref.read(historyAsyncProvider);
    ref.read(dbBackupNotifier);

    return child;
  }
}
