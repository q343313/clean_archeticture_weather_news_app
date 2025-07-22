


part of'updatedprofilebloc.dart';

abstract class UpdatedProfileEvent extends Equatable{
  @override
  List<Object>get props => [];
}

class GetProfileUser extends UpdatedProfileEvent{
  final ProfileModel profileModel;
  GetProfileUser({required this.profileModel});
  @override
  List<Object>get props => [profileModel];
}

class UpdatedProfileImage extends UpdatedProfileEvent{
  final String image;
  UpdatedProfileImage({required this.image});
  @override
  List<Object>get props => [image];
}

