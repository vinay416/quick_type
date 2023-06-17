import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/auth/view_model/auth_view_model.dart';

class Providers extends StatelessWidget {
  const Providers({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: child,
    );
  }
}
