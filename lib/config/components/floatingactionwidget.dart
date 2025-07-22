
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Floatingactionwidget extends StatelessWidget {
  const Floatingactionwidget({super.key,required this.callback,required this.child,this.color =Colors.lightBlueAccent});

  final VoidCallback callback;
  final Widget child;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: color,
      onPressed:callback,
      child: child,
    );
  }
}
