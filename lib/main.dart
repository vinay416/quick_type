import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_takes/firebase_options.dart';
import 'package:quick_takes/providers.dart';
import 'package:quick_takes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Providers(
      child: MaterialApp.router(
        routerConfig: AppRouter.instance.config,
      ),
    );
  }
}
