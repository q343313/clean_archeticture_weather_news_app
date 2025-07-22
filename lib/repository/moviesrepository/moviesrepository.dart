



import 'package:clean_architecture_weather_new_app/config/data/network/apiservicesimplement.dart';
import 'package:clean_architecture_weather_new_app/models/moviesmodel/moviesmodel.dart';
import 'package:clean_architecture_weather_new_app/utility/urls.dart';

abstract  class MoviesRepository{


  Future<MoviesModel>getmoviesdata();
}