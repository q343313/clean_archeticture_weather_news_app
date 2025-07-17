


import 'package:clean_architecture_weather_new_app/config/data/network/apiservicesimplement.dart';
import 'package:clean_architecture_weather_new_app/models/weathermodel/weathermodel.dart';
import 'package:clean_architecture_weather_new_app/utility/urls.dart';

class WeatherRepository {

  ApiServicesImplement apiServicesImplement = ApiServicesImplement();

  Future<WeatherModel>getweatherdata(String city)async{
    final weatherapi = "http://api.weatherapi.com/v1/current.json?key=cfbf91b3d2ea4c2f8b9125817252806&q=$city&aqi=no";
    final response = await apiServicesImplement.getapi(weatherapi);
    return WeatherModel.fromJson(response);
  }

}