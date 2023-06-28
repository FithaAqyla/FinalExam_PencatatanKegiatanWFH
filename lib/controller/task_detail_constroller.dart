import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalexamflutter/model/task_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TaskDetailController {
  TaskDetailController();
  final auth = FirebaseAuth.instance;
  final taskCollection = FirebaseFirestore.instance.collection('tasks');

  TaskItemModel? taskItemModel;
  String selectedDocument = '';

  final titleController = TextEditingController();
  final dateController = TextEditingController(
    text: DateTime.now().toString().split(' ').first,
  );
  final statusController = TextEditingController(
    text: '1',
  );
  final contentController = TextEditingController();

  Future<void> initial(String document) async {
    if (document.isEmpty) {
      return;
    }
    final result = await taskCollection.doc(document).get();

    taskItemModel = TaskItemModel.fromMap(result.data() ?? {});

    titleController.text = taskItemModel?.title ?? '';
    dateController.text =
        taskItemModel?.date ?? DateTime.now().toString().split(' ').first;
    statusController.text = (taskItemModel?.status ?? 1).toString();
    contentController.text = taskItemModel?.content ?? '';
  }

  void save(TaskItemModel item) {
    final task = item.copyWith(
      member: auth.currentUser?.email ?? '',
    );

    taskCollection.add(
      task.toMap(),
    );
  }

  void edit(TaskItemModel item) {
    final task = item.copyWith(
      member: auth.currentUser?.uid ?? '',
    );

    taskCollection.doc(selectedDocument).set(task.toMap());
  }
}
