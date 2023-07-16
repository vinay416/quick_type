import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:quick_takes/app_global/app_colors.dart';
import 'package:quick_takes/app_global/app_textstyles.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/home/model/take_model.dart';
import 'package:quick_takes/home/view/all_takes_view/widgets/take_slidable.dart';
import 'package:quick_takes/home/view/new_take/new_take_view.dart';

class TakeItem extends StatelessWidget {
  const TakeItem({
    required this.take,
    required this.isbuildDate,
    super.key,
  });
  final TakeModel take;
  final bool isbuildDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isbuildDate ? buildDate : const SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: TakeSlidable(
            take: take,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: context.isDarkMode
                  ? AppColors.primaryLight.withOpacity(0.15)
                  : AppColors.primaryDark.withOpacity(0.2),
              child: InkWell(
                onTap: () {
                  context.goNamed(TakeView.routeName, extra: take);
                },
                child: SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildTitle,
                        buildTime,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget get buildTitle {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          take.formatTitle,
          style: AppTextStyles.button,
        ),
        Text(take.formatSubTitle),
      ],
    );
  }

  Widget get buildTime {
    final time = DateFormat("h:mm a").format(take.updatedTime);
    return Text(time);
  }

  Widget get buildDate {
    String date = DateFormat.yMMMMd('en_US').format(take.updatedTime);
    final diff = DateTime.now().difference(take.updatedTime);
    if (diff.inDays == 0) date = 'Today';
    if (diff.inDays == 1) date = 'Yesterday';
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        date,
        style: AppTextStyles.action.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
