import 'package:ez_qr/utils/enums/theme_contrast.dart';
import 'package:flutter/material.dart';

class SettingState {
  final ThemeMode themeMode;
  final ThemeContrastMode contrastMode;

  const SettingState({
    this.themeMode = ThemeMode.system,
    this.contrastMode = ThemeContrastMode.light,
  });

  Map<String, dynamic> toJson() {
    return {"themeMode": themeMode.name, "contrastMode": contrastMode.name};
  }

  factory SettingState.fromJson(Map<String, dynamic> map) {
    return SettingState(
      themeMode: ThemeMode.values.firstWhere(
        (e) => e.name == map["themeMode"],
        orElse: () => ThemeMode.system,
      ),
      contrastMode: ThemeContrastMode.values.firstWhere(
        (e) => e.name == map["contrastMode"],
        orElse: () => ThemeContrastMode.light,
      ),
    );
  }

  SettingState copyWith({
    ThemeMode? themeMode,
    ThemeContrastMode? contrastMode,
  }) {
    return SettingState(
      themeMode: themeMode ?? this.themeMode,
      contrastMode: contrastMode ?? this.contrastMode,
    );
  }
}
