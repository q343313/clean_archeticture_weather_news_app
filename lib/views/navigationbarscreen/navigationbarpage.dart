

import 'package:clean_architecture_weather_new_app/config/domain/constants/appcolors.dart';
import 'package:clean_architecture_weather_new_app/views/navigationbarscreen/userdata/userprofilesscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../views.dart';
import 'moviespage/moviespage.dart';

class Homescreens extends StatefulWidget {
  const Homescreens({super.key});

  @override
  State<Homescreens> createState() => _HomescreensState();
}

class _HomescreensState extends State<Homescreens> {

  var index = 0;

  List<Widget>screen = [
    Newspages(),
    Weatherdata(),
    MoviesPage(),
    Profilepage(),
    Userprofilesscreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: screen,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.newspaper), label: "newsapp",selectedIcon: Icon(Icons.navigation),),
          NavigationDestination(icon: Icon(Icons.cloud_circle_rounded), label: "weatherapp",selectedIcon: Icon(Icons.cloud),),
          NavigationDestination(icon: Icon(Icons.movie_creation_outlined), label: "Movies",selectedIcon: Icon(Icons.movie),),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile",selectedIcon: Icon(CupertinoIcons.person_alt),),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile",selectedIcon: Icon(CupertinoIcons.person_alt),)
        ],
        height: 60,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
        ? AppColors.textfielddarkmode
        : AppColors.scaffoldlightmode,
        indicatorColor: Colors.lightBlueAccent.shade100,
        elevation: 0,
        shadowColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.scaffoldlightmode
            : AppColors.scaffolddarkmode,
        selectedIndex: index,
        onDestinationSelected: (value){
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
