import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/auth/utils/auth_texts.dart';
import 'package:quick_takes/app_global/app_textstyles.dart';
import 'package:quick_takes/app_global/widgets/blur_widget.dart';

class LoginDescCard extends StatelessWidget {
  const LoginDescCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlurWidget(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        borderRadius: BorderRadius.circular(20),
        height: 0.45.h,
        width: kIsWeb ? 0.3.w : 0.8.w,
        child: Center(
          child: Text(
            AuthTexts.description,
            style: AppTextStyles.descprition,
          ),
        ),
      ),
    );
  }
}
