import 'package:flutter/material.dart';
import 'package:quick_takes/app_global/app_colors.dart';

class CustomFAB extends StatelessWidget {
  const CustomFAB({required this.onTap, this.heroTag, super.key});
  final VoidCallback onTap;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.2),
            offset: const Offset(5, 5),
            blurRadius: 5,
          ),
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.4),
            offset: const Offset(-2, 0),
            blurRadius: 6,
          ),
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      child: FloatingActionButton(
        onPressed: onTap,
        heroTag: heroTag,
        enableFeedback: true,
        elevation: 0,
        child: const Icon(
          Icons.add,
          size: 35,
          color: AppColors.primaryLight,
        ),
      ),
    );
  }
}
