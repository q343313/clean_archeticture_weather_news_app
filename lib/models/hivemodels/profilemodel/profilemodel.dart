




import 'package:hive/hive.dart';
part 'profilemodel.g.dart';

@HiveType(typeId: 0)
class ProfileModel extends HiveObject{

  @HiveField(0)
  String email;
  @HiveField(1)
  String username;
  @HiveField(2)
  String password;
  @HiveField(3)
  String userbio;
  @HiveField(4)
  String image;

  ProfileModel({
    required this.image,
    required this.userbio,
    required this.username,
    required this.password,
    required this.email
});
}