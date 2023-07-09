class TakeModel {
  const TakeModel({
    required this.id,
    required this.data,
    required this.title,
    required this.createdDate,
  });
  final int id;
  final String data;
  final String title;
  final DateTime createdDate;

  static String get ref => 'Takes';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'title': title,
      'createdDate': createdDate.millisecondsSinceEpoch,
    };
  }

  factory TakeModel.fromMap(Map<String, dynamic> map) {
    return TakeModel(
      id: map['id'] as int,
      data: map['data'] as String,
      title: map['title'] as String,
      createdDate: DateTime.fromMillisecondsSinceEpoch(
        map['createdDate'] as int,
      ),
    );
  }

  factory TakeModel.add({required String data}) {
    return TakeModel(
      id: -DateTime.now().millisecondsSinceEpoch,
      data: data,
      title: _getTitle(data),
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
}
