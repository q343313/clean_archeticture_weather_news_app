


import 'package:bloc/bloc.dart';
import 'package:clean_architecture_weather_new_app/repository/weatherrepository/weatherrepository.dart';
import 'package:equatable/equatable.dart';
import 'package:clean_architecture_weather_new_app/utility/enum.dart';
import 'package:clean_architecture_weather_new_app/models/weathermodel/weathermodel.dart';
part 'weatherevent.dart';
part 'weatherstates.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherStates>{
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository):super(WeatherStates()){
on<GetWeatherData>(_getweatherdata);
on<SearchCityWeather>(_searchweatherdata);
  }

  _searchweatherdata(SearchCityWeather event,Emitter<WeatherStates>emit){
    if(event.search == null ||event.search ==""){
      emit(state.copyWith(searchweather: state.searchweather));
    }else{
      emit(state.copyWith(searchweather: event.search));
    }
  }

  _getweatherdata(GetWeatherData event,Emitter<WeatherStates>emit)async{
    emit(state.copyWith(apiStatus: ApiStatus.loading));

    try{

      final weatherdata = await weatherRepository.getweatherdata(state.searchweather);
      emit(state.copyWith(weatherdata: weatherdata,apiStatus: ApiStatus.success,message: "Data Get Succesfully"));

    }catch(e){
      emit(state.copyWith(apiStatus: ApiStatus.failure,message: e.toString()));
    }
  }

}