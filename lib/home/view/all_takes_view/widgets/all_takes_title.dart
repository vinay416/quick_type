import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/app_textstyles.dart';
import 'package:quick_takes/app_global/widgets/custom_scaffold.dart';
import 'package:quick_takes/theme/view_model/app_theme_view_model.dart';

class AllTakesTitle extends StatelessWidget {
  const AllTakesTitle({required this.count, super.key});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeViewModel>(
      builder: (context, value, child) {
        final color = CustomScaffold.getTitleColor(context);

        return RichText(
          text: TextSpan(
            text: count.toString(),
            style: AppTextStyles.titleLarge.copyWith(color: color),
            children: [
              TextSpan(
                text: ' Takes',
                style: AppTextStyles.title.copyWith(color: color),
              ),
            ],
          ),
        );
      },
    );
  }
}
