


import 'package:bloc/bloc.dart';
import 'package:clean_architecture_weather_new_app/bloc/themebloc/themestates.dart';

class ThemeCubit extends Cubit<ThemeStates>{
  ThemeCubit():super(LightThemeStates());

  toggletheme(){
    if(state is LightThemeStates){
      emit(DarkThemeStates());
    }else{
      emit(LightThemeStates());
    }
  }

  lighttheme(){
    if(state is DarkThemeStates){
      emit(LightThemeStates());
    }else{
      emit(LightThemeStates());
    }
  }

  darktheme(){
    if(state is LightThemeStates){
      emit(DarkThemeStates());
    }else{
      emit(DarkThemeStates());
    }
  }

}
