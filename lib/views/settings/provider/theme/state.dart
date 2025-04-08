import 'package:ez_qr/utils/enums/theme_contrast.dart';
import 'package:flutter/material.dart';

class ThemeState {
  final ThemeMode themeMode;
  final ThemeContrastMode contrastMode;

  const ThemeState({
    this.themeMode = ThemeMode.system,
    this.contrastMode = ThemeContrastMode.light,
  });

  Map<String, dynamic> toJson() {
    return {"themeMode": themeMode.name, "contrastMode": contrastMode.name};
  }

  factory ThemeState.fromJson(Map<String, dynamic> map) {
    return ThemeState(
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

  ThemeState copyWith({
    ThemeMode? themeMode,
    ThemeContrastMode? contrastMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      contrastMode: contrastMode ?? this.contrastMode,
    );
  }
}
