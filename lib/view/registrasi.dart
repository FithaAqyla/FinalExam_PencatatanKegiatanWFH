import 'package:finalexamflutter/view/color.dart';
import 'package:finalexamflutter/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
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
                    Container(),
                    RichText(
                        text: const TextSpan(
                            text: "Hi!",
                            style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 2,
                                color: Color.fromARGB(255, 255, 175, 55),
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text: '\n\nCreate a new account',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal))
                        ])),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              height: 380,
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
                        spreadRadius: 5)
                  ]),
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SIGN UP',
                          style: const TextStyle(
                              fontSize: 18,
                              color: backgroundss,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                            color: iconColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0))),
                          contentPadding: EdgeInsets.all(5),
                          hintText: 'Username',
                          hintStyle:
                              TextStyle(fontSize: 14, color: textColor1)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: iconColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0))),
                          contentPadding: EdgeInsets.all(5),
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(fontSize: 14, color: textColor1)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: iconColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: textColor1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0))),
                          contentPadding: EdgeInsets.all(5),
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(fontSize: 14, color: textColor1)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 500,
              right: 100,
              left: 100,
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    backgroundColor: backgroundss,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  // decoration: BoxDecoration(

                  //     color: backgroundss,

                  //     borderRadius: BorderRadius.circular(30),
                  //     boxShadow: [
                  //       BoxShadow(
                  //           color: Colors.black.withOpacity(.3),
                  //           spreadRadius: 1,
                  //           blurRadius: 2,
                  //           offset: Offset(0, 1))
                  //     ]),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
