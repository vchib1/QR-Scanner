import 'package:flutter/material.dart';

class SettingState {
  final ThemeMode themeMode;

  const SettingState({this.themeMode = ThemeMode.system});

  Map<String, dynamic> toJson() {
    return {"themeMode": themeMode.name};
  }

  factory SettingState.fromJson(Map<String, dynamic> map) {
    return SettingState(
      themeMode: ThemeMode.values.firstWhere(
        (e) => e.name == map["themeMode"],
        orElse: () => ThemeMode.system,
      ),
    );
  }

  SettingState copyWith({ThemeMode? themeMode}) {
    return SettingState(themeMode: themeMode ?? this.themeMode);
  }
}
