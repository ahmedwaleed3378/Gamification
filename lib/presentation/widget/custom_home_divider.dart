import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class CustomHomeDivider extends StatelessWidget {
  const CustomHomeDivider({
    super.key,
    required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: AppMargin.m2
      .w
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: AppSize.s20
            //.h
            ,
            spreadRadius: AppSize.s05
            .h
            ,
            color: ColorManager.orange)
      ]),
      child: Divider(
          thickness: AppSize.s01
          .h
          ,
          height: AppSize.s1
          //.h
          ,
          color: ColorManager.orange),
    );
  }
}

