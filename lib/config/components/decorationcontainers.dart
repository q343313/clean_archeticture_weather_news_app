

import 'package:clean_architecture_weather_new_app/allpaths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Decorationcontainers extends StatelessWidget {
  const Decorationcontainers({
    super.key,
    this.width= double.infinity,
    this.height  = 360,
    this.colors =const [
      Colors.grey,
      Colors.green,
    ],
    required this.text
  });
  final double width;
  final double height;
  final List<Color> colors;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors,begin: Alignment.bottomLeft),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(120),bottomLeft: Radius.circular(120))
      ),
      child: Center(
        child: Text(text,style: TextStyle(
          fontFamily: "bold",
          fontSize: 30,
          color: AppColors.scaffoldlightmode
        ),),
      ),
    );
  }
}
