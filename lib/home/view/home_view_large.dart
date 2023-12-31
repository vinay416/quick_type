import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/app_colors.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/home/model/take_model.dart';
import 'package:quick_takes/home/view/all_takes_view/all_takes_view.dart';
import 'package:quick_takes/home/view/empty_view/home_empty_view.dart';
import 'package:quick_takes/home/view/new_take/new_take_view.dart';
import 'package:quick_takes/home/view_model/takes_view_model.dart';
import 'package:tuple/tuple.dart';

class HomeViewLarge extends StatelessWidget {
  const HomeViewLarge({required this.takesCount, super.key});
  final int takesCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: takesCountView),
        Container(
          width: 5,
          color: context.isDarkMode
              ? AppColors.primaryLight.withOpacity(0.5)
              : AppColors.primaryDark.withOpacity(0.5),
        ),
        Expanded(flex: 3, child: takeWebView),
      ],
    );
  }

  Widget get takesCountView {
    if (takesCount == 0) {
      return const HomeEmptyView();
    }
    return Scrollbar(child: AllTakesView(takesCount: takesCount));
  }

  Widget get takeWebView {
    return Selector<TakesViewModel, Tuple2<TakeModel?, bool>>(
      selector: (_, viewModel) => Tuple2(
        viewModel.take,
        viewModel.isLargeFabTapped,
      ),
      builder: (context, tuple, child) {
        final take = tuple.item1;
        final isLargeFabTapped = tuple.item2;

        if (!isLargeFabTapped) {
          return Container(
            color: context.isDarkMode
                ? AppColors.primaryDark
                : AppColors.primaryLight,
          );
        }
        return TakeView(
          key: ObjectKey(take),
          take: take,
        );
      },
    );
  }
}
