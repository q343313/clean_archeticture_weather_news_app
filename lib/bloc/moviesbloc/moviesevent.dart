

part of'moviesbloc.dart';

abstract class MoviesEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class GetMoviesData extends MoviesEvent{}
class SearchMovies extends MoviesEvent{
  final String search;
  SearchMovies({required this.search});
  @override
  List<Object>get props =>[search];
}
