import 'package:flutter/material.dart';

extension CustomContext on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }

  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  double pixelWidth(double pixel) {
    final screenWidth = MediaQuery.of(this).size.width;
    final ratio = (pixel / _xdWidth * 100).roundToDouble() / 100;
    final size = screenWidth * ratio;
    return size;
  }

  double pixelHeight(double pixel) {
    final screenHeight = MediaQuery.of(this).size.height;
    final ratio = (pixel / _xdHeight * 100).roundToDouble() / 100;
    final size = screenHeight * ratio;
    return size;
  }

  double get _xdHeight {
    const iphoneXdHeight = 932.0;
    const androidXdHeight = 860.0;
    const smallXdHeight = 870.0;
    const largeXdHeight = 738.0;

    final aspectRatio = MediaQuery.of(this).size.aspectRatio;

    switch (aspectRatio) {
      case iphoneProRatio:
        return iphoneXdHeight;
      case androidRatio:
        return androidXdHeight;
      case smallRatio:
        return smallXdHeight;
      default:
        return largeXdHeight;
    }
  }

  double get _xdWidth {
    const iphoneXdWidth = 430.0;
    const androidXdWidth = 392.0;
    const smallXdWidth = 375.0;
    const largeXdWidth = 1428.0;

    final aspectRatio = MediaQuery.of(this).size.aspectRatio;
    switch (aspectRatio) {
      case iphoneProRatio:
        return iphoneXdWidth;
      case androidRatio:
        return androidXdWidth;
      case smallRatio:
        return smallXdWidth;
      default:
        return largeXdWidth;
    }
  }

  static const iphoneProRatio = 0.4613733905579399;
  static const androidRatio = 0.5013927576601672;
  static const smallRatio = 0.5622188905547226;
}
