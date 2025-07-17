


part of'weatherbloc.dart';


class  WeatherStates extends Equatable{

  final WeatherModel?weatherdata ;
  final ApiStatus apiStatus;
  final String searchweather;
  final String message;

  const WeatherStates({
    this.apiStatus = ApiStatus.initial,
    this.message = "",
    this.weatherdata,
    this.searchweather = "peshawar"
});

  WeatherStates copyWith({
    WeatherModel?weatherdata,
    String?message,
    ApiStatus?apiStatus,
    String?searchweather
}){
    return WeatherStates(
      apiStatus: apiStatus??this.apiStatus,
      message: message??this.message,
      weatherdata: weatherdata??this.weatherdata,
      searchweather: searchweather??this.searchweather
    );
  }


  @override
  List<Object?>get props => [message,weatherdata,apiStatus,searchweather];

}