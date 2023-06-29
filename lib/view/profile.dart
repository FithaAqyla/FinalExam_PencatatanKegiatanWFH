import 'package:finalexamflutter/controller/home_controller.dart';
import 'package:finalexamflutter/model/home_model.dart';

import 'package:finalexamflutter/view/color.dart';
import 'package:finalexamflutter/view/home_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final homeController = HomeController();
  final formKey = GlobalKey<FormState>();
  HomeModel? data;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   homeController.initial();
  // }

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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Profile",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Color.fromARGB(255, 255, 175, 55),
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '\nHello, ${homeController.data?.user.name ?? ''} ',
                              style: TextStyle(
                                color: Colors.white,
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
                        Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                                'Nik     :  ${homeController.data?.user.nik ?? ''} '),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                                'Name   :  ${homeController.data?.user.name ?? 'Guest'} '),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                                'Email    :  ${homeController.data?.user.email ?? 'Guest'} '),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                                'Alamat :  ${homeController.data?.user.alamat ?? ''} '),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                                'Password  :  ${homeController.data?.user.password ?? ''} '),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .4,
                          height: 80,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                backgroundColor: backgroundss,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              },
                              child: const Text('Back to Home')),
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
