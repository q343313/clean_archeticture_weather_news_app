


import 'package:clean_architecture_weather_new_app/bloc/newsbloc/newsbloc.dart';
import 'package:clean_architecture_weather_new_app/bloc/themebloc/themecubits.dart';
import 'package:clean_architecture_weather_new_app/bloc/themebloc/themestates.dart';
import 'package:clean_architecture_weather_new_app/bloc/weatherbloc/weatherbloc.dart';
import 'package:clean_architecture_weather_new_app/config/domain/constants/appthemes.dart';
import 'package:clean_architecture_weather_new_app/config/route/route.dart';
import 'package:clean_architecture_weather_new_app/config/route/routename.dart';
import 'package:clean_architecture_weather_new_app/repository/newsrepository/newsrepository.dart';
import 'package:clean_architecture_weather_new_app/repository/weatherrepository/weatherrepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
GetIt newsinjection =  GetIt.instance;
void main()async{
  newsapiinjection();
  weatherdata();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>ThemeCubit()),
      BlocProvider(create: (_)=>WeatherBloc(getIt())),
      BlocProvider(create: (_)=>NewsBloc(newsinjection()))
    ],
        child: BlocBuilder<ThemeCubit,ThemeStates>(builder: (context,state){
          return MaterialApp(
            theme: state is LightThemeStates?AppThemes.lightthemedata:AppThemes.darkthemedata,
            title: "Clean Code App",
            initialRoute: RouteNames.splashscreen,
            onGenerateRoute: Routes.generatoroute,
          );
        }));
  }

}

void weatherdata(){
  getIt.registerLazySingleton<WeatherRepository>(()=>WeatherRepository());
}

void newsapiinjection(){
  newsinjection.registerLazySingleton<NewsRepository>(()=>NewsRepository());
}