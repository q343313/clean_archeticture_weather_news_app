



import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthentications {

  signupuser(String email,String password)async{
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }


  loginuser(String email,String password)async{
    try{

      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return "User login succesfully";

    }on FirebaseAuthException catch(e){
      if(e.code == "user-not-found"){}
      else if(e.code == "wrong-password"){}
    }
  }


  resetpassword(String email)async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  logoutuser()async{
    await FirebaseAuth.instance.signOut();
  }

}