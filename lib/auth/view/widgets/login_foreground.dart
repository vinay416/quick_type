import 'package:flutter/foundation.dart';
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
    if (kIsWeb) return webView;

    return Padding(
      padding: EdgeInsets.all(0.02.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loginTitle,
          const Spacer(),
          const LoginDescCard(),
          const Spacer(),
          const LoginButton(),
          SizedBox(height: 0.05.h),
        ],
      ),
    );
  }

  Widget get webView {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LoginDescCard(),
            LoginButton(),
          ],
        ),
        loginTitle,
      ],
    );
  }

  Widget get loginTitle {
    return Text(
      AuthTexts.loginTitle,
      style: AppTextStyles.titleLarge,
    );
  }
}
