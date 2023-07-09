import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/utils.dart';
import 'package:quick_takes/auth/model/user_model.dart';
import 'package:quick_takes/profile/view_model/profile_view_model.dart';

class ProfileButton extends StatefulWidget {
  const ProfileButton({super.key});

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  void didChangeDependencies() {
    final viewModel = context.read<ProfileViewModel>();
    viewModel.fetchUser();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ProfileViewModel, UserModel?>(
      selector: (_, viewModel) => viewModel.userData,
      builder: (context, userData, child) {
        String dpUrl = kDefaultDP;
        if (userData != null) {
          dpUrl = userData.dpUrl;
        }
        return CircleAvatar(
          radius: 20,
          backgroundImage: CachedNetworkImageProvider(dpUrl),
        );
      },
    );
  }
}
