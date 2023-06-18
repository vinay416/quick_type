import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quick_takes/global/app_colors.dart';

class BlurWidget extends StatelessWidget {
  const BlurWidget({
    required this.height,
    required this.width,
    required this.child,
    this.borderRadius,
    this.gradients,
    super.key,
  });
  final double height;
  final double width;
  final BorderRadius? borderRadius;
  final List<Color>? gradients;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withOpacity(0.08)
                  : Colors.white.withOpacity(0.0),
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5, 4),
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                ),
                BoxShadow(
                  offset: const Offset(-2, -2),
                  color: isDark
                      ? Colors.black.withOpacity(0.1)
                      : Colors.white.withOpacity(0.1),
                  blurRadius: 5,
                )
              ],
            ),
          ),
          ClipRRect(
            borderRadius: borderRadius,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
