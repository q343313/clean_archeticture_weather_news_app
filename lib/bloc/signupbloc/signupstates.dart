
part of 'signupbloc.dart';

class SignUpStates extends Equatable{

  final String email;
  final String username;
  final String password;
  final String image;
  final String userbio;
  final AuthStates authStates;
  final String message;
  final bool showpassword;
  final bool checkbox;

  const SignUpStates({
   this.email = "",
   this.userbio = "",
   this.authStates = AuthStates.initial,
   this.message = "",
   this.username = "",
   this.image = "",
   this.password = "",
    this.showpassword = false,
    this.checkbox = false
});

  SignUpStates copyWith({
     String?email,
     String? username,
     String? password,
     String? image,
     String? userbio,
     AuthStates ?authStates,
     String? message,
    bool? showpassword,
    bool?checkbox
}){
    return SignUpStates(
      email: email??this.email,
      password: password??this.password,
      username: username??this.username,
      userbio: userbio??this.userbio,
      image: image??this.image,
      message: message??this.message,
      authStates: authStates??this.authStates,
      showpassword: showpassword??this.showpassword,
      checkbox: checkbox??this.checkbox
    );
  }

  @override
  List<Object>get props=> [email,password,username,userbio,image,message,authStates,showpassword,checkbox];
}