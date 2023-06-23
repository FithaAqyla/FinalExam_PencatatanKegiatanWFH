import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalexamflutter/model/home_model.dart';
import 'package:finalexamflutter/model/task_Item_model.dart';
import 'package:finalexamflutter/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController {
  final auth = FirebaseAuth.instance;
  final usersCollection = FirebaseFirestore.instance.collection('users');
  final taskCollection = FirebaseFirestore.instance.collection('tasks');

  HomeModel? data;

  Future<void> initial() async {
    final user = auth.currentUser;
    if (user == null) {
      return;
    }
    final userSnapshot = await usersCollection.doc(user.uid).get();

    final userModel = UserModel.fromJson(jsonEncode(userSnapshot.data()));

    final taskSnapshot = await taskCollection.get();

    final listTask =
        taskSnapshot.docs.map((e) => TaskItemModel.fromMap(e.data())).toList();

    final result = HomeModel(user: userModel, tasks: listTask);
    data = result;
  }

  Future<bool> logout() async {
    await auth.signOut();

    if (auth.currentUser == null) {
      return true;
    }
    return false;
  }
}
