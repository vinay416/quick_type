import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/auth/model/user_model.dart';
import 'package:quick_takes/auth/view/login_view.dart';
import 'package:quick_takes/auth/view_model/auth_view_model.dart';
import 'package:quick_takes/home/view/home_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();
    return StreamBuilder(
      stream: authViewModel.authStream,
      builder: (context, snapshot) {
        final authUser = snapshot.data;
        if (authUser == null) {
          return const LoginView();
        }

        final UserModel user = UserModel.fromUser(authUser);
        return HomeView(user: user);
      },
    );
  }
}
