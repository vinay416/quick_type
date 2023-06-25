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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: physics,
        slivers: [
          if (title != null)
            SliverAppBar.large(
              automaticallyImplyLeading: false,
              title: Text(title!),
              expandedHeight: isSmallAppBar ? context.pixelHeight(100) : null,
              flexibleSpace: isSmallAppBar
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20),
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
