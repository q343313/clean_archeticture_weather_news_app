




import 'appexceptions.dart';

class NoInterNetException extends AppExceptions{
  NoInterNetException([String?message]):super(message,"No Internet Exception");
}

class ApiTimeOutException extends AppExceptions{
  ApiTimeOutException([String?message]):super(message,"Time out exception");
}

class UserNotFoundException extends AppExceptions{
  UserNotFoundException([String?message]):super(message,"User Not Found");
}

class UnAuthrizedException extends AppExceptions{
  UnAuthrizedException([String?message]):super(message,"User Not Found");
}


class BadRequestException extends AppExceptions{
  BadRequestException([String?message]):super(message,"User Not Found");
}


class DefaultException extends AppExceptions{
  DefaultException([String?message]):super(message,"Default exception");
}