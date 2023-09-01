// ignore_for_file: unused_import

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../welcome/welcome.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splash();
}

class _splash extends State<splash> {
   void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => welcome())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('assets/images/SPLASHUPDATE.json'),
      ),
    );
  }
}
