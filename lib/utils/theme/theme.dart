import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8c4a60),
      surfaceTint: Color(0xff8c4a60),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffd9e2),
      onPrimaryContainer: Color(0xff703349),
      secondary: Color(0xff74565f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffd9e2),
      onSecondaryContainer: Color(0xff5a3f47),
      tertiary: Color(0xff7c5635),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdcc2),
      onTertiaryContainer: Color(0xff623f20),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff22191c),
      onSurfaceVariant: Color(0xff514347),
      outline: Color(0xff837377),
      outlineVariant: Color(0xffd5c2c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372e30),
      inversePrimary: Color(0xffffb0c8),
      primaryFixed: Color(0xffffd9e2),
      onPrimaryFixed: Color(0xff3a071d),
      primaryFixedDim: Color(0xffffb0c8),
      onPrimaryFixedVariant: Color(0xff703349),
      secondaryFixed: Color(0xffffd9e2),
      onSecondaryFixed: Color(0xff2b151c),
      secondaryFixedDim: Color(0xffe3bdc6),
      onSecondaryFixedVariant: Color(0xff5a3f47),
      tertiaryFixed: Color(0xffffdcc2),
      onTertiaryFixed: Color(0xff2e1500),
      tertiaryFixedDim: Color(0xffefbd94),
      onTertiaryFixedVariant: Color(0xff623f20),
      surfaceDim: Color(0xffe6d6d9),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f2),
      surfaceContainer: Color(0xfffaeaed),
      surfaceContainerHigh: Color(0xfff5e4e7),
      surfaceContainerHighest: Color(0xffefdfe1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5b2238),
      surfaceTint: Color(0xff8c4a60),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9d586f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff482f37),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff84656d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4e2f11),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8d6542),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff170f11),
      onSurfaceVariant: Color(0xff403336),
      outline: Color(0xff5d4f52),
      outlineVariant: Color(0xff79696d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372e30),
      inversePrimary: Color(0xffffb0c8),
      primaryFixed: Color(0xff9d586f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff804057),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff84656d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6a4d55),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8d6542),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff724d2c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd2c3c5),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f2),
      surfaceContainer: Color(0xfff5e4e7),
      surfaceContainerHigh: Color(0xffe9d9dc),
      surfaceContainerHighest: Color(0xffddced1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4f182e),
      surfaceTint: Color(0xff8c4a60),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff72354b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3d252d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5d424a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff432508),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff644122),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff35292c),
      outlineVariant: Color(0xff544649),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff372e30),
      inversePrimary: Color(0xffffb0c8),
      primaryFixed: Color(0xff72354b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff571f34),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5d424a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff442c33),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff644122),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4a2b0e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc4b5b8),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdedef),
      surfaceContainer: Color(0xffefdfe1),
      surfaceContainerHigh: Color(0xffe0d1d3),
      surfaceContainerHighest: Color(0xffd2c3c5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb0c8),
      surfaceTint: Color(0xffffb0c8),
      onPrimary: Color(0xff541d32),
      primaryContainer: Color(0xff703349),
      onPrimaryContainer: Color(0xffffd9e2),
      secondary: Color(0xffe3bdc6),
      onSecondary: Color(0xff422931),
      secondaryContainer: Color(0xff5a3f47),
      onSecondaryContainer: Color(0xffffd9e2),
      tertiary: Color(0xffefbd94),
      onTertiary: Color(0xff48290c),
      tertiaryContainer: Color(0xff623f20),
      onTertiaryContainer: Color(0xffffdcc2),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff191113),
      onSurface: Color(0xffefdfe1),
      onSurfaceVariant: Color(0xffd5c2c6),
      outline: Color(0xff9e8c90),
      outlineVariant: Color(0xff514347),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefdfe1),
      inversePrimary: Color(0xff8c4a60),
      primaryFixed: Color(0xffffd9e2),
      onPrimaryFixed: Color(0xff3a071d),
      primaryFixedDim: Color(0xffffb0c8),
      onPrimaryFixedVariant: Color(0xff703349),
      secondaryFixed: Color(0xffffd9e2),
      onSecondaryFixed: Color(0xff2b151c),
      secondaryFixedDim: Color(0xffe3bdc6),
      onSecondaryFixedVariant: Color(0xff5a3f47),
      tertiaryFixed: Color(0xffffdcc2),
      onTertiaryFixed: Color(0xff2e1500),
      tertiaryFixedDim: Color(0xffefbd94),
      onTertiaryFixedVariant: Color(0xff623f20),
      surfaceDim: Color(0xff191113),
      surfaceBright: Color(0xff413739),
      surfaceContainerLowest: Color(0xff140c0e),
      surfaceContainerLow: Color(0xff22191c),
      surfaceContainer: Color(0xff261d20),
      surfaceContainerHigh: Color(0xff31282a),
      surfaceContainerHighest: Color(0xff3c3235),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd0dd),
      surfaceTint: Color(0xffffb0c8),
      onPrimary: Color(0xff471227),
      primaryContainer: Color(0xffc67b93),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff9d2dc),
      onSecondary: Color(0xff361f26),
      secondaryContainer: Color(0xffaa8891),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd4b3),
      onTertiary: Color(0xff3b1f03),
      tertiaryContainer: Color(0xffb48862),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff191113),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffecd7db),
      outline: Color(0xffc0adb1),
      outlineVariant: Color(0xff9d8c90),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefdfe1),
      inversePrimary: Color(0xff71344a),
      primaryFixed: Color(0xffffd9e2),
      onPrimaryFixed: Color(0xff2b0013),
      primaryFixedDim: Color(0xffffb0c8),
      onPrimaryFixedVariant: Color(0xff5b2238),
      secondaryFixed: Color(0xffffd9e2),
      onSecondaryFixed: Color(0xff1f0b12),
      secondaryFixedDim: Color(0xffe3bdc6),
      onSecondaryFixedVariant: Color(0xff482f37),
      tertiaryFixed: Color(0xffffdcc2),
      onTertiaryFixed: Color(0xff1f0c00),
      tertiaryFixedDim: Color(0xffefbd94),
      onTertiaryFixedVariant: Color(0xff4e2f11),
      surfaceDim: Color(0xff191113),
      surfaceBright: Color(0xff4c4244),
      surfaceContainerLowest: Color(0xff0c0607),
      surfaceContainerLow: Color(0xff241b1e),
      surfaceContainer: Color(0xff2f2628),
      surfaceContainerHigh: Color(0xff3a3032),
      surfaceContainerHighest: Color(0xff453b3d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffebef),
      surfaceTint: Color(0xffffb0c8),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfffeabc5),
      onPrimaryContainer: Color(0xff20000c),
      secondary: Color(0xffffebef),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffdeb9c3),
      onSecondaryContainer: Color(0xff18060c),
      tertiary: Color(0xffffede0),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffebb990),
      onTertiaryContainer: Color(0xff160800),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff191113),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffebef),
      outlineVariant: Color(0xffd1bec2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefdfe1),
      inversePrimary: Color(0xff71344a),
      primaryFixed: Color(0xffffd9e2),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb0c8),
      onPrimaryFixedVariant: Color(0xff2b0013),
      secondaryFixed: Color(0xffffd9e2),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe3bdc6),
      onSecondaryFixedVariant: Color(0xff1f0b12),
      tertiaryFixed: Color(0xffffdcc2),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffefbd94),
      onTertiaryFixedVariant: Color(0xff1f0c00),
      surfaceDim: Color(0xff191113),
      surfaceBright: Color(0xff584d50),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff261d20),
      surfaceContainer: Color(0xff372e30),
      surfaceContainerHigh: Color(0xff43393b),
      surfaceContainerHighest: Color(0xff4f4446),
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
