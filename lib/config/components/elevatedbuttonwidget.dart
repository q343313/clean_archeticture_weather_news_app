
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Elevatedbuttonwidget extends StatelessWidget {
  const Elevatedbuttonwidget({super.key,required this.child,this.height = 50 ,this.width = 270,required this.callback});

  final Widget child;
  final double width;
  final double height;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
        height: height,
        child: ElevatedButton(onPressed:callback,
        child: child));
  }
}
