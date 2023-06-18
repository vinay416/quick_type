import 'package:flutter/material.dart';
import 'package:quick_takes/auth/model/user_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({required this.user, super.key});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return const Text("Home");
  }
}