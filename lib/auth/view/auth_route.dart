import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/auth/view/login_view.dart';
import 'package:quick_takes/auth/view_model/auth_view_model.dart';
import 'package:quick_takes/home/view/home_view.dart';

class Authentication {
  const Authentication._();
  
  static final route = GoRoute(
    path: "/",
    builder: (_, state) => const Material(
      child: Text("Loading..."),
    ),
    routes: [
      GoRoute(
        path: 'login',
        builder: (_, state) => const LoginView(),
      ),
      GoRoute(
        path: 'home',
        builder: (_, state) => const HomeView(),
      )
    ],
    redirect: (context, state) {
      final bool isAuthenticated =
          context.watch<AuthViewModel>().isAuthenticated;
      return isAuthenticated ? '/home' : '/login';
    },
  );
}
