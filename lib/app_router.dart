import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/auth/view/login_view.dart';
import 'package:quick_takes/auth/view_model/auth_view_model.dart';
import 'package:quick_takes/home/view/home_view.dart';
import 'package:quick_takes/home/view/new_take_view.dart';

class AppRouter {
  AppRouter._();
  static AppRouter? _instance;
  static AppRouter get instance => _instance ??= AppRouter._();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    routes: _routes,
    redirect: (context, state) {
      final bool isAuthenticated =
          context.read<AuthViewModel>().isAuthenticated;
      if (!isAuthenticated) {
        return LoginView.routePath;
      }
      if (state.fullPath == LoginView.routePath) {
        return HomeView.routePath;
      }

      return state.fullPath;
    },
  );

  GoRouter get config => _router;

  static final List<RouteBase> _routes = [
    GoRoute(
      path: '/',
      builder: (_, state) => const Material(
        child: Text("Loading..."),
      ),
    ),
    GoRoute(
      name: LoginView.routeName,
      path: LoginView.routePath,
      builder: (_, state) => const LoginView(),
    ),
    GoRoute(
      name: HomeView.routeName,
      path: HomeView.routePath,
      builder: (_, state) => const HomeView(),
      routes: [
        GoRoute(
          name: NewTakeView.routeName,
          path: 'new',
          builder: (_, state) => const NewTakeView(),
        ),
      ],
    ),
  ];
}
