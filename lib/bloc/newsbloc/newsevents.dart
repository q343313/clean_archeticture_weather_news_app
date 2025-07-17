


part of'newsbloc.dart';

abstract class NewsEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class SearchNewsType extends NewsEvent{
  final String newstype;
  SearchNewsType({required this.newstype});
  @override
  List<Object>get props => [newstype];
}

class GetNewsUpdates extends NewsEvent{}

class SaveNewsDate extends NewsEvent{
  final DataSaveModel dataSaveModel;
  SaveNewsDate({required this.dataSaveModel});
  @override
  List<Object>get props => [dataSaveModel];
}