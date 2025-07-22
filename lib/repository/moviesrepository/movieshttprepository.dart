


import 'package:clean_architecture_weather_new_app/repository/moviesrepository/moviesrepository.dart';

import '../../config/data/network/apiservicesimplement.dart';
import '../../models/moviesmodel/moviesmodel.dart';
import '../../utility/urls.dart';

class MoviesHttprepository extends MoviesRepository{

  ApiServicesImplement apiServicesImplement = ApiServicesImplement();

  @override
  Future<MoviesModel>getmoviesdata()async{
    final response = await apiServicesImplement.getapi(AppUrls.moviesurl);
    return MoviesModel.fromJson(response);
  }
}