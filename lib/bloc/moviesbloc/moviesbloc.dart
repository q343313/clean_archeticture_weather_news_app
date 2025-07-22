

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_weather_new_app/models/moviesmodel/moviesmodel.dart';
import 'package:clean_architecture_weather_new_app/repository/moviesrepository/moviesrepository.dart';
import 'package:clean_architecture_weather_new_app/utility/enum.dart';
import 'package:equatable/equatable.dart';

part 'moviesevent.dart';
part 'moviesstates.dart';


class MoviesBloc extends Bloc<MoviesEvent,MoviesStates>{

  final MoviesRepository moviesRepository;

  MoviesBloc(this.moviesRepository):super(MoviesStates()){
    on<GetMoviesData>(_getmoviesdata);
  }

  _getmoviesdata(GetMoviesData event,Emitter<MoviesStates>emit)async{
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    try {

      final moviesdata  = await moviesRepository.getmoviesdata();
      emit(state.copyWith(apiStatus: ApiStatus.success,moviesModel: moviesdata,message: "Data Loaded Succesfully"));

    }catch(e){
      emit(state.copyWith(apiStatus: ApiStatus.failure,message: e.toString()));
    }
  }
}