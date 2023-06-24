import 'package:flutter/foundation.dart';

class TakesViewModel extends ChangeNotifier {
  final List _takesList = [];

  List get takesList => List.unmodifiable(_takesList);
}