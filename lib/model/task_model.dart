// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finalexamflutter/model/task_item_model.dart';
import 'package:finalexamflutter/model/user_model.dart';

class TaskModel {
  final UserModel user;
  final List<TaskItemModel> tasks;
  TaskModel({
    required this.user,
    required this.tasks,
  });
}
