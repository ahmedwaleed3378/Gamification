import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomContainerItem extends StatelessWidget {
  const CustomContainerItem({Key? key, required this.text, required this.isExist}) : super(key: key);
final String text;
final bool isExist;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      EdgeInsets.symmetric(
          horizontal:
          AppSize.s1.w,
          vertical:
          AppSize.s05.h),
      padding:
      EdgeInsets.symmetric(
          vertical:
          AppSize.s1.h,
          horizontal:
          AppSize.s4.w),
      decoration: BoxDecoration(
        color: isExist
            ? ColorManager.skyBlue
            : ColorManager.dark,
        borderRadius:
        BorderRadius.circular(
            AppSize.s15),
      ),
      child: Text(
        text,
        style:
        getRegularDINNextStyle(
            color: isExist
                ? ColorManager
                .white
                : ColorManager
                .dark,
            fontSize: AppSize
                .s17.sp),
      ),
    );
  }
}
