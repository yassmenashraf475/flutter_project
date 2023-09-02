// ignore_for_file: unused_local_variable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class FireBaseHelper{
  FirebaseAuth auth=FirebaseAuth.instance;
  
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
Future<UserCredential> signInWithGoogle() async {
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
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
  //sign in
  Future<dynamic> signIn(String email,String password) async {
try{
  UserCredential user=await auth.signInWithEmailAndPassword(email:email , password: password);
  if(user.user!=null){
    return user.user;
  }
   } on FirebaseAuthException catch(e){
    return e.message;
   }
   
  }


  //sign out
  Future<dynamic> signOut() async{
    auth.signOut();
  }
}