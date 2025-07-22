// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moviesmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoviesModel _$MoviesModelFromJson(Map<String, dynamic> json) {
  return _MoviesModel.fromJson(json);
}

/// @nodoc
mixin _$MoviesModel {
  @JsonKey(name: "total")
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  @JsonKey(name: "tv_shows")
  List<Tvshows> get tvshow => throw _privateConstructorUsedError;

  /// Serializes this MoviesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MoviesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoviesModelCopyWith<MoviesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesModelCopyWith<$Res> {
  factory $MoviesModelCopyWith(
          MoviesModel value, $Res Function(MoviesModel) then) =
      _$MoviesModelCopyWithImpl<$Res, MoviesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "total") int total,
      int page,
      int pages,
      @JsonKey(name: "tv_shows") List<Tvshows> tvshow});
}

/// @nodoc
class _$MoviesModelCopyWithImpl<$Res, $Val extends MoviesModel>
    implements $MoviesModelCopyWith<$Res> {
  _$MoviesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoviesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? tvshow = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      tvshow: null == tvshow
          ? _value.tvshow
          : tvshow // ignore: cast_nullable_to_non_nullable
              as List<Tvshows>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoviesModelImplCopyWith<$Res>
    implements $MoviesModelCopyWith<$Res> {
  factory _$$MoviesModelImplCopyWith(
          _$MoviesModelImpl value, $Res Function(_$MoviesModelImpl) then) =
      __$$MoviesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total") int total,
      int page,
      int pages,
      @JsonKey(name: "tv_shows") List<Tvshows> tvshow});
}

/// @nodoc
class __$$MoviesModelImplCopyWithImpl<$Res>
    extends _$MoviesModelCopyWithImpl<$Res, _$MoviesModelImpl>
    implements _$$MoviesModelImplCopyWith<$Res> {
  __$$MoviesModelImplCopyWithImpl(
      _$MoviesModelImpl _value, $Res Function(_$MoviesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MoviesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? pages = null,
    Object? tvshow = null,
  }) {
    return _then(_$MoviesModelImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      tvshow: null == tvshow
          ? _value._tvshow
          : tvshow // ignore: cast_nullable_to_non_nullable
              as List<Tvshows>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoviesModelImpl implements _MoviesModel {
  _$MoviesModelImpl(
      {@JsonKey(name: "total") this.total = 0,
      this.page = 0,
      this.pages = 0,
      @JsonKey(name: "tv_shows") required final List<Tvshows> tvshow})
      : _tvshow = tvshow;

  factory _$MoviesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoviesModelImplFromJson(json);

  @override
  @JsonKey(name: "total")
  final int total;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pages;
  final List<Tvshows> _tvshow;
  @override
  @JsonKey(name: "tv_shows")
  List<Tvshows> get tvshow {
    if (_tvshow is EqualUnmodifiableListView) return _tvshow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tvshow);
  }

  @override
  String toString() {
    return 'MoviesModel(total: $total, page: $page, pages: $pages, tvshow: $tvshow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviesModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            const DeepCollectionEquality().equals(other._tvshow, _tvshow));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, pages,
      const DeepCollectionEquality().hash(_tvshow));

  /// Create a copy of MoviesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviesModelImplCopyWith<_$MoviesModelImpl> get copyWith =>
      __$$MoviesModelImplCopyWithImpl<_$MoviesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoviesModelImplToJson(
      this,
    );
  }
}

abstract class _MoviesModel implements MoviesModel {
  factory _MoviesModel(
          {@JsonKey(name: "total") final int total,
          final int page,
          final int pages,
          @JsonKey(name: "tv_shows") required final List<Tvshows> tvshow}) =
      _$MoviesModelImpl;

  factory _MoviesModel.fromJson(Map<String, dynamic> json) =
      _$MoviesModelImpl.fromJson;

  @override
  @JsonKey(name: "total")
  int get total;
  @override
  int get page;
  @override
  int get pages;
  @override
  @JsonKey(name: "tv_shows")
  List<Tvshows> get tvshow;

  /// Create a copy of MoviesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoviesModelImplCopyWith<_$MoviesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tvshows _$TvshowsFromJson(Map<String, dynamic> json) {
  return _Tvshows.fromJson(json);
}

/// @nodoc
mixin _$Tvshows {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "permalink")
  String get permalink => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  String get start_date => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  String get end_date => throw _privateConstructorUsedError;
  @JsonKey(name: "country")
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: "network")
  String get network => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "image_thumbnail_path")
  String get image_thumbnail_path => throw _privateConstructorUsedError;

  /// Serializes this Tvshows to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tvshows
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvshowsCopyWith<Tvshows> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvshowsCopyWith<$Res> {
  factory $TvshowsCopyWith(Tvshows value, $Res Function(Tvshows) then) =
      _$TvshowsCopyWithImpl<$Res, Tvshows>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "permalink") String permalink,
      @JsonKey(name: "start_date") String start_date,
      @JsonKey(name: "end_date") String end_date,
      @JsonKey(name: "country") String country,
      @JsonKey(name: "network") String network,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "image_thumbnail_path") String image_thumbnail_path});
}

/// @nodoc
class _$TvshowsCopyWithImpl<$Res, $Val extends Tvshows>
    implements $TvshowsCopyWith<$Res> {
  _$TvshowsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tvshows
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? permalink = null,
    Object? start_date = null,
    Object? end_date = null,
    Object? country = null,
    Object? network = null,
    Object? status = null,
    Object? image_thumbnail_path = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permalink: null == permalink
          ? _value.permalink
          : permalink // ignore: cast_nullable_to_non_nullable
              as String,
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      image_thumbnail_path: null == image_thumbnail_path
          ? _value.image_thumbnail_path
          : image_thumbnail_path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvshowsImplCopyWith<$Res> implements $TvshowsCopyWith<$Res> {
  factory _$$TvshowsImplCopyWith(
          _$TvshowsImpl value, $Res Function(_$TvshowsImpl) then) =
      __$$TvshowsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "permalink") String permalink,
      @JsonKey(name: "start_date") String start_date,
      @JsonKey(name: "end_date") String end_date,
      @JsonKey(name: "country") String country,
      @JsonKey(name: "network") String network,
      @JsonKey(name: "status") String status,
      @JsonKey(name: "image_thumbnail_path") String image_thumbnail_path});
}

/// @nodoc
class __$$TvshowsImplCopyWithImpl<$Res>
    extends _$TvshowsCopyWithImpl<$Res, _$TvshowsImpl>
    implements _$$TvshowsImplCopyWith<$Res> {
  __$$TvshowsImplCopyWithImpl(
      _$TvshowsImpl _value, $Res Function(_$TvshowsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tvshows
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? permalink = null,
    Object? start_date = null,
    Object? end_date = null,
    Object? country = null,
    Object? network = null,
    Object? status = null,
    Object? image_thumbnail_path = null,
  }) {
    return _then(_$TvshowsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      permalink: null == permalink
          ? _value.permalink
          : permalink // ignore: cast_nullable_to_non_nullable
              as String,
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      image_thumbnail_path: null == image_thumbnail_path
          ? _value.image_thumbnail_path
          : image_thumbnail_path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TvshowsImpl implements _Tvshows {
  _$TvshowsImpl(
      {this.id = 0,
      @JsonKey(name: "name") this.name = "",
      @JsonKey(name: "permalink") this.permalink = "",
      @JsonKey(name: "start_date") this.start_date = "",
      @JsonKey(name: "end_date") this.end_date = "",
      @JsonKey(name: "country") this.country = "",
      @JsonKey(name: "network") this.network = "",
      @JsonKey(name: "status") this.status = "",
      @JsonKey(name: "image_thumbnail_path") this.image_thumbnail_path = ""});

  factory _$TvshowsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvshowsImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "permalink")
  final String permalink;
  @override
  @JsonKey(name: "start_date")
  final String start_date;
  @override
  @JsonKey(name: "end_date")
  final String end_date;
  @override
  @JsonKey(name: "country")
  final String country;
  @override
  @JsonKey(name: "network")
  final String network;
  @override
  @JsonKey(name: "status")
  final String status;
  @override
  @JsonKey(name: "image_thumbnail_path")
  final String image_thumbnail_path;

  @override
  String toString() {
    return 'Tvshows(id: $id, name: $name, permalink: $permalink, start_date: $start_date, end_date: $end_date, country: $country, network: $network, status: $status, image_thumbnail_path: $image_thumbnail_path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvshowsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.permalink, permalink) ||
                other.permalink == permalink) &&
            (identical(other.start_date, start_date) ||
                other.start_date == start_date) &&
            (identical(other.end_date, end_date) ||
                other.end_date == end_date) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.image_thumbnail_path, image_thumbnail_path) ||
                other.image_thumbnail_path == image_thumbnail_path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, permalink, start_date,
      end_date, country, network, status, image_thumbnail_path);

  /// Create a copy of Tvshows
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvshowsImplCopyWith<_$TvshowsImpl> get copyWith =>
      __$$TvshowsImplCopyWithImpl<_$TvshowsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvshowsImplToJson(
      this,
    );
  }
}

abstract class _Tvshows implements Tvshows {
  factory _Tvshows(
      {final int id,
      @JsonKey(name: "name") final String name,
      @JsonKey(name: "permalink") final String permalink,
      @JsonKey(name: "start_date") final String start_date,
      @JsonKey(name: "end_date") final String end_date,
      @JsonKey(name: "country") final String country,
      @JsonKey(name: "network") final String network,
      @JsonKey(name: "status") final String status,
      @JsonKey(name: "image_thumbnail_path")
      final String image_thumbnail_path}) = _$TvshowsImpl;

  factory _Tvshows.fromJson(Map<String, dynamic> json) = _$TvshowsImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "permalink")
  String get permalink;
  @override
  @JsonKey(name: "start_date")
  String get start_date;
  @override
  @JsonKey(name: "end_date")
  String get end_date;
  @override
  @JsonKey(name: "country")
  String get country;
  @override
  @JsonKey(name: "network")
  String get network;
  @override
  @JsonKey(name: "status")
  String get status;
  @override
  @JsonKey(name: "image_thumbnail_path")
  String get image_thumbnail_path;

  /// Create a copy of Tvshows
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvshowsImplCopyWith<_$TvshowsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
