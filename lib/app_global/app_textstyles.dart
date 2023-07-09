import 'package:flutter/material.dart';
import 'package:quick_takes/app_global/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle get titleLarge => const TextStyle(
        fontSize: 55,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get title => const TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get descprition => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get button => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get subTitle => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      );

  static TextStyle get action => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.secondary,
      );
}
