// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_database/firebase_database.dart';

class TakeModel {
  TakeModel({
    required this.id,
    required this.data,
    required this.title,
    required this.createdDate,
  });
  final int id;
  String data;
  final String title;
  final DateTime createdDate;

  static String get ref => 'Takes';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'data': data,
      'title': title,
      'createdDate': createdDate.millisecondsSinceEpoch,
    };
  }

  factory TakeModel.fromDocument(DataSnapshot snapshot) {
    final map = Map<String, dynamic>.from(snapshot.value as Map);
    return TakeModel(
      id: map['id'] as int,
      data: map['data'] as String,
      title: map['title'] as String,
      createdDate: DateTime.fromMillisecondsSinceEpoch(
        map['createdDate'] as int,
      ),
    );
  }

  factory TakeModel.empty() {
    return TakeModel(
      id: -DateTime.now().millisecondsSinceEpoch,
      data: '',
      title: _getTitle(''),
      createdDate: DateTime.now(),
    );
  }

  static String _getTitle(String data) {
    if (data.isEmpty) return data;

    if (data.length > 20) {
      return data.substring(0, 20);
    }

    return data;
  }

  void setLocalData(String data){
    this.data = data;
  }

  TakeModel copyWith({
    String? data,
  }) {
    return TakeModel(
      id: id,
      data: data ?? this.data,
      title: _getTitle(data ?? this.data),
      createdDate: DateTime.now(),
    );
  }
}
