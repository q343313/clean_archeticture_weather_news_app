// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'datasavemodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataSaveModel _$DataSaveModelFromJson(Map<String, dynamic> json) {
  return _DataSaveModel.fromJson(json);
}

/// @nodoc
mixin _$DataSaveModel {
  String get author => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Serializes this DataSaveModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataSaveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataSaveModelCopyWith<DataSaveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSaveModelCopyWith<$Res> {
  factory $DataSaveModelCopyWith(
          DataSaveModel value, $Res Function(DataSaveModel) then) =
      _$DataSaveModelCopyWithImpl<$Res, DataSaveModel>;
  @useResult
  $Res call({String author, String title, String description, String image});
}

/// @nodoc
class _$DataSaveModelCopyWithImpl<$Res, $Val extends DataSaveModel>
    implements $DataSaveModelCopyWith<$Res> {
  _$DataSaveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataSaveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataSaveModelImplCopyWith<$Res>
    implements $DataSaveModelCopyWith<$Res> {
  factory _$$DataSaveModelImplCopyWith(
          _$DataSaveModelImpl value, $Res Function(_$DataSaveModelImpl) then) =
      __$$DataSaveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String author, String title, String description, String image});
}

/// @nodoc
class __$$DataSaveModelImplCopyWithImpl<$Res>
    extends _$DataSaveModelCopyWithImpl<$Res, _$DataSaveModelImpl>
    implements _$$DataSaveModelImplCopyWith<$Res> {
  __$$DataSaveModelImplCopyWithImpl(
      _$DataSaveModelImpl _value, $Res Function(_$DataSaveModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataSaveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_$DataSaveModelImpl(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataSaveModelImpl implements _DataSaveModel {
  _$DataSaveModelImpl(
      {required this.author,
      required this.title,
      required this.description,
      required this.image});

  factory _$DataSaveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataSaveModelImplFromJson(json);

  @override
  final String author;
  @override
  final String title;
  @override
  final String description;
  @override
  final String image;

  @override
  String toString() {
    return 'DataSaveModel(author: $author, title: $title, description: $description, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataSaveModelImpl &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, author, title, description, image);

  /// Create a copy of DataSaveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataSaveModelImplCopyWith<_$DataSaveModelImpl> get copyWith =>
      __$$DataSaveModelImplCopyWithImpl<_$DataSaveModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataSaveModelImplToJson(
      this,
    );
  }
}

abstract class _DataSaveModel implements DataSaveModel {
  factory _DataSaveModel(
      {required final String author,
      required final String title,
      required final String description,
      required final String image}) = _$DataSaveModelImpl;

  factory _DataSaveModel.fromJson(Map<String, dynamic> json) =
      _$DataSaveModelImpl.fromJson;

  @override
  String get author;
  @override
  String get title;
  @override
  String get description;
  @override
  String get image;

  /// Create a copy of DataSaveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataSaveModelImplCopyWith<_$DataSaveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
