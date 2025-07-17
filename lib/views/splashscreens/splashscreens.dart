


import 'package:clean_architecture_weather_new_app/config/services/splashservices/splashservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }

}

class _SplashScreen extends State<SplashScreen>with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation _animation;
 final SplashServices _splashServices = SplashServices();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 6));
    _animation = Tween(begin: 0.0,end: 300.0).animate(_controller);
    _controller.addListener((){setState(() {});});
    _controller.forward();
    _splashServices.is_login(context);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/man.png"),width: _animation.value,height: _animation.value,),
            SizedBox(height: 10,),
            Text("Clean Archeticture",style: TextStyle(fontSize: 32,fontFamily: "bold"),)
          ],
        ),
      ),
    );
  }

}