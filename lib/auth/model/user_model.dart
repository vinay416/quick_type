import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  const UserModel({
    required this.username,
    required this.dpUrl,
    required this.email,
  });
  final String username;
  final String dpUrl;
  final String email;

  static String get ref => 'Users';

  factory UserModel.fromUser(User user) {
    return UserModel(
      username: user.displayName ?? '',
      dpUrl: user.photoURL ?? '',
      email: user.email ?? '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] ?? '',
      dpUrl: json['dpUrl'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'dpUrl': dpUrl,
      'email': email,
    };
  }
}
