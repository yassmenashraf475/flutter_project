import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/ThemeProvider/theme_provider.dart';
import 'package:flutter_project/layout/home_layout.dart';
import 'package:flutter_project/modules/account/account_screen.dart';
import 'package:flutter_project/modules/details/details_screen.dart';
import 'package:flutter_project/modules/home/home_screen.dart';
import 'package:flutter_project/modules/signin/signin_screen.dart';
import 'package:flutter_project/modules/signup/signup_screen.dart';
import 'package:flutter_project/modules/splash/splash_screen.dart';
import 'package:flutter_project/modules/welcome/welcome.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
Widget start (){
  if(FirebaseAuth.instance.currentUser!=null){
    return HomeLayout();
  }else{
    return splash();
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>ChangeNotifierProvider(
      create: (context)=>ThemeProvider(),
      builder: (context,_){
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          darkTheme: MyTheme.darkTheme,
          theme: MyTheme.lightTheme,
          home: splash(),
        );
      }
  );
}
