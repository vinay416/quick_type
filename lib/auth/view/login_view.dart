import 'package:flutter/material.dart';
import 'package:quick_takes/auth/view/widgets/login_background.dart';
import 'package:quick_takes/auth/view/widgets/login_foreground.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          LoginBackground(),
          LoginForeground(),
        ],
      ),
    );
  }
}
