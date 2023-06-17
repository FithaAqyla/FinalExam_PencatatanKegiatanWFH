import 'package:finalexamflutter/view/color.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    RichText(
                        text: const TextSpan(
                            text: "Welcome Back..",
                            style: TextStyle(
                                fontSize: 25,
                                letterSpacing: 2,
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text:
                                  '\n\nTo keep connected with us please login \nwith your personal info',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal))
                        ])),
                    SizedBox(
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
              ),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'LOGIN',
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
                            Icons.lock,
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
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
