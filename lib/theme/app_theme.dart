import 'package:flutter/material.dart';
import 'package:quick_takes/app_global/app_colors.dart';

class AppTheme {
  final secondaryColor = AppColors.secondary;

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
        primary: secondaryColor,
        secondary: secondaryColor,
      ),
    );
    return theme;
  }
}
