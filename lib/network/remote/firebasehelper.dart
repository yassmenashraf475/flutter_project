// ignore_for_file: unused_local_variable
import 'package:firebase_auth/firebase_auth.dart';
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