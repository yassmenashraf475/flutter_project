import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/layout/home_layout.dart';
import 'package:flutter_project/modules/account/account_screen.dart';
import 'package:flutter_project/modules/details/details_screen.dart';
import 'package:flutter_project/modules/home/home_screen.dart';
import 'package:flutter_project/modules/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );

  }
}

