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
    initializeQuickActions();
  }

  void initializeQuickActions() {
    const QuickActions quickActions = QuickActions();

    quickActions.setShortcutItems([
      const ShortcutItem(
        type: 'action_camera_scan',
        localizedTitle: "Scan QR",
        icon: "qr_scan",
      ),
      const ShortcutItem(
        type: 'action_generate',
        localizedTitle: "Generate QR",
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
