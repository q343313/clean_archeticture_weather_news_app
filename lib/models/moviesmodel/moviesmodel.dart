

import 'package:freezed_annotation/freezed_annotation.dart';

part 'moviesmodel.freezed.dart';
part 'moviesmodel.g.dart';

@freezed
class MoviesModel with _$MoviesModel{

  factory MoviesModel({

   @Default(0) @JsonKey(name: "total") int total,
    @Default(0) int page,
    @Default(0) int pages,
    @JsonKey(name: "tv_shows")required List<Tvshows>tvshow


})= _MoviesModel;

  factory MoviesModel.fromJson(Map<String,dynamic>json)=>_$MoviesModelFromJson(json);
}

@freezed
class Tvshows with _$Tvshows{

  factory Tvshows({

    @Default(0) int id,
    @Default("") @JsonKey(name: "name") String name,
    @Default("") @JsonKey(name: "permalink") String permalink,
  @Default("") @JsonKey(name: "start_date") String start_date,
    @Default("") @JsonKey(name: "end_date") String end_date,
    @Default("") @JsonKey(name: "country") String country,
    @Default("") @JsonKey(name: "network") String network,
    @Default("") @JsonKey(name: "status") String status,
    @Default("") @JsonKey(name: "image_thumbnail_path") String image_thumbnail_path,

}) = _Tvshows;

  factory Tvshows.fromJson(Map<String,dynamic>json)=> _$TvshowsFromJson(json);

}
