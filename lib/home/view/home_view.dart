import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/home/view/all_takes_view/all_takes_view.dart';
import 'package:quick_takes/home/view/empty_view/home_empty_view.dart';
import 'package:quick_takes/home/view_model/takes_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String get routeName => 'home';
  static String get routePath => '/home';

  @override
  Widget build(BuildContext context) {
    return Selector<TakesViewModel, bool>(
      selector: (_, viewModel) => viewModel.takesList.isEmpty,
      builder: (context, isEmpty, child) {
        if (isEmpty) {
          return const HomeEmptyView();
        }
        return const AllTakesView();
      },
    );
  }
}
