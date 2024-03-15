import 'package:flutter/material.dart';

class MainTheme {
  static double get fontSizeLarge => 22;

  static double get fontSizeMedium => 18;

  static double get fontSizeSmall => 14;

  static double get spacing => 10;

  static double get radiusMedium => 12;

  static ColorScheme get lightTheme => const ColorScheme(
        background: Color(0xFFDFF5FF),
        brightness: Brightness.light,
        onPrimary: Color(0xFF161A30),
        primary: Color(0xFF5356FF),
        onSecondary: Color(0xFFDFF5FF),
        secondary: Color(0xFFFB743E),
        error: Color(0xFFFFA18A),
        onError: Color(0xFFFFF3E2),
        onBackground: Color(0xFF161A30),
        surface: Color(0xFF5356FF),
        onSurface: Color(0xFF161A30),
        surfaceTint: Color(0xFFFAFAFA),
        tertiary:  Color(0xFFFFD54F),
      );
}
