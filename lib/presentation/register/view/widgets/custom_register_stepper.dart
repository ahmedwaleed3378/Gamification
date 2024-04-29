import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class RegisterStepper extends StatelessWidget {
  const RegisterStepper({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: AppSize.s80.w,
      height: AppSize.s1_2.h,
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: AppMargin.m1.w),
            width: AppSize.s15.w,
            height: AppSize.s4.h,
            decoration: BoxDecoration(
              color: index < score
                  ? ColorManager.terracota
                  : ColorManager.terracota.withOpacity(0.5),
              borderRadius: BorderRadius.circular(AppSize.s14),
              boxShadow: [
                index == score - 1
                    ? BoxShadow(
                        color: ColorManager.terracota.withOpacity(0.5),
                        // spreadRadius: 7,
                        blurRadius: 12,
                      )
                    : index < score
                        ? BoxShadow(
                            color: ColorManager.terracota,
                            // blurRadius: 48,
                            // spreadRadius: 0.7,
                            // blurStyle: BlurStyle.outer,
                          )
                        : const BoxShadow(),
              ],
            ),
          );
        },
      ),
    );
  }
}
