import 'package:flutter/material.dart';
import 'package:flutter_project/modules/signin/signin_screen.dart';
import 'package:flutter_project/modules/signup/signup_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: HexColor("F8FDFF"),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: hei / 10,
              ),
              Container(
                  child: Text(
                "Welcome To Mega",
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
                  child: Image.asset("assets/images/after_splash_photo.png")),
              SizedBox(
                height: hei / 7,
              ),
              Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor("73499B"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        minimumSize: Size(250, 50)),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return signin();
                        },
                      ));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
              SizedBox(
                height: hei/30,
              ),
              Container(
                child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor("D6C8E1"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        minimumSize: Size(250, 50)),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return signup();
                        },
                      ));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: HexColor("73499B"), fontSize: 20),
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
