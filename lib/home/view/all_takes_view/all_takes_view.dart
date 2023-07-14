import 'package:firebase_ui_database/firebase_ui_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/app_textstyles.dart';
import 'package:quick_takes/app_global/widgets/custom_scaffold.dart';
import 'package:quick_takes/home/model/take_model.dart';
import 'package:quick_takes/home/view/add_take_fab/add_take_fab.dart';
import 'package:quick_takes/home/view_model/takes_view_model.dart';
import 'package:quick_takes/profile/view/widget/profile_button.dart';
import 'package:quick_takes/theme/view_model/app_theme_view_model.dart';

class AllTakesView extends StatelessWidget {
  const AllTakesView({required this.takesCount, super.key});
  final int takesCount;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TakesViewModel>();
    return CustomScaffold(
      expandedTitle: getExpandedTitle,
      actions: const [ProfileButton()],
      body: FirebaseDatabaseListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        query: viewModel.fetchTakes,
        itemBuilder: (context, snapshot) {
          final take = TakeModel.fromDocument(snapshot);
          return ListTile(
            title: Card(
              child: Text(take.data),
              color: Colors.amber,
            ),
          );
        },
      ),
      floatingActionButton: const AddTakeFAB(
        isTakeListEmpty: false,
      ),
    );
  }

  Widget get getExpandedTitle {
    return Consumer<AppThemeViewModel>(
      builder: (context, value, child) {
        final color = CustomScaffold.getTitleColor(context);

        return RichText(
          text: TextSpan(
            text: takesCount.toString(),
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
