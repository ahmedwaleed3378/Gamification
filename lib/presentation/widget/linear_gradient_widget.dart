import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';

linearGradientWidget(
    {Alignment begin = Alignment.topCenter,
    Alignment end = Alignment.bottomCenter}) {
  return LinearGradient(
      begin: begin,
      end: end,
      tileMode: TileMode.clamp,
      colors: [
        ColorManager.whiteTwo,
        ColorManager.babyBlue,
      ],
      stops: const [
        AppSize.s075,
        AppSize.s1,
      ]);
}
