

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Internetexceptions extends StatelessWidget {
  const Internetexceptions({super.key,required this.callback});
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_off,size: 40,color: Colors.red,),
            SizedBox(height: 20,),
            Text("No Internet Exception"),
            SizedBox(height: 20,),
            SizedBox(height: 50,width: 220,
            child: ElevatedButton(onPressed: callback, child: Text("Retry")),)
          ],
        ),
      ),
    );
  }
}
