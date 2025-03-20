import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff904a47),
      surfaceTint: Color(0xff904a47),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdad7),
      onPrimaryContainer: Color(0xff733331),
      secondary: Color(0xff775654),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdad7),
      onSecondaryContainer: Color(0xff5d3f3d),
      tertiary: Color(0xff735b2e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdea8),
      onTertiaryContainer: Color(0xff594319),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff231919),
      onSurfaceVariant: Color(0xff534342),
      outline: Color(0xff857371),
      outlineVariant: Color(0xffd8c2c0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2d),
      inversePrimary: Color(0xffffb3af),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff3b080a),
      primaryFixedDim: Color(0xffffb3af),
      onPrimaryFixedVariant: Color(0xff733331),
      secondaryFixed: Color(0xffffdad7),
      onSecondaryFixed: Color(0xff2c1514),
      secondaryFixedDim: Color(0xffe7bdba),
      onSecondaryFixedVariant: Color(0xff5d3f3d),
      tertiaryFixed: Color(0xffffdea8),
      onTertiaryFixed: Color(0xff271900),
      tertiaryFixedDim: Color(0xffe2c28c),
      onTertiaryFixedVariant: Color(0xff594319),
      surfaceDim: Color(0xffe8d6d4),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfffceae8),
      surfaceContainerHigh: Color(0xfff6e4e2),
      surfaceContainerHighest: Color(0xfff1dedd),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5e2322),
      surfaceTint: Color(0xff904a47),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa15855),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4b2f2d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff876562),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff473309),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff83693b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff170f0e),
      onSurfaceVariant: Color(0xff413332),
      outline: Color(0xff5f4f4d),
      outlineVariant: Color(0xff7b6968),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2d),
      inversePrimary: Color(0xffffb3af),
      primaryFixed: Color(0xffa15855),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff84413e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff876562),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6c4d4b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff83693b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff685126),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd4c3c1),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ef),
      surfaceContainer: Color(0xfff6e4e2),
      surfaceContainerHigh: Color(0xffebd9d7),
      surfaceContainerHighest: Color(0xffdfcecc),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff511919),
      surfaceTint: Color(0xff904a47),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff763533),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3f2524),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff604140),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3c2902),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5c461b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff362928),
      outlineVariant: Color(0xff554544),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2d),
      inversePrimary: Color(0xffffb3af),
      primaryFixed: Color(0xff763533),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff59201f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff604140),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff472b2a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5c461b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff432f06),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6b5b4),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffedeb),
      surfaceContainer: Color(0xfff1dedd),
      surfaceContainerHigh: Color(0xffe2d0cf),
      surfaceContainerHighest: Color(0xffd4c3c1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb3af),
      surfaceTint: Color(0xffffb3af),
      onPrimary: Color(0xff571d1c),
      primaryContainer: Color(0xff733331),
      onPrimaryContainer: Color(0xffffdad7),
      secondary: Color(0xffe7bdba),
      onSecondary: Color(0xff442928),
      secondaryContainer: Color(0xff5d3f3d),
      onSecondaryContainer: Color(0xffffdad7),
      tertiary: Color(0xffe2c28c),
      onTertiary: Color(0xff402d05),
      tertiaryContainer: Color(0xff594319),
      onTertiaryContainer: Color(0xffffdea8),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a1111),
      onSurface: Color(0xfff1dedd),
      onSurfaceVariant: Color(0xffd8c2c0),
      outline: Color(0xffa08c8b),
      outlineVariant: Color(0xff534342),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedd),
      inversePrimary: Color(0xff904a47),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff3b080a),
      primaryFixedDim: Color(0xffffb3af),
      onPrimaryFixedVariant: Color(0xff733331),
      secondaryFixed: Color(0xffffdad7),
      onSecondaryFixed: Color(0xff2c1514),
      secondaryFixedDim: Color(0xffe7bdba),
      onSecondaryFixedVariant: Color(0xff5d3f3d),
      tertiaryFixed: Color(0xffffdea8),
      onTertiaryFixed: Color(0xff271900),
      tertiaryFixedDim: Color(0xffe2c28c),
      onTertiaryFixedVariant: Color(0xff594319),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff423736),
      surfaceContainerLowest: Color(0xff140c0c),
      surfaceContainerLow: Color(0xff231919),
      surfaceContainer: Color(0xff271d1d),
      surfaceContainerHigh: Color(0xff322827),
      surfaceContainerHighest: Color(0xff3d3231),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd2ce),
      surfaceTint: Color(0xffffb3af),
      onPrimary: Color(0xff481313),
      primaryContainer: Color(0xffcb7b76),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffed2cf),
      onSecondary: Color(0xff381f1d),
      secondaryContainer: Color(0xffad8885),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff9d8a0),
      onTertiary: Color(0xff342200),
      tertiaryContainer: Color(0xffa98d5b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1a1111),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffeed7d5),
      outline: Color(0xffc2adab),
      outlineVariant: Color(0xff9f8c8a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedd),
      inversePrimary: Color(0xff743432),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff2c0103),
      primaryFixedDim: Color(0xffffb3af),
      onPrimaryFixedVariant: Color(0xff5e2322),
      secondaryFixed: Color(0xffffdad7),
      onSecondaryFixed: Color(0xff200b0a),
      secondaryFixedDim: Color(0xffe7bdba),
      onSecondaryFixedVariant: Color(0xff4b2f2d),
      tertiaryFixed: Color(0xffffdea8),
      onTertiaryFixed: Color(0xff1a0f00),
      tertiaryFixedDim: Color(0xffe2c28c),
      onTertiaryFixedVariant: Color(0xff473309),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff4d4241),
      surfaceContainerLowest: Color(0xff0d0605),
      surfaceContainerLow: Color(0xff251b1b),
      surfaceContainer: Color(0xff302525),
      surfaceContainerHigh: Color(0xff3b302f),
      surfaceContainerHighest: Color(0xff463b3a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffecea),
      surfaceTint: Color(0xffffb3af),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffaea9),
      onPrimaryContainer: Color(0xff220001),
      secondary: Color(0xffffecea),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe2b9b6),
      onSecondaryContainer: Color(0xff190605),
      tertiary: Color(0xffffeed5),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffdebe89),
      onTertiaryContainer: Color(0xff120a00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1a1111),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffecea),
      outlineVariant: Color(0xffd4bebc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedd),
      inversePrimary: Color(0xff743432),
      primaryFixed: Color(0xffffdad7),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb3af),
      onPrimaryFixedVariant: Color(0xff2c0103),
      secondaryFixed: Color(0xffffdad7),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe7bdba),
      onSecondaryFixedVariant: Color(0xff200b0a),
      tertiaryFixed: Color(0xffffdea8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe2c28c),
      onTertiaryFixedVariant: Color(0xff1a0f00),
      surfaceDim: Color(0xff1a1111),
      surfaceBright: Color(0xff594d4c),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff271d1d),
      surfaceContainer: Color(0xff382e2d),
      surfaceContainerHigh: Color(0xff443938),
      surfaceContainerHighest: Color(0xff504443),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
