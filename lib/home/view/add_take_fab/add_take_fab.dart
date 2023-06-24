import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quick_takes/app_global/app_colors.dart';
import 'package:quick_takes/app_global/asset_images.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/app_global/widgets/custom_fab.dart';

class AddTakeFAB extends StatelessWidget {
  const AddTakeFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: context.screenHeight(80),
          right: context.screenCenter / 2.4,
          child: const Text('Tap here to add your first Take.'),
        ),
        Positioned(
          right: context.screenWidth(65),
          bottom: context.screenHeight(-50),
          height: context.screenHeight(60),
          child: Transform(
            transform: Matrix4.rotationX(pi),
            child: Image.asset(
              AssetImages.kForwardArrow,
              color: context.isDarkMode
                  ? AppColors.primaryLight.withOpacity(0.8)
                  : AppColors.primaryDark.withOpacity(0.6),
            ),
          ),
        ),
        CustomFAB(
          onTap: () {},
        ),
      ],
    );
  }
}