


part of 'newsbloc.dart';

class NewsStates extends Equatable{

  final String message;
  final NewsApiResponse?newsApiResponse;
  final ApiStatus apiStatus;
  final String newstype;
  final DataSaveModel?newsdetail;

 const NewsStates({
    this.apiStatus = ApiStatus.initial,
    this.newsApiResponse,
    this.newstype = "cricket",
    this.message = "",
   this.newsdetail
});

 NewsStates copyWith({
    String?message,
    NewsApiResponse?newsApiResponse,
    ApiStatus?apiStatus,
    String?newstype,
   DataSaveModel?newsdetail
}){
   return NewsStates(
     message: message??this.message,
     apiStatus: apiStatus??this.apiStatus,
     newsApiResponse: newsApiResponse??this.newsApiResponse,
     newstype: newstype??this.newstype,
     newsdetail: newsdetail??this.newsdetail
   );
 }

  @override
  List<Object?>get props => [message,apiStatus,newstype,newsApiResponse,newsdetail];
}