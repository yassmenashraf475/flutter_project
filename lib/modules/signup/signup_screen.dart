import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: HexColor("F8FDFF"),
      body: SafeArea(
          child: Center(
        child: Column(children: [
           SizedBox(
                height: hei / 10,
              ),
              Container(
                  child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                height: hei / 10,
              ),
              Container(
                  child: Image.asset("assets/images/sign_up1.png")),
              SizedBox(
                height: hei / 7,
              ),
        ]),
      )),
    );
  }
}
