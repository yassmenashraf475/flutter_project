// ignore_for_file: unused_local_variable
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class FireBaseHelper{
  FirebaseAuth auth=FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = GoogleSignIn();
  //sign up
  Future<dynamic> signUp(String email,String password,String name) async{
    try{UserCredential user=await auth.createUserWithEmailAndPassword(email:email , password: password);

    await auth.currentUser!.updateDisplayName(name);
    await auth.currentUser!.updatePhotoURL("");
    await auth.currentUser!.reload();
    if(user.user!=null){
      return user.user;
    }
    } on FirebaseAuthException catch(e){
      return e.message;
    }
  }

  //sign in with google
  Future<dynamic> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }
  Future<dynamic> SignOutWithGoogle() async {
    _googleSignIn.signOut();
  }

  //sign in
  Future<dynamic> signIn(String email,String password) async {
    try{
      UserCredential user=await auth.signInWithEmailAndPassword(email:email , password: password);
      if(user.user!=null){
        return user.user;
      }
    } on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'){
        return "user not found";
      }else if(e.code=='wrong-password'){
        return "wrong password";
      }
      return e.message;
    }
    User? use=FirebaseAuth.instance.currentUser;
    if(use!.emailVerified==false){
      await use.sendEmailVerification();
    }
  }


  //sign out
  Future<dynamic> signOut() async{
    auth.signOut();
  }
}