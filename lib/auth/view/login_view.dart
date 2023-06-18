import 'package:flutter/material.dart';
import 'package:quick_takes/theme/view/app_theme_switch.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: const [AppThemeSwitch()],
      ),
      body: Center(
        child: const Text("Login Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Text("sx"),
      ),
    );
  }
}
