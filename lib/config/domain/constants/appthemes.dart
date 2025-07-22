

import 'package:clean_architecture_weather_new_app/config/domain/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/foundation/platform.dart';

class AppThemes{
  static final ThemeData lightthemedata  = ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldlightmode,
    brightness: Brightness.light,
    textTheme: TextTheme(
      bodySmall: TextStyle(color: AppColors.textlightmode),
      bodyLarge: TextStyle(color: AppColors.textlightmode)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonlightmode,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
      )
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldlightmode
    )
  );
  static final ThemeData darkthemedata = ThemeData(
      scaffoldBackgroundColor: AppColors.scaffolddarkmode,
      brightness: Brightness.dark,
      textTheme: TextTheme(
          bodySmall: TextStyle(color: AppColors.textdarkmode),
          bodyLarge: TextStyle(color: AppColors.textdarkmode)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttondarkmode,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          )
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.scaffolddarkmode
      )
  );
}