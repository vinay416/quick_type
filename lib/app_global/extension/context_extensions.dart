import 'package:flutter/material.dart';

extension CustomContext on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }

  double get screenCenter {
    return MediaQuery.of(this).size.width / 2;
  }

  double screenWidth(double pixel) {
    final sceenWidth = MediaQuery.of(this).size.width;
    return (pixel / sceenWidth) * sceenWidth;
  }

  double screenHeight(double pixel) {
    final screenHeight = MediaQuery.of(this).size.height;
    return (pixel / screenHeight) * screenHeight;
  }
}
