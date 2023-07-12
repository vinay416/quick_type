import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/profile/view/profile_view.dart';
import 'package:quick_takes/profile/view/widget/profile_widget.dart';
import 'package:quick_takes/profile/view_model/profile_view_model.dart';

class ProfileButton extends StatefulWidget {
  const ProfileButton({super.key});

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  void initState() {
    super.initState();
    final viewModel = context.read<ProfileViewModel>();
    viewModel.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(ProfileView.routeName);
      },
      child: const ProfileWidget(),
    );
  }
}
