


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../repository/imagereposiory/imagerepository.dart';

part 'iamgestates.dart';
part 'imageevent.dart';


class ImageBloc extends Bloc<ImageEvent,ImageStates>{

  final ImageRepository imageRepository;
  ImageBloc(this.imageRepository):super(ImageStates()){
    on<CameraCapture>(_cameraimage);
    on<GalleryCapture>(_galleryimage);
    on<DeleteImage>(_delete_image);

  }

  _cameraimage(CameraCapture event,Emitter<ImageStates>emit)async{
    final image = await imageRepository.cameraiamge();
    emit(state.copyWith(imagefile: image));
  }

  _galleryimage(GalleryCapture event,Emitter<ImageStates>emit)async{
    final image = await imageRepository.galleryimage();
    emit(state.copyWith(imagefile: image));
  }

  _delete_image(DeleteImage event,Emitter<ImageStates>emit){
    emit(state.copyWith(imagefile: null));
  }
}