


import 'package:clean_architecture_weather_new_app/config/route/routename.dart';
import 'package:clean_architecture_weather_new_app/views/introscreens/account/forgetpasswordscreens.dart';
import 'package:clean_architecture_weather_new_app/views/introscreens/account/loginsscreens.dart';
import 'package:clean_architecture_weather_new_app/views/introscreens/account/profilescreens.dart';
import 'package:clean_architecture_weather_new_app/views/introscreens/account/signupscreens.dart';
import 'package:clean_architecture_weather_new_app/views/introscreens/intro/intro1screens.dart';
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
        return MaterialPageRoute(builder: (context)=>MoviesPage());
      case RouteNames.newsapp:
        return MaterialPageRoute(builder: (context)=>Newspages());
      case RouteNames.weatherapp:
        return MaterialPageRoute(builder: (context)=>Weatherdata());
      case RouteNames.newsdetails:
        return MaterialPageRoute(builder: (context)=>Newsdetailes());
      case RouteNames.introscreen:
        return MaterialPageRoute(builder: (context)=>Intro1screens());
      case RouteNames.signupscreen:
        return MaterialPageRoute(builder: (context)=>Signupscreens());
      case RouteNames.loginscreen:
        return MaterialPageRoute(builder: (context)=>Loginsscreens());
      case RouteNames.profiledata:
        return MaterialPageRoute(builder: (context)=>Profilescreens());
      case RouteNames.forgetpassword:
        return MaterialPageRoute(builder: (context)=>Forgetpasswordscreens());

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