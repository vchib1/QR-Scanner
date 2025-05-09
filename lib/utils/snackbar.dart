import 'package:flutter/material.dart';

class SnackBarUtils {
  static final snackBarKey = GlobalKey<ScaffoldMessengerState>();

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
      showCloseIcon: true,
      duration: const Duration(seconds: 3),
    );

    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (snackBarKey.currentState != null) {
      snackBarKey.currentState!.showSnackBar(snackBar);
    } else {
      throw Exception("❌ No ScaffoldMessenger found.");
    }
  }

  static void showSuccessBar(String message, {BuildContext? context}) {
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
      showCloseIcon: true,
      closeIconColor: Colors.white,
    );

    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (snackBarKey.currentState != null) {
      snackBarKey.currentState!.showSnackBar(snackBar);
    } else {
      throw Exception("❌ No ScaffoldMessenger found.");
    }
  }

  static void showErrorBar(String message, {BuildContext? context}) {
    final contextExist = (context ?? snackBarKey.currentState?.context) != null;

    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      showCloseIcon: true,
      content: Text(
        message,
        style: TextStyle(
          color:
              contextExist
                  ? Theme.of(
                    snackBarKey.currentState!.context,
                  ).colorScheme.onErrorContainer
                  : Colors.white,
        ),
      ),
      backgroundColor:
          contextExist
              ? Theme.of(
                snackBarKey.currentState!.context,
              ).colorScheme.errorContainer
              : Colors.redAccent,
      closeIconColor:
          contextExist
              ? Theme.of(
                snackBarKey.currentState!.context,
              ).colorScheme.onErrorContainer
              : Colors.white,
    );

    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (snackBarKey.currentState != null) {
      snackBarKey.currentState!.showSnackBar(snackBar);
    } else {
      throw Exception("❌ No ScaffoldMessenger found.");
    }
  }
}
