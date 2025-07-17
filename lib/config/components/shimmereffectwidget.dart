


import 'package:clean_architecture_weather_new_app/config/domain/constants/appcolors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Shimmereffectwidget extends StatelessWidget {
  const Shimmereffectwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
        child: Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.textfielddarkmode
                : AppColors.textfieldlightmode,
            borderRadius: BorderRadius.circular(18)
          ),
        ),
    );
  }
}
