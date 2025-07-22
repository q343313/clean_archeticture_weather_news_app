

import 'package:clean_architecture_weather_new_app/models/hivemodels/profilemodel/profilemodel.dart';
import 'package:hive/hive.dart';

class Boxes{
  static Box<ProfileModel>getprofiledata()=>Hive.box<ProfileModel>("profile");
}