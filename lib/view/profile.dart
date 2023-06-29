import 'package:finalexamflutter/controller/auth_controller.dart';
import 'package:finalexamflutter/controller/home_controller.dart';
import 'package:finalexamflutter/model/home_model.dart';
import 'package:finalexamflutter/model/user_model.dart';
import 'package:finalexamflutter/view/color.dart';
import 'package:finalexamflutter/view/home_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final authController = AuthController();
  final homeController = HomeController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final alamatController = TextEditingController();
  final nikController = TextEditingController();
  final role = -1;
  final formKey = GlobalKey<FormState>();
  HomeModel? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1.2,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 300,
                  padding: const EdgeInsets.only(top: 90, left: 20),
                  color: backgroundss,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Profile",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Color.fromARGB(255, 255, 175, 55),
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'Hello, ',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 200,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width - 40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          //
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: (Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircleAvatar(
                                maxRadius: 50.0,
                                minRadius: 50.0,
                                backgroundImage:
                                    AssetImage('assets/image/profile.jpg'),
                              )
                            ],
                          )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(',${homeController.data?.user.name ?? } ',),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
