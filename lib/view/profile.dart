import 'package:finalexamflutter/controller/auth_controller.dart';
import 'package:finalexamflutter/model/user_model.dart';
import 'package:finalexamflutter/view/color.dart';
import 'package:finalexamflutter/view/home_page.dart';
import 'package:finalexamflutter/view/update_profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final authController = AuthController();
  final formKey = GlobalKey<FormState>();

  UserModel? user;

  @override
  void initState() {
    super.initState();
    authController.getUser().then((value) {
      user = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
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
                          text: 'Profile',
                          style: const TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Color.fromARGB(255, 255, 175, 55),
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: '\nHello, ${user?.name ?? ''} ',
                              style: const TextStyle(
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
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircleAvatar(
                                maxRadius: 50,
                                minRadius: 50,
                                backgroundImage:
                                    AssetImage('assets/image/profile.jpg'),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                              'Nik     :  ${user?.nik ?? ''} ',
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                              'Name   :  ${user?.name ?? 'Guest'} ',
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                              'Email    :  ${user?.email ?? 'Guest'} ',
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text(
                              'Alamat :  ${user?.alamat ?? ''} ',
                            ),
                          ),
                        ),
                        Row(
                          children: [
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
                                    MaterialPageRoute<Widget>(
                                      builder: (context) =>
                                          const UpdateProfilePage(),
                                    ),
                                  );
                                },
                                child: const Text('Edit'),
                              ),
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
                                    MaterialPageRoute<Widget>(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                },
                                child: const Text('Back to Home'),
                              ),
                            ),
                          ],
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
