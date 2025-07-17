

import 'package:clean_architecture_weather_new_app/config/route/routename.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashServices {

  Future<void>is_login(BuildContext context)async {
   await Future.delayed(Duration(seconds: 6),(){
      Navigator.pushReplacementNamed(context, RouteNames.navigation);
    });
  }

}