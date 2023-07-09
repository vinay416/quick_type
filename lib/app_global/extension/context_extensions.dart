import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:quick_takes/app_router.dart';

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
}

extension DoubleExtension on double {
  double get w {
    final context = AppRouter.navigatorKey.currentContext!;
    return context.screenWidth * this;
  }

  double get h {
    final context = AppRouter.navigatorKey.currentContext!;
    return context.screenHeight * this;
  }
}
