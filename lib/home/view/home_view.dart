import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/home/view/all_takes_view/all_takes_view.dart';
import 'package:quick_takes/home/view/empty_view/home_empty_view.dart';
import 'package:quick_takes/home/view_model/takes_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String get routeName => 'home';

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TakesViewModel>();

    return StreamBuilder<bool>(
      initialData: false,
      stream: viewModel.isTakesListEmpty,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data ?? true) {
          return const HomeEmptyView();
        }

        return const AllTakesView();
      },
    );
  }
}
