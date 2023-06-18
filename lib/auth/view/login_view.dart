import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quick_takes/global/app_colors.dart';
import 'package:quick_takes/global/asset_images.dart';
import 'package:quick_takes/global/widgets/blur_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [
                  0.3,
                  1.0,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  isDark ? Colors.black87 : Colors.white,
                  AppColors.secondary,
                ],
              ),
            ),
          ),
          loginCardDesign,
        ],
      ),
    );
  }

  Widget get loginCardDesign {
    return Center(
      child: BlurWidget(
        borderRadius: BorderRadius.circular(20),
        height: 400,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login'),
            Text(
                'Sync all your important notes across devices with same login for seamless experience.')
          ],
        ),
      ),
    );
  }
}
