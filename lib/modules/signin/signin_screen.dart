import 'package:flutter/material.dart';
import 'package:flutter_project/modules/signup/signup_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import '../details/details_screen.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  final formkey = GlobalKey<FormState>();
  bool obs = true;
  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: HexColor("F8FDFF"),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Center(
            child: Column(children: [
              SizedBox(
                height: hei / 30,
              ),
              Container(
                  child: Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                height: hei / 45,
              ),
              Container(child: Image.asset("assets/images/login.png")),
              SizedBox(
                height: hei / 20,
              ),
              SizedBox(
                width: wid * 0.60,
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
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(hei / 30),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: HexColor("73499B"),
                    ),
                    labelText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: hei / 30,
              ),
              SizedBox(
                width: wid * 0.60,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Password";
                    } else if (value.length < 8) {
                      return 'password must be 8 or more character';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(hei / 30),
                      ),
                      prefixIcon: Icon(
                        Icons.password,
                        color: HexColor("73499B"),
                      ),
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon:
                            Icon(obs ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            obs = !obs;
                          });
                        },
                      )),
                  obscureText: obs,
                ),
              ),SizedBox(height: hei/50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? ",style: TextStyle(color: Colors.black),),
                      TextButton(onPressed: () {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => signup(),) );
                      }, child: Text("Sign up")),
                    ],
                  ),
                  SizedBox(height: hei/50,),
              ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: HexColor("73499B"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
               minimumSize:Size(250, 50) ,
              ),onPressed: () {
                if(formkey.currentState!.validate()){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailsScreen(),));
                }
              }, child: Text("Sign In",style: TextStyle(color: Colors.white),))
            ]),
          ),
        ),
      )),
    );
  }
}
