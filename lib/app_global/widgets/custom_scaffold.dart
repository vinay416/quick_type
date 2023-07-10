import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/app_colors.dart';
import 'package:quick_takes/app_global/app_textstyles.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/app_router.dart';
import 'package:quick_takes/theme/view_model/app_theme_view_model.dart';

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
              leading: enableLeadingBack ? backButton : null,
              title: getTitle,
              expandedHeight: isSmallAppBar ? 0.1.h : null,
              flexibleSpace: isSmallAppBar
                  ? Padding(
                      padding: EdgeInsets.only(
                        left: enableLeadingBack ? 50 : 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Row(
                            children: [
                              getTitle,
                              const Spacer(),
                              if (isSmallAppBar && actions != null) ...actions!,
                              const SizedBox(width: 20),
                            ],
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

  Widget get getTitle {
    return Consumer<AppThemeViewModel>(
      builder: (context, value, child) {
        return Text(
          title!,
          style: AppTextStyles.title.copyWith(
            color: context.isDarkMode
                ? AppColors.primaryLight.withOpacity(0.9)
                : AppColors.primaryDark.withOpacity(0.6),
          ),
        );
      },
    );
  }

  Widget get backButton {
    final context = AppRouter.navigatorKey.currentContext!;
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }
}
