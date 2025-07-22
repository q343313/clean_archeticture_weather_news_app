


part of'signupbloc.dart';

abstract class SignupEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class ChangeEmail  extends SignupEvent{
  final String email;
  ChangeEmail({required this.email});
  @override
  List<Object>get props => [email];
}

class ChangePassword extends SignupEvent{
  final String password;
  ChangePassword({required this.password});
  @override
  List<Object>get props => [password];
}

class ChangeUserName extends SignupEvent{
  final String username;
  ChangeUserName({required this.username});
  @override
  List<Object>get props => [username];
}

class ChangeUserBio extends SignupEvent{
  final String userbio;
  ChangeUserBio({required this.userbio});
  @override
  List<Object>get props => [userbio];
}


class ChangeUserImage extends SignupEvent{
  final String userimage;
  ChangeUserImage({required this.userimage});
  @override
  List<Object>get props => [userimage];
}

class CreateUserAccount extends SignupEvent{}
class UserDataSaveHive extends SignupEvent{}

class ShowOrHidePassword extends SignupEvent{}

class AgainInitial extends SignupEvent{}

class LoginUserAccount extends SignupEvent{}

class UserCheckBoxButtone extends SignupEvent{}

class ForgetUserPassword extends SignupEvent{}

class LogoutUserAccount extends SignupEvent{}