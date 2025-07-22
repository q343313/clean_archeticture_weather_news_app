



class Vallidationsemails{
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static vallidateemail(String email){
    if(email == null || email.isEmpty){
      return "Please enter email";
    }
  }



  vallidatepassword(String password){
    if(password  == null || password.isEmpty){
      return "Please enter password";
    }else if(password.length <6 ){
      return "password lenght will be greater than 6";
    }
    return null;
  }

 static usernamevallidation(String username){
    if(username == null || username.isEmpty){
      return "Please enter Username";
    }else if(username.length > 50){
      return "Username lenght is always less than 50";
    }
    return null;
  }

 static Userbiovallidation(String userbio){
    if(userbio == null || userbio.isEmpty){
      return "Please enter Userbio";
    }else if(userbio.length > 100){
      return "Userbio lenght is always less than 50";
    }
    return null;
  }


}

