import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_takes/app_global/app_colors.dart';
import 'package:quick_takes/app_global/asset_images.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/app_global/widgets/custom_fab.dart';
import 'package:quick_takes/home/view/new_take/new_take_view.dart';

class AddTakeFAB extends StatelessWidget {
  const AddTakeFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: 0.1.h,
          right: -0.05.w,
          child: SizedBox(
            width: context.screenWidth,
            child: const Center(
              child: Text('Tap here to add your first Take.'),
            ),
          ),
        ),
        Positioned(
          right: 0.16.w,
          bottom: -0.09.h,
          height: 0.09.h,
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
          onTap: () => context.goNamed(NewTakeView.routeName),
        ),
      ],
    );
  }
}
