

part of'updatedprofilebloc.dart';

class UpdatedProfileStates extends Equatable{

  final  ProfileModel?profileModel;
  final String image;


  const UpdatedProfileStates({
   this.profileModel,
   this.image =""
});

  UpdatedProfileStates copyWith({
      ProfileModel?profileModel,
     String?image
}){
    return UpdatedProfileStates(
      profileModel: profileModel??this.profileModel,
      image: image??this.image
    );
  }

  @override
  List<Object?>get props => [image,profileModel];
}