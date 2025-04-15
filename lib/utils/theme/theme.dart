import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4a5c92),
      surfaceTint: Color(0xff4a5c92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffdbe1ff),
      onPrimaryContainer: Color(0xff324578),
      secondary: Color(0xff585e72),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdde1f9),
      onSecondaryContainer: Color(0xff414659),
      tertiary: Color(0xff745471),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd6f8),
      onTertiaryContainer: Color(0xff5a3d58),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff1a1b21),
      onSurfaceVariant: Color(0xff45464f),
      outline: Color(0xff757680),
      outlineVariant: Color(0xffc5c6d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inversePrimary: Color(0xffb3c5ff),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff00184a),
      primaryFixedDim: Color(0xffb3c5ff),
      onPrimaryFixedVariant: Color(0xff324578),
      secondaryFixed: Color(0xffdde1f9),
      onSecondaryFixed: Color(0xff151b2c),
      secondaryFixedDim: Color(0xffc1c6dd),
      onSecondaryFixedVariant: Color(0xff414659),
      tertiaryFixed: Color(0xffffd6f8),
      onTertiaryFixed: Color(0xff2b122b),
      tertiaryFixedDim: Color(0xffe2bbdc),
      onTertiaryFixedVariant: Color(0xff5a3d58),
      surfaceDim: Color(0xffdad9e0),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f3fa),
      surfaceContainer: Color(0xffeeedf4),
      surfaceContainerHigh: Color(0xffe8e7ef),
      surfaceContainerHighest: Color(0xffe3e2e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff203467),
      surfaceTint: Color(0xff4a5c92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff596ba2),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff303648),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff676c81),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff482d47),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff836380),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff101116),
      onSurfaceVariant: Color(0xff34363e),
      outline: Color(0xff50525b),
      outlineVariant: Color(0xff6b6c75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inversePrimary: Color(0xffb3c5ff),
      primaryFixed: Color(0xff596ba2),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff405388),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff676c81),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4f5468),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff836380),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff694b67),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6c6cd),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f3fa),
      surfaceContainer: Color(0xffe8e7ef),
      surfaceContainerHigh: Color(0xffdddce3),
      surfaceContainerHighest: Color(0xffd2d1d8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff14295c),
      surfaceTint: Color(0xff4a5c92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff34477b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff262c3d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff43495b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3d233c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5d3f5b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2a2c34),
      outlineVariant: Color(0xff474951),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3036),
      inversePrimary: Color(0xffb3c5ff),
      primaryFixed: Color(0xff34477b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff1c3063),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff43495b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2d3244),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5d3f5b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff442943),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb9b8bf),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f0f7),
      surfaceContainer: Color(0xffe3e2e9),
      surfaceContainerHigh: Color(0xffd4d4db),
      surfaceContainerHighest: Color(0xffc6c6cd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb3c5ff),
      surfaceTint: Color(0xffb3c5ff),
      onPrimary: Color(0xff192e60),
      primaryContainer: Color(0xff324578),
      onPrimaryContainer: Color(0xffdbe1ff),
      secondary: Color(0xffc1c6dd),
      onSecondary: Color(0xff2a3042),
      secondaryContainer: Color(0xff414659),
      onSecondaryContainer: Color(0xffdde1f9),
      tertiary: Color(0xffe2bbdc),
      onTertiary: Color(0xff422741),
      tertiaryContainer: Color(0xff5a3d58),
      onTertiaryContainer: Color(0xffffd6f8),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff121318),
      onSurface: Color(0xffe3e2e9),
      onSurfaceVariant: Color(0xffc5c6d0),
      outline: Color(0xff8f909a),
      outlineVariant: Color(0xff45464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e2e9),
      inversePrimary: Color(0xff4a5c92),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff00184a),
      primaryFixedDim: Color(0xffb3c5ff),
      onPrimaryFixedVariant: Color(0xff324578),
      secondaryFixed: Color(0xffdde1f9),
      onSecondaryFixed: Color(0xff151b2c),
      secondaryFixedDim: Color(0xffc1c6dd),
      onSecondaryFixedVariant: Color(0xff414659),
      tertiaryFixed: Color(0xffffd6f8),
      onTertiaryFixed: Color(0xff2b122b),
      tertiaryFixedDim: Color(0xffe2bbdc),
      onTertiaryFixedVariant: Color(0xff5a3d58),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff38393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1a1b21),
      surfaceContainer: Color(0xff1e1f25),
      surfaceContainerHigh: Color(0xff292a2f),
      surfaceContainerHighest: Color(0xff33343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd2dbff),
      surfaceTint: Color(0xffb3c5ff),
      onPrimary: Color(0xff0c2255),
      primaryContainer: Color(0xff7d8fc8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd7dbf3),
      onSecondary: Color(0xff202536),
      secondaryContainer: Color(0xff8b90a5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff8d0f2),
      onTertiary: Color(0xff361c36),
      tertiaryContainer: Color(0xffa986a5),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff121318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdbdbe6),
      outline: Color(0xffb1b1bb),
      outlineVariant: Color(0xff8f9099),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e2e9),
      inversePrimary: Color(0xff33467a),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff000e34),
      primaryFixedDim: Color(0xffb3c5ff),
      onPrimaryFixedVariant: Color(0xff203467),
      secondaryFixed: Color(0xffdde1f9),
      onSecondaryFixed: Color(0xff0b1021),
      secondaryFixedDim: Color(0xffc1c6dd),
      onSecondaryFixedVariant: Color(0xff303648),
      tertiaryFixed: Color(0xffffd6f8),
      onTertiaryFixed: Color(0xff1f0820),
      tertiaryFixedDim: Color(0xffe2bbdc),
      onTertiaryFixedVariant: Color(0xff482d47),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff43444a),
      surfaceContainerLowest: Color(0xff06070c),
      surfaceContainerLow: Color(0xff1c1d23),
      surfaceContainer: Color(0xff26282d),
      surfaceContainerHigh: Color(0xff313238),
      surfaceContainerHighest: Color(0xff3c3d43),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffedefff),
      surfaceTint: Color(0xffb3c5ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffaec1fd),
      onPrimaryContainer: Color(0xff000927),
      secondary: Color(0xffedefff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbdc2d9),
      onSecondaryContainer: Color(0xff050a1b),
      tertiary: Color(0xffffeaf9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffddb7d8),
      onTertiaryContainer: Color(0xff19031a),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff121318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffefeffa),
      outlineVariant: Color(0xffc1c2cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e2e9),
      inversePrimary: Color(0xff33467a),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb3c5ff),
      onPrimaryFixedVariant: Color(0xff000e34),
      secondaryFixed: Color(0xffdde1f9),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc1c6dd),
      onSecondaryFixedVariant: Color(0xff0b1021),
      tertiaryFixed: Color(0xffffd6f8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe2bbdc),
      onTertiaryFixedVariant: Color(0xff1f0820),
      surfaceDim: Color(0xff121318),
      surfaceBright: Color(0xff4f5056),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1e1f25),
      surfaceContainer: Color(0xff2f3036),
      surfaceContainerHigh: Color(0xff3a3b41),
      surfaceContainerHighest: Color(0xff46464c),
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

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
