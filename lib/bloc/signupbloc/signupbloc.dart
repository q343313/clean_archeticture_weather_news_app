


import 'package:bloc/bloc.dart';
import 'package:clean_architecture_weather_new_app/boxes/boxes.dart';
import 'package:clean_architecture_weather_new_app/config/data/authenticationdata/firebaseauthentications.dart';
import 'package:clean_architecture_weather_new_app/models/hivemodels/profilemodel/profilemodel.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utility/enum.dart';

part 'signupevent.dart';
part 'signupstates.dart';


class SignupBloc extends Bloc<SignupEvent,SignUpStates>{

  final FireBaseAuthentications fireBaseAuthentications;

  SignupBloc(this.fireBaseAuthentications):super(SignUpStates()){
    on<ChangeUserImage>(_images);
    on<ChangeUserBio>(_userbio);
    on<ChangePassword>(_password);
    on<ChangeUserName>(_username);
    on<ChangeEmail>(_changeemail);
    on<CreateUserAccount>(_signupuser);
    on<ShowOrHidePassword>(_showpassword);
    on<AgainInitial>(_againinitinalize);
    on<LoginUserAccount>(_loginuseraccount);
    on<UserDataSaveHive>(_datasaveinhive);
    on<UserCheckBoxButtone>(_checkbox);
    on<ForgetUserPassword>(_forgetuserpassword);
    on<LogoutUserAccount>(_logoutuseraccount);
  }

  _changeemail(ChangeEmail event,Emitter<SignUpStates>emit){
    emit(state.copyWith(email: event.email));
  }
  _username(ChangeUserName event,Emitter<SignUpStates>emit){
    emit(state.copyWith(username: event.username));
  }
  _password(ChangePassword event,Emitter<SignUpStates>emit){
    emit(state.copyWith(password: event.password));
  }
  _userbio(ChangeUserBio event,Emitter<SignUpStates>emit){
    emit(state.copyWith(userbio: event.userbio));
  }
  _images(ChangeUserImage event,Emitter<SignUpStates>emit){
    emit(state.copyWith(image: event.userimage));
  }

  _signupuser(CreateUserAccount event,Emitter<SignUpStates>emit)async{
    emit(state.copyWith(authStates: AuthStates.loading));

    try{

      await fireBaseAuthentications.signupuser(state.email, state.password);
        emit(state.copyWith(authStates: AuthStates.success,message :"Signup Succesfully"));
    }on FirebaseAuthException catch(e){
      emit(state.copyWith(authStates: AuthStates.failure,message: e.code.toString()));
    }
  }


  _showpassword(ShowOrHidePassword event,Emitter<SignUpStates>emit){
    emit(state.copyWith(showpassword: !state.showpassword));
  }

  _againinitinalize(AgainInitial event,Emitter<SignUpStates>emit){
    emit(state.copyWith(authStates: AuthStates.initial,message: ""));
  }

  _loginuseraccount(LoginUserAccount event,Emitter<SignUpStates>emit)async{
    emit(state.copyWith(authStates: AuthStates.loading));

    try{

      await fireBaseAuthentications.loginuser(state.email, state.password);
      emit(state.copyWith(message: "Login Succesfully",authStates: AuthStates.success));

    }on FirebaseAuthException catch(e){
      emit(state.copyWith(message: e.code.toString(),authStates: AuthStates.failure));
    }
  }

  _datasaveinhive(UserDataSaveHive event,Emitter<SignUpStates>emit){

    try {
      ProfileModel profileModel = ProfileModel(
          image: state.image,
          userbio: state.userbio,
          username: state.username,
          password: state.password,
          email: state.email
      );

      final box = Boxes.getprofiledata();
      box.add(profileModel);
      profileModel.save();
      emit(state.copyWith(message: "Data Add in Hive Succesfully"));
    } catch(e){
      emit(state.copyWith(message: e.toString()));
    }
  }


  _checkbox(UserCheckBoxButtone event,Emitter<SignUpStates>emit){
    emit(state.copyWith(checkbox: !state.checkbox));
  }


  _forgetuserpassword(ForgetUserPassword event,Emitter<SignUpStates>emit)async{
    emit(state.copyWith(authStates: AuthStates.loading));

    try {

      await fireBaseAuthentications.resetpassword(state.email);
      emit(state.copyWith(authStates: AuthStates.success,message: "Email send to reset password"));
    }on FirebaseAuthException catch(e){
      emit(state.copyWith(authStates: AuthStates.failure,message: e.code.toString()));
    }
  }

  _logoutuseraccount(LogoutUserAccount event,Emitter<SignUpStates>emit)async{
    try {

      await fireBaseAuthentications.logoutuser();
     await Boxes.getprofiledata().clear();
      emit(state.copyWith(
        authStates: AuthStates.initial,
        message: "User Logout Succesfully",
        email: "",
        password: "",
        userbio: "",
        username: "",
        image: ""
      ));
    }on FirebaseAuthException catch(e){
      emit(state.copyWith(authStates: AuthStates.failure,message: e.code.toString()));
    }
  }


}