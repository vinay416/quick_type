import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_takes/auth/model/user_model.dart';

const String _clientId =
    '54615680615-js178jcbi0gc9oigb7lhi81t7pp8759p.apps.googleusercontent.com';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel() {
    _authStream();
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(clientId: _clientId);
  bool _isLoading = false;
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  void _authStream() {
    _auth.authStateChanges().listen(
      (user) {
        if (user == null) {
          _isAuthenticated = false;
        } else {
          _isAuthenticated = true;
        }
        notifyListeners();
      },
    );
  }

  Future<void> signInWithGoogle() async {
    _setLoader(true);
    final googleAccount = await _googleSignIn.signIn();
    if (googleAccount == null) {
      _setLoader(false);
      return;
    }

    final googleAuth = await googleAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final userCredential = await _auth.signInWithCredential(credential);
    final user = userCredential.user;
    if (user == null) {
      _setLoader(false);
      return;
    }
    await _createUser(user);
    _setLoader(false);
  }

  Future<void> logOut() async {
    _googleSignIn.signOut();
    _auth.signOut();
  }

  Future<void> _createUser(User user) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final ref = firestore.collection(UserModel.ref).doc(user.uid);
    final doc = await ref.get();
    if (doc.exists) {
      return;
    }
    final userJson = UserModel.fromUser(user).toJson();
    await ref.set(userJson);
  }

  void _setLoader(bool state) {
    _isLoading = state;
    notifyListeners();
  }
}
