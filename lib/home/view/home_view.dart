import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/home/view/all_takes_view/all_takes_view.dart';
import 'package:quick_takes/home/view/empty_view/home_empty_view.dart';
import 'package:quick_takes/home/view/home_view_large.dart';
import 'package:quick_takes/home/view_model/takes_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String get routeName => 'home';

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TakesViewModel>();

    return StreamBuilder<int>(
      initialData: 0,
      stream: viewModel.takesCountStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final takesCount = (snapshot.data ?? 0);

        if (context.isLargeDevice) {
          return HomeViewLarge(
            takesCount: takesCount,
          );
        }

        // mobile view
        if (takesCount == 0) {
          return const HomeEmptyView();
        }

        return AllTakesView(takesCount: takesCount);
      },
    );
  }
}
