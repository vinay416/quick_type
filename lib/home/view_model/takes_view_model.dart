import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quick_takes/home/model/take_model.dart';
import 'package:quick_takes/home/repo/take_repo.dart';

class TakesViewModel extends ChangeNotifier {
  final TakeRepo _repo = TakeRepo();
  final List<TakeModel> _takesList = [];
  Timer? _debounce;

  List<TakeModel> get takesList => List.unmodifiable(_takesList);

  void debounceFunc({
    required TextEditingController controller,
    required TakeModel? take,
  }) {
    if (take?.data == controller.text) {
      _debounce?.cancel();
    }
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    } else {
      _debounce = Timer(
        const Duration(seconds: 5),
        () => _addTake(take, controller.text),
      );
    }
  }   // todo: optimize and fix bug

  void _addTake(TakeModel? take, String data) {
    // new Take created
    if (take == null) {
      final takeData = TakeModel.add(data: data);
      _repo.saveTake(takeData);
    } else {
      _repo.saveTake(take);
    }
  }
}
