import 'package:flutter/material.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/auth/utils/auth_texts.dart';
import 'package:quick_takes/auth/view/widgets/login_button.dart';
import 'package:quick_takes/auth/view/widgets/login_desc_card.dart';
import 'package:quick_takes/app_global/app_textstyles.dart';

class LoginForeground extends StatelessWidget {
  const LoginForeground({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.pixelWidth(20),
          vertical: context.pixelHeight(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            loginTitle,
            SizedBox(height: context.pixelHeight(100)),
            const LoginDescCard(),
            SizedBox(height: context.pixelHeight(160)),
            const LoginButton(),
          ],
        ),
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
