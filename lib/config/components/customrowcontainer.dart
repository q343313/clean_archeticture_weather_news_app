
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Customrowcontainer extends StatelessWidget {
  const Customrowcontainer({super.key,required this.index});

  final index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedContainer(
            duration: Duration(microseconds: 300),
            child: Container(
              width: index == 0?40:index == 1?20:20,
              decoration: BoxDecoration(
                color:index == 0?Colors.lightBlueAccent:index == 1?Colors.white60:Colors.white60,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(microseconds: 300),
            child: Container(
              height: 8,
              width: index == 0?20:index == 1?40:20,

              decoration: BoxDecoration(
                color: index == 0?Colors.white60:index == 1?Colors.lightBlueAccent:Colors.white60,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(microseconds: 300),
            child: Container(
              height: 8,
              width: index == 0?20:index == 1?20:40,
              decoration: BoxDecoration(
                color:index == 0?Colors.white60:index == 1?Colors.white60:Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          )
        ],
      ),
    );
  }
}
