
import 'dart:io';

import 'package:clean_architecture_weather_new_app/allpaths.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/imagebloc/imagesbloc.dart';
import '../../views/introscreens/account/profilescreens.dart';

class Customiamgeavatar extends StatelessWidget {
  const Customiamgeavatar({super.key,required this.image});
  final String image;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.textfielddarkmode,
          radius: 100,
          backgroundImage: image != null && image .isNotEmpty?FileImage(File(image)):null,
        ),
        Positioned(
          bottom: 0,
            right: 0,
            child:CircleAvatar(
              backgroundColor: AppColors.scaffolddarkmode,
              child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
            ) )
      ],
    );
  }
}
class CustomContImage extends StatelessWidget {
  const CustomContImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
            backgroundColor: Colors.black12,
            radius: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt_outlined),
                Text("Upload image",style: TextStyle(fontSize: 12,),)
              ],
            )
        ),
         Positioned(
              bottom: 0,
              right: 0,
              child:GestureDetector(
                  onTap: (){
                    showimagedialog(context);
                  },
                  child:CircleAvatar(
                backgroundColor: AppColors.scaffolddarkmode,
                child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
              ) ),
        )
      ],
    );
  }
}



Future<void>showimagedialog(BuildContext context){
  return showModalBottomSheet(
      context: context,
      builder: (context){
        return Container(

          width: double.infinity,
          height: 180,
          child: Column(
            children: [
              CustomListTile(icon: Icon(Icons.library_add), title: "from Gallery", callback: (){
                Navigator.pop(context);
                context.read<ImageBloc>().add(GalleryCapture());
              }),
              CustomListTile(icon: Icon(Icons.camera_alt_outlined), title: "from Camera", callback: (){
                Navigator.pop(context);
                context.read<ImageBloc>().add(CameraCapture());
              }),
              CustomListTile(icon: Icon(Icons.delete), title: "Delete", callback: (){
                Navigator.pop(context);
                context.read<ImageBloc>().add(DeleteImage());
              }),

            ],
          ),
        );
      });
}


class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key,required this.icon,required this.title,required this.callback});
  final Icon icon;
  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: callback,
      leading: icon,
      title: Customtextwidget(text: title, fontsize: 20,fontfamily: "semibold",),

    );
  }
}