import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

class ScoreBar extends StatelessWidget {
  const ScoreBar({
    super.key,
    required this.score,
  });
  final int score;
  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      width: AppSize.s50
      .w
      ,
      height: AppSize.s06
      .h
      ,
      child: ListView.builder(
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin:  EdgeInsets.only(right: AppMargin.m05
            .w
            ),
            width: AppSize.s8
            .w
            ,
            height: AppSize.s05
            .h
            ,
            decoration: BoxDecoration(
              color: index < score
                  ? ColorManager.white
                  : ColorManager.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppSize.s14
              //.h
              ),
            ),
          );
        },
      ),
    );
  }
}
