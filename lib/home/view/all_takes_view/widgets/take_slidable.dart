import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:quick_takes/app_global/extension/context_extensions.dart';
import 'package:quick_takes/home/model/take_model.dart';
import 'package:quick_takes/home/view_model/takes_view_model.dart';

class TakeSlidable extends StatelessWidget {
  const TakeSlidable({
    required this.child,
    required this.take,
    super.key,
  });
  final Widget child;
  final TakeModel take;

  @override
  Widget build(BuildContext context) {
    if (context.isLargeDevice) {
      return Row(
        children: [
          Expanded(child: child),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () => onPressedDelete(context),
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            ),
          )
        ],
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: onPressedDelete,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: child,
      ),
    );
  }

  void onPressedDelete(BuildContext context) {
    context.read<TakesViewModel>().delete(take);
  }
}
