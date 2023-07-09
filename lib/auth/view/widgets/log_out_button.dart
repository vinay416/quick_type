import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/app_textstyles.dart';
import 'package:quick_takes/auth/view_model/auth_view_model.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<AuthViewModel>().logOut();
      },
      child: Text(
        'Logout',
        style: AppTextStyles.action,
      ),
    );
  }
}
