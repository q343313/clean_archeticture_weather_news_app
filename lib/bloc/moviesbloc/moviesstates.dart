

part of 'moviesbloc.dart';

class MoviesStates extends Equatable{

  final ApiStatus apiStatus;
  final String message;
  final MoviesModel?moviesModel;
  final String searchmovies;

  const MoviesStates({
    this.moviesModel,
    this.apiStatus = ApiStatus.initial,
    this.message ="",
    this.searchmovies = ""
});

  MoviesStates copyWith({
     ApiStatus?apiStatus,
     String?message,
     MoviesModel?moviesModel,
     String?searchmovies,
}){
    return MoviesStates(
      apiStatus: apiStatus??this.apiStatus,
      searchmovies: searchmovies??this.searchmovies,
      message: message??this.message,
      moviesModel: moviesModel??this.moviesModel
    );
}

  @override
  List<Object?>get props => [message,apiStatus,message,moviesModel];
}