import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_takes/auth/model/user_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  UserModel? userData;

  Future<void> fetchUser() async {
    final userJson = await _currentUserRef.get();
    final userData = UserModel.fromJson(userJson.data()!);
    final googleDP = _googleSignIn.currentUser?.photoUrl ?? '';

    if (googleDP.isEmpty || googleDP == userData.dpUrl) {
      this.userData = userData;
    } else {
      _updateDp(googleDP);
      this.userData = userData.copyWith(dpUrl: googleDP);
    }
    notifyListeners();
  }

  void _updateDp(String dpUrl) {
    try {
      final data = UserModel.updateDpToJson(dpUrl);
      _currentUserRef.update(data);
    } catch (e) {
      log('Error on updating dp $e');
    }
  }

  DocumentReference<Map<String, dynamic>> get _currentUserRef {
    final uid = _auth.currentUser!.uid;
    return _firestore.collection(UserModel.ref).doc(uid);
  }
}
