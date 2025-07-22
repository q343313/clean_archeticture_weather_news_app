

import 'package:image_picker/image_picker.dart';

class ImageRepository{


  final _picker = ImagePicker();

  Future<XFile?>cameraiamge()async{
    final XFile? imagepath = await _picker.pickImage(source: ImageSource.camera,imageQuality: 80);
    return  imagepath;
  }

  Future<XFile?>galleryimage()async{
    final XFile? imagepath = await _picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
    return  imagepath;
  }



}