import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/app_colors.dart';
import 'package:quick_takes/app_global/asset_images.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/app_global/widgets/custom_fab.dart';
import 'package:quick_takes/home/view/new_take/new_take_view.dart';
import 'package:quick_takes/home/view_model/takes_view_model.dart';

class AddTakeFAB extends StatelessWidget {
  const AddTakeFAB({this.isTakeListEmpty = true, super.key});
  final bool isTakeListEmpty;

  @override
  Widget build(BuildContext context) {
    if (context.isLargeDevice) {
      return SizedBox(
        height: 50,
        child: ElevatedButton.icon(
          onPressed: () {
            context.read<TakesViewModel>().setTake(null);
          },
          style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
          icon: const Icon(
            Icons.add,
            size: 35,
            color: AppColors.primaryLight,
          ),
          label: const Text('Add New'),
        ),
      );
    }

    if (!isTakeListEmpty) {
      return CustomFAB(
        onTap: () => context.goNamed(TakeView.routeName),
      );
    }

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
          onTap: () => context.goNamed(TakeView.routeName),
        ),
      ],
    );
  }
}
