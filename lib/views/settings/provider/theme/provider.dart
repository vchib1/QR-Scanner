import 'dart:async';
import 'dart:convert';
import 'package:ez_qr/services/shared_pref.dart';
import 'package:ez_qr/views/settings/provider/theme/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = NotifierProvider<ThemeProvider, ThemeState>(
  ThemeProvider.new,
);

class ThemeProvider extends Notifier<ThemeState> {
  @override
  ThemeState build() {
    return getThemeState();
  }

  ThemeState getThemeState() {
    final pref = ref.watch(sharedPrefProvider);

    String? data = pref.getString("preferences");

    if (data != null) {
      return ThemeState.fromJson(jsonDecode(data));
    }

    return const ThemeState();
  }

  Future<void> updateState(ThemeState newState) async {
    final pref = ref.watch(sharedPrefProvider);

    state = newState;

    await pref.setString("preferences", jsonEncode(newState.toJson()));
  }
}
