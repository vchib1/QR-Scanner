import 'package:ez_qr/l10n/generated/app_localizations.dart';
import 'package:ez_qr/utils/extensions/context_extension.dart';
import 'package:ez_qr/utils/helper_functions/camera_permission_dialog.dart';
import 'package:ez_qr/views/home/home_page.dart';
import 'package:ez_qr/views/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';
import 'history/history_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentIndex = 0;
  bool quickActionLaunched = false;
  final pages = [const HomePage(), const HistoryPage(), const SettingsPage()];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initializeQuickActions();
    });
  }

  void initializeQuickActions() {
    const QuickActions quickActions = QuickActions();

    quickActions.setShortcutItems([
      ShortcutItem(
        type: 'action_camera_scan',
        localizedTitle: context.locale.scanQRCodeTitle,
        icon: "qr_scan",
      ),
      ShortcutItem(
        type: 'action_generate',
        localizedTitle: context.locale.qrGeneratorTitle,
        icon: "qr_generate",
      ),
    ]);

    quickActions.initialize((type) async {
      // prevents quick action to launch view twice
      if (!quickActionLaunched) {
        quickActionLaunched = true;
        handleQuickAction(type);
      }
    });
  }

  void handleQuickAction(String type) async {
    switch (type) {
      case 'action_camera_scan':
        await requestCameraPermission(context);
        break;
      case 'action_generate':
        Navigator.pushNamed(context, "/generate");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        enableFeedback: true,
        onTap: (index) {
          if (currentIndex == index) return;
          setState(() => currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: context.locale.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: context.locale.history,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: context.locale.settings,
          ),
        ],
      ),
    );
  }
}
