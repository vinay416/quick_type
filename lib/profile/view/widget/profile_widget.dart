import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/utils.dart';
import 'package:quick_takes/auth/model/user_model.dart';
import 'package:quick_takes/profile/view_model/profile_view_model.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({this.radii = 20, super.key});
  final double radii;

  @override
  Widget build(BuildContext context) {
    return Selector<ProfileViewModel, UserModel?>(
      selector: (_, viewModel) => viewModel.userData,
      builder: (context, userData, child) {
        String dpUrl = kDefaultDP;
        if (userData != null) {
          dpUrl = userData.dpUrl;
        }
        return Hero(
          tag: 'profile',
          child: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.2),
            radius: radii + 5,
            child: CircleAvatar(
              radius: radii,
              backgroundImage: CachedNetworkImageProvider(dpUrl),
            ),
          ),
        );
      },
    );
  }
}
