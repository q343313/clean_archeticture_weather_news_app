
import 'package:clean_architecture_weather_new_app/repository/moviesrepository/moviesrepository.dart';
import 'package:equatable/equatable.dart';
import 'package:clean_architecture_weather_new_app/utility/enum.dart';

import 'package:bloc/bloc.dart';

import '../../models/moviesmodel/moviesmodel.dart';
import '../../repository/response/apiresponse.dart';

part 'apievent.dart';
part 'apistates.dart';



class ApiBlocs extends Bloc<ApiEvent,ApiStates>{
  final MoviesRepository moviesRepository;
  ApiBlocs(this.moviesRepository):super(ApiStates(movieslist: ApiResponse.loading())){
    on<GetApiData>(_getapidatA);
  }

  _getapidatA(GetApiData event,Emitter<ApiStates>emit)async{
    try{

      final  data =await moviesRepository.getmoviesdata();
      emit(state.copyWith(movieslist: ApiResponse.completed(data)));

    }catch(e){
      emit(state.copyWith(movieslist: ApiResponse.error(e.toString())));
    }
  }
}