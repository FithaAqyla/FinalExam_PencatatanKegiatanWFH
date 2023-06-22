import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskItemModel {
  final String title;
  final String date;
  final int status;
  final String content;
  final String member;

  TaskItemModel({
    required this.title,
    required this.date,
    required this.status,
    required this.content,
    required this.member,
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
}
