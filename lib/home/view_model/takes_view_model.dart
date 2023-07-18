import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quick_takes/home/model/take_model.dart';
import 'package:quick_takes/home/repo/take_repo.dart';

class TakesViewModel extends ChangeNotifier {
  final TakeRepo _repo = TakeRepo();
  Timer? _debounce;
  TakeModel? _take;

  TakeModel? get take => _take;

  void setTake(TakeModel? take) {
    _take = take;
    notifyListeners();
  }

  void createTake(TakeModel take) => _repo.saveTake(take);

  void debounceFunc({
    required TextEditingController controller,
    required TakeModel oldTake,
  }) {
    final newTake = oldTake.copyWith(data: controller.text.trim());
    if (oldTake.data == newTake.data) {
      //  oldTake.data == newTake.data || newTake.data.isEmpty
      _debounce?.cancel();
      return;
    }
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    } else {
      oldTake.setLocalData(newTake.data);
      _debounce = Timer(
        const Duration(seconds: 1),
        () => _repo.saveTake(newTake),
      );
    }
  }

  Query get fetchTakes => _repo.fetchTakes;

  Stream<int> get takesCountStream => _repo.takeCount;

  void onTapBack(TakeModel? take) {
    if(take ==null) return;
    if (take.data.trim().isNotEmpty) return;
    _repo.deleteTake(take);
  }

  void delete(TakeModel take) {
    _repo.deleteTake(take);
  }
}
