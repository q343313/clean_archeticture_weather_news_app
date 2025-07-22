


import 'dart:io';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../allpaths.dart';
import '../../bloc/signupbloc/signupbloc.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class CustomAuthButton extends StatelessWidget {
  CustomAuthButton({
    super.key,
    required this.formkey,
    required this.controller,
    required this.passwordcontroller,
    required this.emailcontroller,
    required this.context,

  });

  BuildContext context;
  TextEditingController emailcontroller;
  TextEditingController passwordcontroller;
  AnimationController controller;
  final GlobalKey<FormState>formkey;
  @override
  Widget build(BuildContext context) {
    return  BlocListener<SignupBloc,SignUpStates>(
      listener: (context,state){
        if(state.authStates == AuthStates.failure){
          context.read<SignupBloc>().add(AgainInitial());
            if(state.message == "email-already-in-use"){
              context.read<SignupBloc>().add(AgainInitial());
              CustomSnackbarWidget.Customsnackbar(context, "Already Exists",state.message ,ContentType.failure);
              Navigator.pushReplacementNamed(context, RouteNames.loginscreen);

          }else{
            CustomSnackbarWidget.Customsnackbar(context, "Signup Failed", state.message, ContentType.failure);
            emailcontroller.clear();
            passwordcontroller.clear();
          }
        }
        if(state.authStates == AuthStates.success){
          context.read<SignupBloc>().add(AgainInitial());
          Navigator.pushNamed(context, RouteNames.profiledata);
          CustomSnackbarWidget.Customsnackbar(context, "Successfull", state.message, ContentType.success);
          emailcontroller.clear();
          passwordcontroller.clear();
        }
      },
      child: BlocBuilder<SignupBloc, SignUpStates>(
  builder: (context, state) {
    return Elevatedbuttonwidget(
        child:BlocBuilder<SignupBloc,SignUpStates>(builder: (context,state){
          switch(state.authStates){
            case AuthStates.loading:
              return SpinKitFadingCircle(
                controller: controller,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.scaffoldlightmode:
                AppColors.scaffolddarkmode,
              );
            case AuthStates.success:
            case AuthStates.failure:
            case AuthStates.initial:
              return Text("Signup",style: TextStyle(fontSize: 23,fontFamily: "semibold",color: AppColors.scaffoldlightmode),);
          }
        }),
        callback: () {
          if(formkey.currentState!.validate()){
            if(state.checkbox == true){
              context.read<SignupBloc>().add(CreateUserAccount());
            }else{
              CustomSnackbarWidget.Customsnackbar(context, "CheckBox", "Please fill the checkbox then signup",
                  ContentType.warning);
            }

          }
        },);
  },
) ,);;
  }
}

class LoginButtonwidget extends StatelessWidget {
  LoginButtonwidget({
    super.key,
    required this.formkey,
    required this.controller,
    required this.passwordcontroller,
    required this.emailcontroller,
    required this.context,
  });

  BuildContext context;
  TextEditingController emailcontroller;
  TextEditingController passwordcontroller;
  AnimationController controller;
  final GlobalKey<FormState>formkey;

  @override
  Widget build(BuildContext context) {
    return  BlocListener<SignupBloc,SignUpStates>(
      listener: (context,state){
        if(state.authStates == AuthStates.failure){
          context.read<SignupBloc>().add(AgainInitial());
          if(state.message == "user-not-found"){
            CustomSnackbarWidget.Customsnackbar(context, "Not Exists",state.message ,ContentType.failure);
              context.read<SignupBloc>().add(AgainInitial());
              Navigator.pushReplacementNamed(context, RouteNames.signupscreen);

          }else{
            context.read<SignupBloc>().add(AgainInitial());
            CustomSnackbarWidget.Customsnackbar(context, "Login Failed", state.message, ContentType.failure);
            emailcontroller.clear();
            passwordcontroller.clear();
          }
        }
        if(state.authStates == AuthStates.success){
          context.read<SignupBloc>().add(AgainInitial());
          Navigator.pushNamed(context, RouteNames.profiledata);
          CustomSnackbarWidget.Customsnackbar(context, "Successfull", state.message, ContentType.success);
          emailcontroller.clear();
          passwordcontroller.clear();
        }
      },
      child: Elevatedbuttonwidget(
            child:BlocBuilder<SignupBloc,SignUpStates>(builder: (context,state){
              switch(state.authStates){
                case AuthStates.loading:
                  return SpinKitFadingCircle(
                    controller: controller,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.scaffoldlightmode:
                    AppColors.scaffolddarkmode,
                  );
                case AuthStates.success:
                case AuthStates.failure:
                case AuthStates.initial:
                  return Text("login",style: TextStyle(fontSize: 23,fontFamily: "semibold",color: AppColors.scaffoldlightmode),);
              }
            }),
            callback: () {
              if(formkey.currentState!.validate()){
                  context.read<SignupBloc>().add(LoginUserAccount());

              }
            },)
      ,);
  }
}

class Forgetuserpasswordbutton extends StatelessWidget {
  Forgetuserpasswordbutton({
    super.key,
    required this.formkey,
    required this.controller,
    required this.emailcontroller,
    required this.context,
  });

  BuildContext context;
  TextEditingController emailcontroller;
  AnimationController controller;
  final GlobalKey<FormState>formkey;
  @override
  Widget build(BuildContext context) {
    return  BlocListener<SignupBloc,SignUpStates>(
      listener: (context,state){
        if(state.authStates == AuthStates.failure){
          context.read<SignupBloc>().add(AgainInitial());
            CustomSnackbarWidget.Customsnackbar(context, "Error Occure",state.message ,ContentType.failure);
        }
        if(state.authStates == AuthStates.success){
          context.read<SignupBloc>().add(AgainInitial());
          Navigator.pushReplacementNamed(context, RouteNames.loginscreen);
          CustomSnackbarWidget.Customsnackbar(context, "Successfull", state.message, ContentType.success);
          emailcontroller.clear();
        }
      },
      child:  Elevatedbuttonwidget(
            child:BlocBuilder<SignupBloc,SignUpStates>(builder: (context,state){
              switch(state.authStates){
                case AuthStates.loading:
                  return SpinKitFadingCircle(
                    controller: controller,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.scaffoldlightmode:
                    AppColors.scaffolddarkmode,
                  );
                case AuthStates.success:
                case AuthStates.failure:
                case AuthStates.initial:
                  return Text("Send Email",style: TextStyle(fontSize: 23,fontFamily: "semibold",color: AppColors.scaffoldlightmode),);
              }
            }),
            callback: () {
              if(formkey.currentState!.validate()){
                  context.read<SignupBloc>().add(ForgetUserPassword());

              }
            },));
  }
}