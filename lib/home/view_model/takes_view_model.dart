import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quick_takes/home/model/take_model.dart';
import 'package:quick_takes/home/repo/take_repo.dart';

class TakesViewModel extends ChangeNotifier {
  final TakeRepo _repo = TakeRepo();
  Timer? _debounce;

  void debounceFunc({
    required TextEditingController controller,
    required TakeModel oldTake,
  }) {
    final newTake = oldTake.copyWith(data: controller.text.trim());
    if (oldTake.data == newTake.data || newTake.data.isEmpty) {
      _debounce?.cancel();
      return;
    }
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    } else {
      oldTake.setLocalData(newTake.data);
      _debounce = Timer(
        const Duration(seconds: 10),
        () => _repo.saveTake(newTake),
      );
    }
  }

  Query get fetchTakes => _repo.fetchTakes;

  Stream<bool> get isTakesListEmpty => _repo.isTakeListEmpty;

  void onTapBack(TakeModel take) {
    if (take.data.trim().isNotEmpty) return;
    _repo.deleteTake(take);
  }
}
