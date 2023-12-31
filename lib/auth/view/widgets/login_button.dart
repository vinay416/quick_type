import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/auth/view_model/auth_view_model.dart';
import 'package:quick_takes/app_global/app_colors.dart';
import 'package:quick_takes/app_global/app_textstyles.dart';
import 'package:quick_takes/app_global/widgets/custom_loader.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<AuthViewModel, bool>(
        selector: (_, viewModel) => viewModel.isLoading,
        builder: (context, isLoading, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 45,
            width: context.isLargeDevice ? 0.3.w : 0.8.w,
            child: OutlinedButton(
              onPressed: () {
                context.read<AuthViewModel>().login();
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.primaryDark,
                shape: isLoading
                    ? const CircleBorder()
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
              ),
              child: isLoading
                  ? const CustomLoader()
                  : Text(
                      nameButton,
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.primaryLight,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }

  String get nameButton {
    if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
      return 'Login with Apple';
    }
    if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
      return 'Login with Email';
    }
    return 'Login with Google';
  }
}
