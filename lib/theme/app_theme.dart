import 'package:flutter/material.dart';
import 'package:quick_takes/global/app_colors.dart';

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
        secondary: secondaryColor,
      ),
    );
    return theme;
  }
}
