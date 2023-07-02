import 'package:flutter/material.dart';
import 'package:quick_takes/app_global/app_colors.dart';
import 'package:quick_takes/app_global/app_textstyles.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    this.body,
    this.title,
    this.isSmallAppBar = false,
    this.actions,
    this.enableLeadingBack = false,
    this.physics,
    this.floatingActionButton,
    super.key,
  });
  final Widget? body;
  final String? title;
  final bool isSmallAppBar;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final ScrollPhysics? physics;
  final bool enableLeadingBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: physics,
        slivers: [
          if (title != null)
            SliverAppBar.large(
              automaticallyImplyLeading: enableLeadingBack,
              title: Text(title!),
              expandedHeight: isSmallAppBar ? context.pixelHeight(80) : null,
              flexibleSpace: isSmallAppBar
                  ? Padding(
                      padding: EdgeInsets.only(
                        left: enableLeadingBack ? 50 : 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            title!,
                            style: AppTextStyles.title.copyWith(
                              color: AppColors.primaryLight,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  : null,
              actions: actions,
            ),
          SliverToBoxAdapter(child: body),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
