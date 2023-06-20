import 'package:flutter/material.dart';
import 'package:quick_takes/auth/utils/auth_texts.dart';
import 'package:quick_takes/auth/view/widgets/login_button.dart';
import 'package:quick_takes/auth/view/widgets/login_desc_card.dart';
import 'package:quick_takes/global/app_textstyles.dart';

class LoginForeground extends StatelessWidget {
  const LoginForeground({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loginTitle,
          const SizedBox(height: 80),
          const LoginDescCard(),
          const SizedBox(height: 100),
          const LoginButton(),
        ],
      ),
    );
  }

  Widget get loginTitle {
    return Text(
      AuthTexts.loginTitle,
      style: AppTextStyles.titleLarge,
    );
  }
}
