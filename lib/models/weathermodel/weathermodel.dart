

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weathermodel.freezed.dart';
part 'weathermodel.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required Location location,
    required Current current,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required String name,
    required String region,
    required String country,
    required double lat,
    required double lon,
    @JsonKey(name: 'tz_id') required String tzId,
    @JsonKey(name: 'localtime_epoch') required int localtimeEpoch,
    @JsonKey(name: 'localtime') required String localtime,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Current with _$Current {
  const factory Current({
    @JsonKey(name: 'last_updated_epoch') required int lastUpdatedEpoch,
    @JsonKey(name: 'last_updated') required String lastUpdated,
    @JsonKey(name: 'temp_c') required double tempC,
    @JsonKey(name: 'temp_f') required double tempF,
    @JsonKey(name: 'is_day') required int isDay,
    required Condition condition,
    @JsonKey(name: 'wind_mph') required double windMph,
    @JsonKey(name: 'wind_kph') required double windKph,
    @JsonKey(name: 'wind_degree') required int windDegree,
    @JsonKey(name: 'wind_dir') required String windDir,
    @JsonKey(name: 'pressure_mb') required double pressureMb,
    @JsonKey(name: 'pressure_in') required double pressureIn,
    @JsonKey(name: 'precip_mm') required double precipMm,
    @JsonKey(name: 'precip_in') required double precipIn,
    required int humidity,
    required int cloud,
    @JsonKey(name: 'feelslike_c') required double feelslikeC,
    @JsonKey(name: 'feelslike_f') required double feelslikeF,
    @JsonKey(name: 'windchill_c') required double windchillC,
    @JsonKey(name: 'windchill_f') required double windchillF,
    @JsonKey(name: 'heatindex_c') required double heatindexC,
    @JsonKey(name: 'heatindex_f') required double heatindexF,
    @JsonKey(name: 'dewpoint_c') required double dewpointC,
    @JsonKey(name: 'dewpoint_f') required double dewpointF,
    @JsonKey(name: 'vis_km') required double visKm,
    @JsonKey(name: 'vis_miles') required double visMiles,
    required double uv,
    @JsonKey(name: 'gust_mph') required double gustMph,
    @JsonKey(name: 'gust_kph') required double gustKph,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

@freezed
class Condition with _$Condition {
  const factory Condition({
    required String text,
    required String icon,
    required int code,
  }) = _Condition;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
}
