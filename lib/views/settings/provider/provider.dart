import 'dart:async';
import 'dart:convert';
import 'package:ez_qr/services/shared_pref.dart';
import 'package:ez_qr/views/settings/provider/state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider = NotifierProvider<SettingsProvider, SettingState>(
  SettingsProvider.new,
);

class SettingsProvider extends Notifier<SettingState> {
  @override
  SettingState build() {
    return getSetting();
  }

  SettingState getSetting() {
    final pref = ref.watch(sharedPrefProvider);

    String? data = pref.getString("preferences");

    if (data != null) {
      return SettingState.fromJson(jsonDecode(data));
    }

    return const SettingState();
  }

  Future<void> updateSetting(SettingState newState) async {
    final pref = ref.watch(sharedPrefProvider);

    state = newState;

    await pref.setString("preferences", jsonEncode(newState.toJson()));
  }
}
