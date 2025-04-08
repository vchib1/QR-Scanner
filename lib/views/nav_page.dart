import 'package:ez_qr/utils/snackbar.dart';
import 'package:ez_qr/views/home/home_page.dart';
import 'package:ez_qr/views/settings/settings_page.dart';
import 'package:flutter/material.dart';

import 'history/history_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentIndex = 0;

  final pages = [HomePage(), HistoryPage(), SettingsPage()];

  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;

        final now = DateTime.now();
        final lastPress = lastPressed;

        if (lastPress == null ||
            now.difference(lastPress) > const Duration(seconds: 2)) {
          setState(() {
            lastPressed = now;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Press back again to exit')),
          );
        } else {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          enableFeedback: true,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "HOME",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
