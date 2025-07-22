

import 'package:clean_architecture_weather_new_app/config/domain/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Textfieldwidget extends StatelessWidget {

  final String hinttext;
  final TextEditingController?controller;
  final TextInputType?textInputType;
  final double?widht;
  final double?height;
  final Function(String)?func;
  final Icon?preffixicon;
  final IconButton?suffixicon;
  final bool obstacttext;
  final String? Function(String?)? validator;
  final String?initialvalue;

  Textfieldwidget({
    super.key,
    required this.hinttext,
     this.controller,
    required this.textInputType,
    this.height = 50,
    this.widht = 320,
    this.suffixicon,
    this.preffixicon,
    this.func,
    this.obstacttext  = false,
    this.validator,
    this.initialvalue
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widht,
      height: height,
      child: Card(
        elevation: 10,
        color: Theme.of(context).brightness == Brightness.dark
        ? AppColors.textfielddarkmode
        : AppColors.textfieldlightmode,
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          initialValue:initialvalue ,
          onChanged: func,
          validator:validator ,
          obscureText: obstacttext,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinttext,
            hintStyle: TextStyle(
              fontFamily: "semibold",
              fontSize: 16,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.hintdarkmode
                  : AppColors.hintlightmode,
            ),
            prefixIcon: preffixicon,
            suffixIcon: suffixicon
          ),

        ),
      ),
    );
  }
}
