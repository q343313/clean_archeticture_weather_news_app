

part of 'apibloc.dart';

class ApiStates extends Equatable{

  final ApiResponse<MoviesModel>movieslist;

  const ApiStates({required this.movieslist});

  ApiStates copyWith({
    ApiResponse<MoviesModel>?movieslist
}){
    return ApiStates(movieslist: movieslist??this.movieslist);
  }

  @override
  List<Object>get props  => [movieslist];
}