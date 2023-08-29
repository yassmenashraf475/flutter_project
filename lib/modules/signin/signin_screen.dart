import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  final formkey = GlobalKey<FormState>();
  bool obs=true;
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
                    }else if (!value.contains(RegExp( r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))){
return "Please enter valid email";
                    }
                     else {
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
                    suffixIcon: IconButton(icon: Icon(obs?Icons.visibility:Icons.visibility_off),onPressed: () {
                      setState(() {
                        obs=!obs;
                      });
                    },)
                  ),
                  obscureText: obs,
                ),
              )

              
            ]),
          ),
        ),
      )),
    );
  }
}
