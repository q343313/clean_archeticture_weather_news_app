


part of 'imagesbloc.dart';

class ImageStates extends Equatable{

  final XFile?imagefile;

  ImageStates({this.imagefile});

  ImageStates copyWith({XFile?imagefile}){
    return ImageStates(imagefile: imagefile);
  }

  @override
  List<Object?>get props => [imagefile];
}