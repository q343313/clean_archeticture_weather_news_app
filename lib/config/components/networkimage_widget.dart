
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NetworkimageWidget extends StatelessWidget {
  const NetworkimageWidget({super.key,required this.url,this.height = 250});

  final String url;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Image.network(
            url,
          fit: BoxFit.cover,
          errorBuilder: (context,error,stakerrro){
                return Image.network(
                "https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg",
                fit: BoxFit.cover,
              );
          },
        ),

      ),
    );
  }
}
