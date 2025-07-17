


import 'package:freezed_annotation/freezed_annotation.dart';

part 'datasavemodel.freezed.dart';
part 'datasavemodel.g.dart';

@Freezed()
class DataSaveModel with _$DataSaveModel{

  factory DataSaveModel({

   required String author,
   required String title,
   required String description,
    required String image

}) = _DataSaveModel;

  factory DataSaveModel.fromJson(Map<String,dynamic>json)=>_$DataSaveModelFromJson(json);

}