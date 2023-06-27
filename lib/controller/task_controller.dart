import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalexamflutter/model/task_Item_model.dart';
import 'package:finalexamflutter/model/task_model.dart';
import 'package:finalexamflutter/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/home_model.dart';

class TaskController {
  final auth = FirebaseAuth.instance;
  final userCollection = FirebaseFirestore.instance.collection('users');
  final taskCollection = FirebaseFirestore.instance.collection('tasks');

  TaskModel? data;

  Future<void> initial() async {
    final user = auth.currentUser;
    if (user == null) {
      return;
    }
    final userSnapshot = await userCollection.doc(user.uid).get();
    final userModel = UserModel.fromJson(jsonEncode(userSnapshot.data()));
    final taskSnapshot = await taskCollection.get();
    final listTask = taskSnapshot.docs.map((e) {
      final item = TaskItemModel.fromMap(e.data());
      print(e.id);
      return item.copyWith(id: e.id);
    }).toList();
    final result = TaskModel(user: userModel, tasks: listTask);
    data = result;
  }

  Future deleteContact(String id) async {
    await taskCollection.doc(id).delete();
    return data;
  }
}
