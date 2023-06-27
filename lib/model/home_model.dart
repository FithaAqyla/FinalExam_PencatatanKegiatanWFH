import 'package:finalexamflutter/model/task_item_model.dart';
import 'package:finalexamflutter/model/user_model.dart';

class HomeModel {
  HomeModel({
    required this.user,
    this.tasks = const [],
  });

  final UserModel user;
  final List<TaskItemModel> tasks;
}
