import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/firebase_options.dart';
import 'package:quick_takes/app_router.dart';
import 'package:quick_takes/providers.dart';
import 'package:quick_takes/theme/view_model/app_theme_view_model.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      await DesktopWindow.setWindowSize(const Size(1137.0, 761.0));
      await DesktopWindow.setMinWindowSize(const Size(1055.0, 698.0));
    }
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  globalPrefs = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MainApp());
}

late SharedPreferences globalPrefs;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Providers(
      child: Consumer<AppThemeViewModel>(
        builder: (context, viewModel, _) {
          final themeMode = viewModel.themeMode;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.instance.config,
            theme: viewModel.lightTheme,
            darkTheme: viewModel.darkTheme,
            themeMode: themeMode,
            builder: (context, child) {
              return ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 914, name: TABLET),
                  const Breakpoint(start: 915, end: 1920, name: DESKTOP),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
