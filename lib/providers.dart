import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/auth/view_model/auth_view_model.dart';
import 'package:quick_takes/home/view_model/takes_view_model.dart';
import 'package:quick_takes/profile/view_model/profile_view_model.dart';
import 'package:quick_takes/theme/view_model/app_theme_view_model.dart';

class Providers extends StatelessWidget {
  const Providers({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppThemeViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => TakesViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: child,
    );
  }
}
