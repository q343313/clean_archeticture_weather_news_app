

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_weather_new_app/models/datasavemodel/datasavemodel.dart';
import 'package:clean_architecture_weather_new_app/models/newsmodels/newsmodels.dart';
import 'package:clean_architecture_weather_new_app/repository/newsrepository/newsrepository.dart';
import 'package:clean_architecture_weather_new_app/utility/enum.dart';
import 'package:equatable/equatable.dart';

part 'newsevents.dart';
part 'newsstates.dart';

class NewsBloc extends Bloc<NewsEvent,NewsStates>{
  final NewsRepository newsRepository;
  NewsBloc(this.newsRepository):super(NewsStates()){
    on<SearchNewsType>(_newstype);
    on<GetNewsUpdates>(_getnewsupdate);
    on<SaveNewsDate>(_savenewsdata);
  }

  _newstype(SearchNewsType event,Emitter<NewsStates>emit){
    if(event.newstype == null || event.newstype == ""){
      emit(state.copyWith(newstype: state.newstype));
    }else{
      emit(state.copyWith(newstype: event.newstype));
    }
  }

  _getnewsupdate(GetNewsUpdates event,Emitter<NewsStates>emit)async{

    emit(state.copyWith(apiStatus: ApiStatus.loading));

    try {

      final newsapiresponse = await newsRepository.getnewsdata(state.newstype);
      emit(state.copyWith(apiStatus: ApiStatus.success,newsApiResponse: newsapiresponse,message: "Data Loaded Sucesfull"));

    }catch(e){
      emit(state.copyWith(apiStatus: ApiStatus.failure,message: e.toString()));
    }
  }

  _savenewsdata(SaveNewsDate event,Emitter<NewsStates>emit){
    emit(state.copyWith(newsdetail: event.dataSaveModel));
  }

}