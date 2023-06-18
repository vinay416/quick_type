import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/theme/view_model/app_theme_view_model.dart';

class AppThemeSwitch extends StatelessWidget {
  const AppThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeViewModel>(
      builder: (context, viewModel, _) {
        final thememode = viewModel.themeMode;
        final bool isDarkMode = thememode == ThemeMode.dark;
        return Switch.adaptive(
          value: isDarkMode,
          onChanged: (value) {
            final theme = value ? ThemeMode.dark : ThemeMode.light;
            viewModel.changeTheme(theme);
          },
        );
      },
    );
  }
}
