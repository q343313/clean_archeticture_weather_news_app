// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasavemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataSaveModelImpl _$$DataSaveModelImplFromJson(Map<String, dynamic> json) =>
    _$DataSaveModelImpl(
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$DataSaveModelImplToJson(_$DataSaveModelImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
    };
