import 'package:flutter/material.dart';

class MainTheme {
  static double get fontSizeLarge => 22;

  static double get fontSizeMedium => 18;

  static double get fontSizeSmall => 14;

  static double get radiusBig => 20;

  static double get radiusMedium => 12;

  static double get radiusSmall => 8;

  static ColorScheme get lightTheme => const ColorScheme(
        brightness: Brightness.light,
        onPrimary: Color(0xFFFFFFFF),
        primary: Color(0xFF7152EE),
        onSecondary: Color(0xFF1B0035),
        secondary: Color(0xFFFCFCFC),
        onSecondaryContainer: Color(0xFF402E6B),
        error: Color(0xFFF68576),
        onError: Color(0xFFFFF3E2),
        onBackground: Color(0xFF161A30),
        surface: Color(0xFF140F24),
        onSurface: Color(0xFFFFFFFF),
        surfaceTint: Color(0xFFFCFCFC),
        tertiary: Color(0xFFFFD54F),
        inversePrimary: Color(0xFF6EFF4C),
        shadow: Color(0x50000000),
      );
}
