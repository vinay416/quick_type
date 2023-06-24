import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            width: 300,
            child: OutlinedButton(
              onPressed: () {
                context.read<AuthViewModel>().signInWithGoogle();
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
                      'Login with Google',
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
}
