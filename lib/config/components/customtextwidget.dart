
import 'package:clean_architecture_weather_new_app/config/domain/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Customtextwidget extends StatelessWidget {
  const Customtextwidget({
    super.key,
    this.fontfamily = "regular",
    required this.text,
    required this.fontsize
  });
  final String text;
  final String fontfamily;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontFamily: fontfamily,
      fontSize: fontsize,
      color: Theme.of(context).brightness == Brightness.dark
        ? AppColors.textdarkmode
          : AppColors.textlightmode
    ),);
  }
}
