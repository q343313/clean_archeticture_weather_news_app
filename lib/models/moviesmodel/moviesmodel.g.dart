// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moviesmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoviesModelImpl _$$MoviesModelImplFromJson(Map<String, dynamic> json) =>
    _$MoviesModelImpl(
      total: (json['total'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 0,
      pages: (json['pages'] as num?)?.toInt() ?? 0,
      tvshow: (json['tv_shows'] as List<dynamic>)
          .map((e) => Tvshows.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MoviesModelImplToJson(_$MoviesModelImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'tv_shows': instance.tvshow,
    };

_$TvshowsImpl _$$TvshowsImplFromJson(Map<String, dynamic> json) =>
    _$TvshowsImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
      permalink: json['permalink'] as String? ?? "",
      start_date: json['start_date'] as String? ?? "",
      end_date: json['end_date'] as String? ?? "",
      country: json['country'] as String? ?? "",
      network: json['network'] as String? ?? "",
      status: json['status'] as String? ?? "",
      image_thumbnail_path: json['image_thumbnail_path'] as String? ?? "",
    );

Map<String, dynamic> _$$TvshowsImplToJson(_$TvshowsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'permalink': instance.permalink,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'country': instance.country,
      'network': instance.network,
      'status': instance.status,
      'image_thumbnail_path': instance.image_thumbnail_path,
    };
