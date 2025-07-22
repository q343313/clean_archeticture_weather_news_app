
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Textbuttonwidgets extends StatelessWidget {
  const Textbuttonwidgets({super.key,required this.callback,required this.title,this.color= Colors.red});
  final String title;
  final VoidCallback callback;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: callback,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20,fontFamily: "semibold",color:color),));
  }
}
