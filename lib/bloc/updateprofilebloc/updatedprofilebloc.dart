


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/hivemodels/profilemodel/profilemodel.dart';

part 'updatedprofileevent.dart';
part 'updatedprofilestates.dart';

class UpdatedUserBloc extends Bloc<UpdatedProfileEvent,UpdatedProfileStates>{
  UpdatedUserBloc():super(UpdatedProfileStates()){
    on<UpdatedProfileImage>(_updateduserimage);
    on<GetProfileUser>(_getuserprofile);
  }

  _getuserprofile(GetProfileUser event,Emitter<UpdatedProfileStates>emit){
    emit(state.copyWith(profileModel: event.profileModel));
  }

  _updateduserimage(UpdatedProfileImage event,Emitter<UpdatedProfileStates>emit)async{

      final user= state.profileModel;
    if (user != null) {
      user.image = event.image; // ✅ assign new image from event
      await user.save();        // ✅ update Hive
      emit(state.copyWith(image: event.image, profileModel: user)); // ✅ emit updated state
      print("✅ Image Updated: ${event.image}");
    } else {
      print("⚠️ User is null, can't update image.");
    }


  }
}
