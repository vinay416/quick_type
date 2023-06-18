import 'package:flutter/material.dart';

class AppTheme {
  final secondaryColor = const Color(0xFFF76967);

  ThemeData get lightTheme {
    final theme = ThemeData(
      colorScheme: ColorScheme.light(
        primary: secondaryColor,
        secondary: secondaryColor,
      ),
    );
    return theme;
  }

  ThemeData get darkTheme {
    final theme = ThemeData(
      colorScheme: ColorScheme.dark(
        secondary: secondaryColor,
      ),
    );
    return theme;
  }
}
