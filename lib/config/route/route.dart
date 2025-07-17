


import 'package:clean_architecture_weather_new_app/config/route/routename.dart';
import 'package:clean_architecture_weather_new_app/views/navigationbarscreen/newspage/newsdetailes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../views/views.dart';

class Routes{

  static Route<dynamic>generatoroute(RouteSettings setting){
    switch(setting.name){
      case RouteNames.splashscreen:
        return MaterialPageRoute(builder: (context)=>SplashScreen());
      case RouteNames.navigation:
        return MaterialPageRoute(builder: (context)=>Homescreens());
      case RouteNames.profile:
        return MaterialPageRoute(builder: (context)=>Profilepage());
      case RouteNames.setting:
        return MaterialPageRoute(builder: (context)=>Settingpage());
      case RouteNames.newsapp:
        return MaterialPageRoute(builder: (context)=>Newspages());
      case RouteNames.weatherapp:
        return MaterialPageRoute(builder: (context)=>Weatherdata());
      case RouteNames.newsdetails:
        return MaterialPageRoute(builder: (context)=>Newsdetailes());

      default:
        return MaterialPageRoute(builder: (context){
          return Scaffold(
           body: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("No Route Found")
               ],
             ),
           ),
          );
        });
    }
  }

}