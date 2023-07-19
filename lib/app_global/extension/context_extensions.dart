import 'package:flutter/material.dart';
import 'package:quick_takes/app_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

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

  bool get isLargeDevice {
    final landscape = MediaQuery.of(this).orientation == Orientation.landscape;
    final isTab = ResponsiveBreakpoints.of(this).equals(TABLET);
    final bool tabLandscape = landscape && isTab;
    final isDeskstop = ResponsiveBreakpoints.of(this).largerOrEqualTo(DESKTOP);
    return tabLandscape || isDeskstop;
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
