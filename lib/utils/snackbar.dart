import 'package:flutter/material.dart';

class SnackBarUtils {
  static GlobalKey<ScaffoldMessengerState> snackBarKey =
      GlobalKey<ScaffoldMessengerState>();

  static void clearSnackBars({BuildContext? context}) {
    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      return;
    }

    if (snackBarKey.currentState != null) {
      snackBarKey.currentState!.removeCurrentSnackBar();
    }
  }

  static ThemeData get theme {
    if (snackBarKey.currentState != null) {
      return Theme.of(snackBarKey.currentState!.context);
    } else {
      throw Exception("❌ No ScaffoldMessenger found.");
    }
  }

  static void showSnackBar(String message, {BuildContext? context}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: theme.colorScheme.onPrimary),
      ),
      backgroundColor: theme.colorScheme.primary,
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
      throw Exception("❌ No ScaffoldMessenger found.");
    }
  }

  static void showSuccessBar(String message, {BuildContext? context}) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      showCloseIcon: true,
      closeIconColor: Colors.white,
    );

    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    // Fallback to global key if no context is provided
    if (snackBarKey.currentState != null) {
      snackBarKey.currentState!.showSnackBar(snackBar);
    } else {
      throw Exception("❌ No ScaffoldMessenger found.");
    }
  }

  static void showErrorBar(String message, {BuildContext? context}) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      showCloseIcon: true,
      closeIconColor: Colors.white,
    );

    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    // Fallback to global key if no context is provided
    if (snackBarKey.currentState != null) {
      snackBarKey.currentState!.showSnackBar(snackBar);
    } else {
      throw Exception("❌ No ScaffoldMessenger found.");
    }
  }
}
