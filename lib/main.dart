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
import 'package:ez_qr/views/settings/provider/theme/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/generated/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    MaterialTheme materialTheme = MaterialTheme(Theme.of(context).textTheme);

    ThemeState themeStata = ref.watch(themeNotifierProvider);

    AppLanguage language = ref.watch(languageNotifierProvider);

    return _EagerInitialization(
      child: MaterialApp(
        title: 'QR Scanner',
        scaffoldMessengerKey: SnackBarUtils.snackBarKey,
        debugShowCheckedModeBanner: false,

        /// Theme
        themeMode: themeStata.themeMode,
        theme: materialTheme.getLightThemeData(themeStata.contrastMode),
        darkTheme: materialTheme.getDarkThemeData(themeStata.contrastMode),

        /// Localization
        supportedLocales: AppLanguage.values.map((e) => Locale(e.code)),
        locale: Locale(language.code),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        /// Routes
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
            case "/editor":
              final qrData = settings.arguments as String;
              return MaterialPageRoute(
                builder: (context) => EditorPage(qrData: qrData),
              );
            case "/fullscreen_qr":
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
