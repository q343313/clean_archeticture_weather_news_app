

import 'package:clean_architecture_weather_new_app/utility/enum.dart';

class ApiResponse<T>{
  Status?status;
  T?data;
  String?message;

  ApiResponse(this.status,this.message,this.data);

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.completed(this.data) : status = Status.completed;
  ApiResponse.error(this.message):status = Status.error;

  @override
  String toString() {
    // TODO: implement toString
    return "$status $message $data";
  }

}