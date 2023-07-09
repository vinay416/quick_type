import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/firebase_options.dart';
import 'package:quick_takes/providers.dart';
import 'package:quick_takes/app_router.dart';
import 'package:quick_takes/theme/view_model/app_theme_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          );
        },
      ),
    );
  }
}
