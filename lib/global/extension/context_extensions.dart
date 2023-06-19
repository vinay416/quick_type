import 'package:flutter/material.dart';

extension CustomContext on BuildContext{
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }

}