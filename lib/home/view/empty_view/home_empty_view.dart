import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_takes/app_global/app_textstyles.dart';
import 'package:quick_takes/app_global/asset_svgs.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/app_global/widgets/custom_scaffold.dart';
import 'package:quick_takes/home/view/add_take_fab/add_take_fab.dart';

class HomeEmptyView extends StatelessWidget {
  const HomeEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Takes',
      isSmallAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: context.screenHeight(500),
              width: context.screenWidth(300),
              child: SvgPicture.asset(AssetSVG.kAddNote),
            ),
          ),
          SizedBox(height: context.screenHeight(15)),
          Text(
            'No Takes added yet!',
            style: AppTextStyles.subTitle,
          ),
        ],
      ),
      floatingActionButton: const AddTakeFAB(),
    );
  }
}