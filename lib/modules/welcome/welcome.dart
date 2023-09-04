import 'package:flutter/material.dart';
import 'package:flutter_project/modules/signin/signin_screen.dart';
import 'package:flutter_project/modules/signup/signup_screen.dart';
import 'package:lottie/lottie.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomepage();
}

class _welcomepage extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/Rec11.png', // Replace with your image asset
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome To Mega",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: hei / 70),
                  Lottie.asset(
                      'assets/images/NEW11.json', // Replace with your Lottie animation asset
                      width: 500,
                      height: 400,
                      repeat: true),
                  SizedBox(height: hei / 90),
                  //animation
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return signin();
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF73499B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              25.0), // Adjust the radius here
                        ),
                        minimumSize: Size(300, 50) // Button color
                        ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Sign Up button pressed
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return signup();
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFFD6C8E1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              25.0), // Adjust the radius here
                        ),
                        minimumSize: Size(300, 50) // Button color
                        ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF73499B)),
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
