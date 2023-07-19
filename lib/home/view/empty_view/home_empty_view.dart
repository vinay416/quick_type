import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_takes/app_global/app_textstyles.dart';
import 'package:quick_takes/app_global/asset_svgs.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/app_global/widgets/custom_scaffold.dart';
import 'package:quick_takes/home/view/add_take_fab/add_take_fab.dart';
import 'package:quick_takes/profile/view/widget/profile_button.dart';

class HomeEmptyView extends StatelessWidget {
  const HomeEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      physics: const NeverScrollableScrollPhysics(),
      title: 'Takes',
      isSmallAppBar: true,
      actions: const [ProfileButton()],
      body: body,
      floatingActionButton: context.isLargeDevice ? null : const AddTakeFAB(),
    );
  }

  Widget get body {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(height: 0.1.h),
          SvgPicture.asset(
            AssetSVG.kAddNote,
            height: 0.42.h,
            width: 0.8.w,
          ),
          SizedBox(height: 0.15.h),
          Text(
            'No Takes added yet!',
            style: AppTextStyles.subTitle,
          ),
        ],
      ),
    );
  }
}
