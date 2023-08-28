import 'package:flutter/material.dart';
import 'package:flutter_project/modules/account/account_screen.dart';
import 'package:flutter_project/modules/details/details_screen.dart';
import 'package:flutter_project/modules/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailsScreen(),
    );

  }
}

