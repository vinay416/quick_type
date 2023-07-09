import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:quick_takes/home/model/take_model.dart';

abstract interface class TakeRepoInterface {
  Future<bool> saveTake(TakeModel take);
  Future<bool> deleteTake(TakeModel take);
}

class TakeRepo implements TakeRepoInterface {
  final FirebaseDatabase _database = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: 'https://quick-type-eafa3-default-rtdb.firebaseio.com/',
  );
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<bool> saveTake(TakeModel take) async {
    try {
      final ref = _database.ref(TakeModel.ref).child(userId);
      await ref.child(take.id.toString()).set(take.toMap());
      return true;
    } on Exception catch (e) {
      log('error on add new take firebase : $e');
      return false;
    }
  }

  @override
  Future<bool> deleteTake(TakeModel take) async {
    try {
      final ref = _database.ref(TakeModel.ref).child(userId);
      await ref.child(take.id.toString()).remove();
      return true;
    } on Exception catch (e) {
      log('error on delete take firebase : $e');
      return false;
    }
  }
}
