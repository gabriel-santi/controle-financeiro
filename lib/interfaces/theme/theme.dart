import 'package:flutter/material.dart';

class MainTheme {
  static double get fontSizeLarge => 22;

  static double get fontSizeMedium => 18;

  static double get fontSizeSmall => 14;

  static double get spacing => 10;

  static double get radiusBig => 20;

  static double get radiusMedium => 12;

  static double get radiusSmall => 8;

  static ColorScheme get lightTheme => const ColorScheme(
        background: Color(0xFFEEF3FA),
        brightness: Brightness.light,
        onPrimary: Color(0xFF373941),
        primary: Color(0xFF7152EE),
        onSecondary: Color(0xFFDFF5FF),
        secondary: Color(0xFFFCFCFC),
        error: Color(0xFFFFA18A),
        onError: Color(0xFFFFF3E2),
        onBackground: Color(0xFF161A30),
        surface: Color(0xFFADAEFF),
        onSurface: Color(0xFF161A30),
        surfaceTint: Color(0xFFFCFCFC),
        tertiary: Color(0xFFFFD54F),
        inversePrimary: Color(0xFF6EFF4C),
        shadow: Color(0x50000000),
      );
}
