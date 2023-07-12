import 'package:firebase_ui_database/firebase_ui_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/widgets/custom_scaffold.dart';
import 'package:quick_takes/home/model/take_model.dart';
import 'package:quick_takes/home/view/add_take_fab/add_take_fab.dart';
import 'package:quick_takes/home/view_model/takes_view_model.dart';

class AllTakesView extends StatelessWidget {
  const AllTakesView({super.key});

  static String get routeName => 'allTakes';

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TakesViewModel>();
    return CustomScaffold(
      title: 'All Takes',
      body: FirebaseDatabaseListView(
        shrinkWrap: true,
        query: viewModel.fetchTakes,
        itemBuilder: (context, snapshot) {
          final take = TakeModel.fromDocument(snapshot);
          return ListTile(
            title: Text(take.data),
          );
        },
      ),
      floatingActionButton: const AddTakeFAB(
        isTakeListEmpty: false,
      ),
    );
  }
}
