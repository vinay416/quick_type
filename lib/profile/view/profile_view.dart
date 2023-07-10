import 'package:flutter/material.dart';
import 'package:quick_takes/app_global/app_colors.dart';
import 'package:quick_takes/app_global/app_textstyles.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/app_global/widgets/custom_scaffold.dart';
import 'package:quick_takes/auth/model/user_model.dart';
import 'package:quick_takes/auth/view/widgets/log_out_button.dart';
import 'package:quick_takes/profile/view/widget/profile_widget.dart';
import 'package:quick_takes/theme/view/app_theme_switch.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({required this.user, super.key});
  final UserModel? user;

  static String get routeName => 'profile';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Profile',
      enableLeadingBack: true,
      actions: const [LogOutButton()],
      body: user == null ? errorText : buildProfile,
    );
  }

  Widget get errorText {
    return const Text('Erron on loading data!');
  }

  Widget get buildProfile {
    return Column(
      children: [
        SizedBox(height: 0.1.h),
        const ProfileWidget(radii: 50),
        SizedBox(height: 0.05.h),
        Text(
          user!.username,
          style: AppTextStyles.descprition,
        ),
        SizedBox(height: 0.02.h),
        Text(
          user!.email,
          style: AppTextStyles.subTitle,
        ),
        SizedBox(height: 0.02.h),
        Divider(
          indent: 0.1.w,
          endIndent: 0.1.w,
          thickness: 1,
          color: AppColors.secondary,
        ),
        SizedBox(height: 0.02.h),
        buildSettings,
      ],
    );
  }

  Widget get buildSettings {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App theme',
              style: AppTextStyles.button,
            ),
            Text(
              'Tap to switch between\nLight or Dark theme',
              style: AppTextStyles.subTitle.copyWith(fontSize: 16),
            )
          ],
        ),
        const AppThemeSwitch(),
      ],
    );
  }
}
