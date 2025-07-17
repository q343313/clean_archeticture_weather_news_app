


import 'package:clean_architecture_weather_new_app/config/data/network/apiservicesimplement.dart';
import 'package:clean_architecture_weather_new_app/models/newsmodels/newsmodels.dart';

class NewsRepository{
  
  ApiServicesImplement apiServicesImplement = ApiServicesImplement();
  
  Future<NewsApiResponse>getnewsdata(String newstype)async{
    final urls = "https://newsapi.org/v2/everything?q=$newstype&from=2025-06-17&sortBy=publishedAt&apiKey=2009d1e4eec24cf98c675aa11493fce8";
    final response = await apiServicesImplement.getapi(urls);
    return NewsApiResponse.fromJson(response);
  }
  
}