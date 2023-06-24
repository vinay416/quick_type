import 'package:flutter/material.dart';
import 'package:quick_takes/app_global/app_colors.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: const [
            0.3,
            1.0,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            context.isDarkMode ? Colors.black87 : Colors.white,
            AppColors.secondary,
          ],
        ),
      ),
    );
  }
}
