import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/modules/home/home_screen.dart';
import 'package:flutter_project/modules/signup/signup_screen.dart';
import 'package:flutter_project/network/remote/firebasehelper.dart';
class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => login();
}
class login extends State<signin> {
    final formkey = GlobalKey<FormState>();
  bool obs = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Form(
          key:formkey,
          child:  Center(
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      SizedBox(height: hei/10),
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Color(0xFF73499B)),
                    ),
                    SizedBox(height: hei/20),
                    Image.asset(
                      'assets/images/shop.png', // Replace with your image asset
                      width: 400,
                      height: 160,
                    ),
                    SizedBox(height: hei/40),
                    Container(
                          width: 300,
                          decoration: BoxDecoration(
                            color: Color(0xFFD6C8E1),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.email,
                                  color: Color(0xFF73499B),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                   validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter email";
                                } else if (!value.contains(RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))) {
                                  return "Please enter valid email";
                                } else {
                                  return null;
                                }
                              },controller: emailController,keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                   labelText: 'Email',
                                    labelStyle: TextStyle(color: Color(0xFF73499B)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    SizedBox(height: hei/40),
                    Container(
                          width: 300,
                          decoration: BoxDecoration(
                            color: Color(0xFFD6C8E1),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.lock,
                                  color: Color(0xFF73499B),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(     
                                    validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Password";
                        } else if (value.length < 8) {
                          return 'password must be 8 or more character';
                        } else {
                          return null;
                        }
                      },controller: passwordController,         
                                  decoration: InputDecoration(
                                    
                                 labelText: 'Password',
                                    labelStyle: TextStyle(color: Color(0xFF73499B)),
                                    border: InputBorder.none,
                                    suffixIcon: IconButton(
                              icon:
                                  Icon(obs ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  obs = !obs;
                                });
                              },
                            )
                                  ),
                                  obscureText: obs,
                                ),
                              ),
                            ],
                          ),
                        ),
                    SizedBox(height: hei/40),
                    ElevatedButton(
                      onPressed: () {
                       LoginAction();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF73499B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        minimumSize: Size(300, 50),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: hei/40),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? ",style: TextStyle(color: Colors.black),),
                        TextButton(onPressed: () {
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => signup(),) );
                        }, child: Text("Sign up")),
                      ],
                    ),
                  ],
                ),
        ),),
      ))
    );
  }
  
 void LoginAction() async {
    if (formkey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xFF73499B)),
          );
        },
      );
      FireBaseHelper()
          .signIn(
              emailController.text.toString(),
              passwordController.text.toString())
          .then(
        (value) {
          if (value is User) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
          } else if (value is String) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(value),
            ));
          }
        },
      );
    }
  }
}
