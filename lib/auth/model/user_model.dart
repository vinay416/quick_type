import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  const UserModel({
    required this.username,
    required this.dpUrl,
    required this.email,
    required this.createdDate,
  });
  final String username;
  final String dpUrl;
  final String email;
  final DateTime createdDate;

  static String get ref => 'Users';

  factory UserModel.fromUser(User user) {
    return UserModel(
      username: user.displayName ?? '',
      dpUrl: user.photoURL ?? '',
      email: user.email ?? '',
      createdDate: DateTime.now(),
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] ?? '',
      dpUrl: json['dpUrl'] ?? '',
      email: json['email'] ?? '',
      createdDate: DateTime.fromMillisecondsSinceEpoch(json['createdDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'dpUrl': dpUrl,
      'email': email,
      'createdDate': createdDate.millisecondsSinceEpoch,
    };
  }

  static Map<String, dynamic> updateDpToJson(String dpUrl) {
    return {
      'dpUrl': dpUrl,
    };
  }

  UserModel copyWith({
    String? username,
    String? dpUrl,
  }) {
    return UserModel(
      username: username ?? this.username,
      dpUrl: dpUrl ?? this.dpUrl,
      email: email,
      createdDate: createdDate,
    );
  }
}
