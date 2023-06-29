import 'package:finalexamflutter/view/color.dart';
import 'package:finalexamflutter/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EditProfilPage extends StatefulWidget {
  const EditProfilPage({super.key});

  @override
  State<EditProfilPage> createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final alamatController = TextEditingController();
  final nikController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundss,
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
                      Row(
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
                      const SizedBox(
                        height: 30,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'EDIT DATA',
                              style: TextStyle(
                                fontSize: 18,
                                color: backgroundss,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_2_outlined,
                              color: iconColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(35.0),
                              ),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            hintText: 'Username',
                            hintStyle:
                                TextStyle(fontSize: 14, color: textColor1),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "username should not be empty";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: iconColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(35.0),
                              ),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            hintText: 'Email',
                            hintStyle:
                                TextStyle(fontSize: 14, color: textColor1),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email should not be empty';
                            }
                            if (!value.contains('@')) {
                              return 'Email Format not valid';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: iconColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(35.0),
                              ),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(fontSize: 14, color: textColor1),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password should not be empty';
                            }
                            if (value.length < 6) {
                              return 'Password length must be more than 6';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: alamatController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: iconColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(35.0),
                              ),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            hintText: 'Alamat',
                            hintStyle:
                                TextStyle(fontSize: 14, color: textColor1),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Alamat should not be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: nikController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: iconColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(35.0),
                              ),
                            ),
                            contentPadding: EdgeInsets.all(5),
                            hintText: 'NIK',
                            hintStyle:
                                TextStyle(fontSize: 14, color: textColor1),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'NIK should not be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
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
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfilePage(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
