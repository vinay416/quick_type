import 'package:flutter/material.dart';
import 'package:quick_takes/auth/view/widgets/login_background.dart';
import 'package:quick_takes/auth/view/widgets/login_foreground.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static String get routeName => 'login';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: [
            LoginBackground(),
            LoginForeground(),
          ],
        ),
      ),
    );
  }
}
