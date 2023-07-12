import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/auth/view/login_view.dart';
import 'package:quick_takes/auth/view_model/auth_view_model.dart';
import 'package:quick_takes/home/view/all_takes_view/all_takes_view.dart';
import 'package:quick_takes/home/view/home_view.dart';
import 'package:quick_takes/home/view/new_take/new_take_view.dart';
import 'package:quick_takes/profile/view/profile_view.dart';
import 'package:quick_takes/profile/view_model/profile_view_model.dart';

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
        return state.namedLocation(LoginView.routeName);
      }
      if (state.fullPath == '/${LoginView.routeName}') {
        return state.namedLocation(HomeView.routeName);
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
      path: '/login',
      builder: (_, state) => const LoginView(),
    ),
    GoRoute(
      name: HomeView.routeName,
      path: '/home',
      builder: (_, state) => const HomeView(),
      routes: [
        GoRoute(
          name: AllTakesView.routeName,
          path: 'allTakes',
          builder: (_, state) => const AllTakesView(),
        ),
        GoRoute(
          name: NewTakeView.routeName,
          path: 'new',
          builder: (_, state) => const NewTakeView(),
        ),
        GoRoute(
          name: ProfileView.routeName,
          path: 'profile',
          builder: (context, state) {
            final user = context.read<ProfileViewModel>().userData;
            return ProfileView(user: user);
          },
        ),
      ],
    ),
  ];
}
