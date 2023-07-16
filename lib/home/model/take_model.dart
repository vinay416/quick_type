// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_database/firebase_database.dart';

class TakeModel {
  TakeModel({
    required this.id,
    required this.data,
    required this.title,
    required this.updatedTime,
  });
  final int id;
  String data;
  final String title;
  final DateTime updatedTime;

  static String get ref => 'Takes';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'data': data,
      'title': title,
      'updatedTime': -updatedTime.millisecondsSinceEpoch,
    };
  }

  factory TakeModel.fromDocument(DataSnapshot snapshot) {
    final map = Map<String, dynamic>.from(snapshot.value as Map);
    return TakeModel(
      id: map['id'] as int,
      data: map['data'] as String,
      title: map['title'] as String,
      updatedTime: DateTime.fromMillisecondsSinceEpoch(
        -map['updatedTime'] as int,
      ),
    );
  }

  factory TakeModel.empty() {
    return TakeModel(
      id: DateTime.now().millisecondsSinceEpoch,
      data: '',
      title: _getTitle(''),
      updatedTime: DateTime.now(),
    );
  }

  static String _getTitle(String data) {
    if (data.isEmpty) return data;
    if (data.length > 20) {
      return data.substring(0, 20);
    }
    return data;
  }

  String get formatSubTitle {
    if (data.isEmpty) return data;
    if (data.length > 40) {
      return data.substring(0, 40);
    }
    return data;
  }

  String get formatTitle {
    if (data.isEmpty) return data;
    if (data.length > 20) {
      return data.substring(0, 20).replaceAll('\n', "");
    }
    return data.replaceAll('\n', "");
  }

  void setLocalData(String data) {
    this.data = data;
  }

  TakeModel copyWith({
    String? data,
  }) {
    return TakeModel(
      id: id,
      data: data ?? this.data,
      title: _getTitle(data ?? this.data),
      updatedTime: DateTime.now(),
    );
  }
}
