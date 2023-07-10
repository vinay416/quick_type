import 'package:flutter/material.dart';
import 'package:quick_takes/app_global/app_colors.dart';

class AppTheme {
  final secondaryColor = AppColors.secondary;

  ThemeData get lightTheme {
    final theme = ThemeData(
      appBarTheme: AppBarTheme(
        foregroundColor: AppColors.primaryDark,
        backgroundColor: Colors.grey[300],
      ),
      scaffoldBackgroundColor: AppColors.primaryLight,
      colorScheme: ColorScheme.light(
        primary: secondaryColor,
        secondary: secondaryColor,
      ),
    );
    return theme;
  }

  ThemeData get darkTheme {
    final theme = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryDark,
      colorScheme: ColorScheme.dark(
        primary: secondaryColor,
        secondary: secondaryColor,
      ),
    );
    return theme;
  }
}
