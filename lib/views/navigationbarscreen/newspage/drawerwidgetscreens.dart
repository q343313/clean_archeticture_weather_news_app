

import 'dart:io';

import 'package:clean_architecture_weather_new_app/allpaths.dart';
import 'package:clean_architecture_weather_new_app/bloc/signupbloc/signupbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Drawerwidgetscreens extends StatelessWidget {
  const Drawerwidgetscreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).brightness== Brightness.dark
      ? AppColors.scaffolddarkmode
      : AppColors.scaffoldlightmode,
      child: Column(
        children: [
          SizedBox(height: 60,),
           ValueListenableBuilder(
              valueListenable: Boxes.getprofiledata().listenable(),
              builder: (context,Box box,_){
                final data = box.values.toList().cast<ProfileModel>();
                if(data.isEmpty){
                  return Center(
                    child: Customtextwidget(text: "Not Data Found", fontsize: 20),
                  );
                }else{
                  final user = data.last;
                  String image = user.image;
                  return Card(
                    color: Theme.of(context).brightness== Brightness.dark
                    ? AppColors.textfielddarkmode
                    : AppColors.textfieldlightmode,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage:image !=null || image.isNotEmpty? FileImage(File(user.image)):null,
                      child: image ==null || image.isEmpty?Center(
                        child: Icon(Icons.camera),
                      ):null,),
                      title: Customtextwidget(text: user.username,
                          fontsize: 20,fontfamily: "semibold",),
                      subtitle: Customtextwidget(text: user.email, fontsize: 12),
                    ),
                  );
                }
                
              }),

          SizedBox(height: 19,),
          CustomActionListtile(icon: Icon(Icons.account_circle_rounded), title: "Profile", callback: (){}),
          CustomActionListtile(icon: Icon(Icons.settings), title: "Setting", callback: (){}),
          CustomActionListtile(icon: Icon(
              Theme.of(context).brightness == Brightness.dark?Icons.light_mode:Icons.dark_mode
          ), title: "Theme", callback: (){
            BlocProvider.of<ThemeCubit>(context).toggletheme();
          }),
          CustomActionListtile(icon: Icon(Icons.light), title: "Light Mode", callback: (){
            BlocProvider.of<ThemeCubit>(context).lighttheme();
          }),
          CustomActionListtile(icon: Icon(Icons.dark_mode_outlined), title: "Dark Mode", callback: (){
            BlocProvider.of<ThemeCubit>(context).darktheme();
          }),
          CustomActionListtile(icon: Icon(Icons.logout), title: "logout", callback: (){
            reusabledialog(context,
                "Logout Account",
                "Are you sure ti logout your account if you logout user you can create new account",
                "logout",
                (){
                  context.read<ImageBloc>().add(DeleteImage());
                  context.read<SignupBloc>().add(LogoutUserAccount());
                });
          }),
          CustomActionListtile(icon: Icon(Icons.delete,color: Colors.red,), title: "Delete Account", callback: (){
            reusabledialog(context,
                "Delete Account",
                "Are you sure ti Delete your account if you Delete user you can create new account",
                "Delete",
                    (){
                      context.read<ImageBloc>().add(DeleteImage());
                  context.read<SignupBloc>().add(LogoutUserAccount());
                });
          }),
          CustomActionListtile(icon: Icon(Icons.person,), title: "Create Account", callback: (){
            reusabledialog(context,
                "Create Account",
                "Are you sure ti logout your account if you logout user you can create new account",
                "Create",
                    (){
              context.read<ImageBloc>().add(DeleteImage());
                  context.read<SignupBloc>().add(LogoutUserAccount());
                  Navigator.pushReplacementNamed(context, RouteNames.loginscreen);
                });
          }),
        ],
      ),
    );
  }
}


class CustomActionListtile extends StatelessWidget {
  const CustomActionListtile({super.key,required this.icon,required this.title,required this.callback});

  final Icon icon;
  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).brightness == Brightness.dark
      ? AppColors.textfielddarkmode
      : AppColors.textfieldlightmode,
      child: Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: ListTile(
        onTap: callback,
        leading: icon,
        title: Customtextwidget(text: title, fontsize: 20),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),),
    );
  }
}


Future<void>reusabledialog(BuildContext context,String title,String detail,String buttonname,VoidCallback callback){
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Customtextwidget(text: title, fontsize: 18,fontfamily: "semibold",),
      content: Customtextwidget(text: detail, fontsize: 12),
      actions: [
        Textbuttonwidgets(callback:(){
          Navigator.pop(context);
          callback();
        }, title: buttonname),
        Textbuttonwidgets(callback: (){
          Navigator.pop(context);
        }, title: "Cancel",color: Colors.blue,),
      ],
    );
  });
}