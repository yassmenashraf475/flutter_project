// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/modules/home/home_screen.dart';
import 'package:flutter_project/modules/signin/signin_screen.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => SignUp();
}
class SignUp extends State<signup> {
  final formkey = GlobalKey<FormState>();
  bool obs = true;
   final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
       double hei = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          child: Form(key:formkey ,child: Center(
            child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: hei/10),
                        Text(
                          "SignUp",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF73499B)),
                        ),
                        SizedBox(height: hei/35),
                        Image.asset(
                          'assets/images/shop.png', // Replace with your image asset
                          width: 400,
                          height: 140,
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
                                  Icons.person,
                                  color: Color(0xFF73499B),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter username";
                        } else {
                          return null;
                        }
                      },controller: usernameController,keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    labelText: 'Username',
                                    labelStyle: TextStyle(color: Color(0xFF73499B)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),SizedBox(height: hei/40),
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
                                  Icons.phone,
                                  color: Color(0xFF73499B),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                   validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter phone number";
                        }else if(value.length<8 || value.length>11){
                          return "Please enter valid phone number";
                        }else {
                          return null;
                        }
                      },controller: phoneNumberController,keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                   labelText: 'Phone',
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
                          if(formkey.currentState!.validate()){
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MyHomePage(),) );
                          }
                        },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF73499B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            minimumSize: Size(300, 50),
                          ),
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: hei/40),
                       Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ",style: TextStyle(color: Colors.black),),
                            TextButton(onPressed: () {
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => signin(),) );
                            }, child: Text("Sign in")),
                          ],
                        ),
                      ],
                    ),
          ),),
        ) ,
      ),
    );
  }
}