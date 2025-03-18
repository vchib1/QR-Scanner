import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackBarKey =
    GlobalKey<ScaffoldMessengerState>();

class SnackBarUtils {
  static void clearSnackBars({BuildContext? context}) {
    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      return;
    }

    if (snackBarKey.currentState != null) {
      snackBarKey.currentState!.removeCurrentSnackBar();
    }
  }

  static void showSnackBar(String message, {BuildContext? context}) {
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
    );

    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    // Fallback to global key if no context is provided
    if (snackBarKey.currentState != null) {
      snackBarKey.currentState!.showSnackBar(snackBar);
    } else {
      debugPrint("❌ No ScaffoldMessenger found.");
    }
  }
}
