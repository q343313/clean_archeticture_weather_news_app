

import 'package:clean_architecture_weather_new_app/allpaths.dart';
import 'package:clean_architecture_weather_new_app/views/introscreens/account/signupscreens.dart';
import 'package:flutter/material.dart';

import '../config/components/intronscreenwidgets.dart';

class IntroScreensProviders with ChangeNotifier{

var index = 0;
var opacity = 0.0;

List<Widget>screen = [
  Intronscreenwidgets(
    title: 'Your daily dose of headlines starts here.',
    image: 'new.png', title2: 'Breaking stories, delivered fast', title3: 'Stay updated. Stay informed',),
  Intronscreenwidgets(
    title: 'Forecast your day with confidence',
    image: 'wea.png', title2: 'Your personal weather guide', title3: 'Real-time weather',),
  Intronscreenwidgets(
    title: 'Cinematic worlds at your command',
    image: 'mov.png', title2: 'Entertainment made effortless', title3: 'Blockbusters to indie gems',),
];

change_screen(BuildContext context){
  if(index >= 0 && index < screen.length -1 ){
    index ++;
  }else {
    // Prevent navigating again if already navigating
    if (ModalRoute.of(context)?.isCurrent ?? false) {
      Navigator.pushReplacementNamed(context, RouteNames.signupscreen);
    }
    return; // Important to stop here
  }

  opacity = (index >= 1) ? 1.0 : 0.0;
  notifyListeners();
}

returenscreen(){
  if(index >= 1 && index<screen.length){
    index--;
  }
  if(index >= 1 ){
    opacity = 1.0;
  }else{
    opacity = 0.0;
  }
  notifyListeners();
}

}
