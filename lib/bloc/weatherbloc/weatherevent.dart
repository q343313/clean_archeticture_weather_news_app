

part of'weatherbloc.dart';


abstract class WeatherEvent extends Equatable{

  @override
  List<Object>get props => [];
}

class SearchCityWeather extends WeatherEvent{
  final String search;
  SearchCityWeather({required this.search});
  @override
  List<Object>get props => [search];
}

class GetWeatherData extends WeatherEvent{}