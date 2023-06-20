import 'package:go_router/go_router.dart';
import 'package:quick_takes/auth/view/auth_route.dart';

class AppRouter {
  AppRouter._();
  static AppRouter? _instance;
  static AppRouter get instance => _instance ??= AppRouter._();

  final GoRouter _router = GoRouter(routes: _routes);
  GoRouter get config => _router;

  static final List<RouteBase> _routes = [
    Authentication.route,
  ];
}
