import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskItemModel {
  final String id;
  final String title;
  final String date;
  final int status;
  final String content;
  final String member;

  TaskItemModel({
    this.id = '',
    required this.title,
    required this.date,
    required this.status,
    required this.content,
    this.member = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'date': date,
      'status': status,
      'content': content,
      'member': member,
    };
  }

  factory TaskItemModel.fromMap(Map<String, dynamic> map) {
    return TaskItemModel(
      id: (map['id'] as String?) ?? '',
      title: map['title'] as String,
      date: map['date'] as String,
      status: map['status'] as int,
      content: map['content'] as String,
      member: map['member'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskItemModel.fromJson(String source) =>
      TaskItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  TaskItemModel copyWith({
    String? id,
    String? title,
    String? date,
    int? status,
    String? content,
    String? member,
  }) {
    return TaskItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      status: status ?? this.status,
      content: content ?? this.content,
      member: member ?? this.member,
    );
  }
}
