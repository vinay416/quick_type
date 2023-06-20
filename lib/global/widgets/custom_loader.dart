import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:quick_takes/global/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({this.size = 20, super.key});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: const LoadingIndicator(
        indicatorType: Indicator.circleStrokeSpin,
        colors: [
          AppColors.secondary,
        ],
      ),
    );
  }
}
