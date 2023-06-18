import 'package:flutter/material.dart';
import 'package:quick_takes/main.dart';
import 'package:quick_takes/theme/app_theme.dart';

const String _themeKey = 'appTheme';

class AppThemeViewModel extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;
  final AppTheme _appTheme = AppTheme();

  ThemeData get lightTheme => _appTheme.lightTheme;

  ThemeData get darkTheme => _appTheme.darkTheme;

  ThemeMode get themeMode {
    final theme = globalPrefs.getString(_themeKey);
    switch (theme) {
      case 'light':
        _themeMode = ThemeMode.light;
        break;
      default:
        return _themeMode;
    }
    return _themeMode;
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    _themeMode = themeMode;
    notifyListeners();
    final success = await globalPrefs.setString(
      _themeKey,
      themeMode.name,
    );
    debugPrint('theme change to ${_themeMode.name} saved $success');
  }
}
