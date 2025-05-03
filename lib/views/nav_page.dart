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

  late PageController pageController;

  bool _canPopNow = false;
  DateTime? _currentBackPressTime;

  void tapBackAgainToCloseApp() {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime!) > const Duration(seconds: 3)) {
      _currentBackPressTime = now;
      setState(() {
        _canPopNow = true;
      });
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _canPopNow = false;
          _currentBackPressTime = null;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
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

  void updatePageIndex(int index) {
    if (currentIndex == index) return;
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _canPopNow,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          tapBackAgainToCloseApp();
        }
      },
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: updatePageIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          enableFeedback: true,
          onTap: (index) {
            updatePageIndex(index);
            pageController.jumpToPage(index);
          },
          selectedItemColor: Theme.of(context).colorScheme.primary,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_filled),
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
      ),
    );
  }
}
