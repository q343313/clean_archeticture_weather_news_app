
import 'package:clean_architecture_weather_new_app/config/components/customtextwidget.dart';
import 'package:clean_architecture_weather_new_app/config/domain/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Customcardwidget extends StatelessWidget {

  final String title;
  final String detail;

  const Customcardwidget({super.key,required this.title,required this.detail});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Theme.of(context).brightness == Brightness.dark
      ? AppColors.textfielddarkmode
      : AppColors.scaffoldlightmode,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Customtextwidget(text: title,
                fontsize: 23,fontfamily: "bold",),
            Align(alignment: Alignment.topLeft,
            child: Wrap(
              children: [
                Customtextwidget(text: detail,
                    fontsize: 18,fontfamily: "semibold",)
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
