import 'package:firebase_ui_database/firebase_ui_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/widgets/custom_scaffold.dart';
import 'package:quick_takes/home/model/take_model.dart';
import 'package:quick_takes/home/view/add_take_fab/add_take_fab.dart';
import 'package:quick_takes/home/view/all_takes_view/widgets/all_takes_title.dart';
import 'package:quick_takes/home/view/all_takes_view/widgets/take_item.dart';
import 'package:quick_takes/home/view_model/takes_view_model.dart';
import 'package:quick_takes/profile/view/widget/profile_button.dart';

class AllTakesView extends StatelessWidget {
  const AllTakesView({required this.takesCount, super.key});
  final int takesCount;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TakesViewModel>();
    return CustomScaffold(
      expandedTitle: AllTakesTitle(count: takesCount),
      actions: const [ProfileButton()],
      body: Column(
        children: [
          FirebaseDatabaseQueryBuilder(
            query: viewModel.fetchTakes,
            builder: (context, snapshot, _) {
              if (snapshot.isFetching) {
                return const CircularProgressIndicator();
              }

              final takeList = snapshot.docs
                  .map((document) => TakeModel.fromDocument(document))
                  .toList();

              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: takeList.length,
                itemBuilder: (context, index) {
                  if (snapshot.hasMore && index + 1 == takeList.length) {
                    snapshot.fetchMore();
                  }

                  bool isbuildDate = false;
                  if (index == 0) {
                    isbuildDate = true;
                  }
                  else {
                    final current = takeList[index].updatedTime;
                    final prev = takeList[index - 1].updatedTime;
                    isbuildDate = TakeModel.isNotSameDay(prev, current);
                  }

                  final take = takeList[index];
                  return TakeItem(
                    take: take,
                    isbuildDate: isbuildDate,
                  );
                },
              );
            },
          ),
          const SizedBox(height: 80),
        ],
      ),
      floatingActionButton: const AddTakeFAB(
        isTakeListEmpty: false,
      ),
    );
  }
}
