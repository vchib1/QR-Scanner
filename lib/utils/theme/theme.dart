import "package:ez_qr/utils/enums/theme_contrast.dart";
import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff616118),
      surfaceTint: Color(0xff616118),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffe8e78f),
      onPrimaryContainer: Color(0xff494900),
      secondary: Color(0xff606043),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe7e4bf),
      onSecondaryContainer: Color(0xff49482d),
      tertiary: Color(0xff3d6657),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbfecd8),
      onTertiaryContainer: Color(0xff254e40),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffdf9ec),
      onSurface: Color(0xff1c1c14),
      onSurfaceVariant: Color(0xff48473a),
      outline: Color(0xff797869),
      outlineVariant: Color(0xffcac7b6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313128),
      inversePrimary: Color(0xffcbcb76),
      primaryFixed: Color(0xffe8e78f),
      onPrimaryFixed: Color(0xff1d1d00),
      primaryFixedDim: Color(0xffcbcb76),
      onPrimaryFixedVariant: Color(0xff494900),
      secondaryFixed: Color(0xffe7e4bf),
      onSecondaryFixed: Color(0xff1d1d06),
      secondaryFixedDim: Color(0xffcac8a5),
      onSecondaryFixedVariant: Color(0xff49482d),
      tertiaryFixed: Color(0xffbfecd8),
      onTertiaryFixed: Color(0xff002117),
      tertiaryFixedDim: Color(0xffa4d0bd),
      onTertiaryFixedVariant: Color(0xff254e40),
      surfaceDim: Color(0xffdddacd),
      surfaceBright: Color(0xfffdf9ec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f4e6),
      surfaceContainer: Color(0xfff1eee0),
      surfaceContainerHigh: Color(0xffece8db),
      surfaceContainerHighest: Color(0xffe6e3d5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff383800),
      surfaceTint: Color(0xff616118),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff707026),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff38371e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6f6f50),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff133d2f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4c7565),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf9ec),
      onSurface: Color(0xff12110a),
      onSurfaceVariant: Color(0xff37372a),
      outline: Color(0xff545345),
      outlineVariant: Color(0xff6f6e5f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313128),
      inversePrimary: Color(0xffcbcb76),
      primaryFixed: Color(0xff707026),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff58580e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6f6f50),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff57563a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4c7565),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff345d4d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c7ba),
      surfaceBright: Color(0xfffdf9ec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f4e6),
      surfaceContainer: Color(0xffece8db),
      surfaceContainerHigh: Color(0xffe0ddd0),
      surfaceContainerHighest: Color(0xffd5d2c5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2e2e00),
      surfaceTint: Color(0xff616118),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4c4c01),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2d2d14),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4b4b2f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff053326),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff285142),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf9ec),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2d2d21),
      outlineVariant: Color(0xff4b4a3d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313128),
      inversePrimary: Color(0xffcbcb76),
      primaryFixed: Color(0xff4c4c01),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff353500),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4b4b2f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff34341a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff285142),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff0e3a2c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbcb9ac),
      surfaceBright: Color(0xfffdf9ec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f1e3),
      surfaceContainer: Color(0xffe6e3d5),
      surfaceContainerHigh: Color(0xffd8d4c8),
      surfaceContainerHighest: Color(0xffc9c7ba),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffcbcb76),
      surfaceTint: Color(0xffcbcb76),
      onPrimary: Color(0xff323200),
      primaryContainer: Color(0xff494900),
      onPrimaryContainer: Color(0xffe8e78f),
      secondary: Color(0xffcac8a5),
      onSecondary: Color(0xff323218),
      secondaryContainer: Color(0xff49482d),
      onSecondaryContainer: Color(0xffe7e4bf),
      tertiary: Color(0xffa4d0bd),
      onTertiary: Color(0xff0b372a),
      tertiaryContainer: Color(0xff254e40),
      onTertiaryContainer: Color(0xffbfecd8),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff14140c),
      onSurface: Color(0xffe6e3d5),
      onSurfaceVariant: Color(0xffcac7b6),
      outline: Color(0xff939182),
      outlineVariant: Color(0xff48473a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e3d5),
      inversePrimary: Color(0xff616118),
      primaryFixed: Color(0xffe8e78f),
      onPrimaryFixed: Color(0xff1d1d00),
      primaryFixedDim: Color(0xffcbcb76),
      onPrimaryFixedVariant: Color(0xff494900),
      secondaryFixed: Color(0xffe7e4bf),
      onSecondaryFixed: Color(0xff1d1d06),
      secondaryFixedDim: Color(0xffcac8a5),
      onSecondaryFixedVariant: Color(0xff49482d),
      tertiaryFixed: Color(0xffbfecd8),
      onTertiaryFixed: Color(0xff002117),
      tertiaryFixedDim: Color(0xffa4d0bd),
      onTertiaryFixedVariant: Color(0xff254e40),
      surfaceDim: Color(0xff14140c),
      surfaceBright: Color(0xff3a3a30),
      surfaceContainerLowest: Color(0xff0f0f07),
      surfaceContainerLow: Color(0xff1c1c14),
      surfaceContainer: Color(0xff202018),
      surfaceContainerHigh: Color(0xff2b2a22),
      surfaceContainerHighest: Color(0xff36352c),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe2e18a),
      surfaceTint: Color(0xffcbcb76),
      onPrimary: Color(0xff272700),
      primaryContainer: Color(0xff959446),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe0deb9),
      onSecondary: Color(0xff27270f),
      secondaryContainer: Color(0xff949272),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb9e6d2),
      onTertiary: Color(0xff002c1f),
      tertiaryContainer: Color(0xff6f9a88),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff14140c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe0ddcb),
      outline: Color(0xffb5b2a2),
      outlineVariant: Color(0xff939181),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e3d5),
      inversePrimary: Color(0xff4b4b00),
      primaryFixed: Color(0xffe8e78f),
      onPrimaryFixed: Color(0xff121200),
      primaryFixedDim: Color(0xffcbcb76),
      onPrimaryFixedVariant: Color(0xff383800),
      secondaryFixed: Color(0xffe7e4bf),
      onSecondaryFixed: Color(0xff121201),
      secondaryFixedDim: Color(0xffcac8a5),
      onSecondaryFixedVariant: Color(0xff38371e),
      tertiaryFixed: Color(0xffbfecd8),
      onTertiaryFixed: Color(0xff00150d),
      tertiaryFixedDim: Color(0xffa4d0bd),
      onTertiaryFixedVariant: Color(0xff133d2f),
      surfaceDim: Color(0xff14140c),
      surfaceBright: Color(0xff46453b),
      surfaceContainerLowest: Color(0xff080803),
      surfaceContainerLow: Color(0xff1e1e16),
      surfaceContainer: Color(0xff292820),
      surfaceContainerHigh: Color(0xff34332a),
      surfaceContainerHighest: Color(0xff3f3e35),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff6f59b),
      surfaceTint: Color(0xffcbcb76),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc8c773),
      onPrimaryContainer: Color(0xff0c0c00),
      secondary: Color(0xfff4f2cc),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc6c4a1),
      onSecondaryContainer: Color(0xff0c0c00),
      tertiary: Color(0xffcdfae5),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa0ccb9),
      onTertiaryContainer: Color(0xff000e08),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff14140c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff4f0de),
      outlineVariant: Color(0xffc6c3b2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e3d5),
      inversePrimary: Color(0xff4b4b00),
      primaryFixed: Color(0xffe8e78f),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffcbcb76),
      onPrimaryFixedVariant: Color(0xff121200),
      secondaryFixed: Color(0xffe7e4bf),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffcac8a5),
      onSecondaryFixedVariant: Color(0xff121201),
      tertiaryFixed: Color(0xffbfecd8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa4d0bd),
      onTertiaryFixedVariant: Color(0xff00150d),
      surfaceDim: Color(0xff14140c),
      surfaceBright: Color(0xff515046),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff202018),
      surfaceContainer: Color(0xff313128),
      surfaceContainerHigh: Color(0xff3d3c32),
      surfaceContainerHighest: Color(0xff48473d),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    listTileTheme: ListTileThemeData(
      tileColor: colorScheme.surfaceContainer,
      iconColor: colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: colorScheme.surfaceContainerHigh,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
  );

  ThemeData getLightThemeData(ThemeContrastMode contrast) {
    return switch (contrast) {
      ThemeContrastMode.light => MaterialTheme(textTheme).light(),
      ThemeContrastMode.medium =>
        MaterialTheme(textTheme).lightMediumContrast(),
      ThemeContrastMode.high => MaterialTheme(textTheme).lightHighContrast(),
    };
  }

  ThemeData getDarkThemeData(ThemeContrastMode contrast) {
    return switch (contrast) {
      ThemeContrastMode.light => MaterialTheme(textTheme).dark(),
      ThemeContrastMode.medium => MaterialTheme(textTheme).darkMediumContrast(),
      ThemeContrastMode.high => MaterialTheme(textTheme).darkHighContrast(),
    };
  }
}
