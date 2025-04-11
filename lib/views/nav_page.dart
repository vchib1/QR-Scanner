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

  final pages = [const HomePage(), const HistoryPage(), const SettingsPage()];

  @override
  initState() {
    super.initState();
    initializeQuickActions();
  }

  void initializeQuickActions() {
    QuickActions quickActions = const QuickActions();

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      quickActions.initialize((type) async {
        switch (type) {
          case 'action_camera_scan':
            await requestCameraPermission(context);
            break;
          case 'action_generate':
            Navigator.pushNamed(context, "/generate");
            break;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        enableFeedback: true,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "HOME"),
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
