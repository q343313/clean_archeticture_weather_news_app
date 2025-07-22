

import 'package:clean_architecture_weather_new_app/boxes/boxes.dart';
import 'package:clean_architecture_weather_new_app/config/route/routename.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashServices {

  Future<void>is_login(BuildContext context)async {
   await Future.delayed(Duration(seconds: 6),(){
     Boxes.getprofiledata().isEmpty?Navigator.pushReplacementNamed(context, RouteNames.introscreen):
      Navigator.pushReplacementNamed(context, RouteNames.navigation);
    });
  }

}