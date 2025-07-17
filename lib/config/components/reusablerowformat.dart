

import 'package:clean_architecture_weather_new_app/config/domain/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Reusablerowformat extends StatelessWidget {
  final String head;
  final String title;
  const Reusablerowformat({super.key,required this.head,required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "${head}  ----->   ", fontsize: 20,fontfamily: "semibold",),
              CustomText(text: title, fontsize: 20,fontfamily: "semibold",)
            ],
          ),
        ),
        Divider(
          color:Theme.of(context).brightness== Brightness.dark
              ? AppColors.textfielddarkmode
              : AppColors.hintlightmode,
        )
      ],
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({super.key,required this.text,required this.fontsize,this.fontfamily});
  final String text;
  final double fontsize;
  final String?fontfamily;


  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontSize: fontsize,
      fontFamily: fontfamily??"regular",
      color: Theme.of(context).brightness== Brightness.dark
        ? AppColors.textdarkmode
          : AppColors.textlightmode,

    ),);
  }
}
