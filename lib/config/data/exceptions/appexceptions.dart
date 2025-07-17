



class AppExceptions implements Exception{

  final  _message;
  final  _preffix;

  AppExceptions([this._message,this._preffix]);

  @override
  String toString() {
    return "$_message $_preffix";
  }

}