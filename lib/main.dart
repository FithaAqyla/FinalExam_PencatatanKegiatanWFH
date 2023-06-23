import 'package:finalexamflutter/controller/auth_controller.dart';
import 'package:finalexamflutter/view/home_page.dart';
import 'package:finalexamflutter/view/login.dart';
import 'package:finalexamflutter/view/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authController = AuthController();

  @override
  void initState() {
    super.initState();
    authController.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Managenent',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: authController.isLoggedIn ? const HomePage() : const SplashScreen(),
    );
  }
}
