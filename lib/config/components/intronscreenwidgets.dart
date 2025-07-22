
import 'package:clean_architecture_weather_new_app/allpaths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Intronscreenwidgets extends StatelessWidget {
  const Intronscreenwidgets({super.key,required this.title,required this.image,required this.title2,required this.title3});

  final String image;
  final String title;
  final String title2;
  final String title3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.grey,
              Colors.green
            ],begin: Alignment.bottomLeft)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/$image"),width: 300,height: 300,),
                SizedBox(height: 20,),
                 CustomText(text: title,
                      fontsize: 20,
                  fontfamily: "semibold",),
                CustomText(text: title2,
                  fontsize: 20,
                  fontfamily: "semibold",),
                CustomText(text: title3,
                  fontsize: 20,
                  fontfamily: "semibold",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
