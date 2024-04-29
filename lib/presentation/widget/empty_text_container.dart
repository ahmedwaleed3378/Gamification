import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyTextContainer extends StatelessWidget {
  const EmptyTextContainer(
      {Key? key, required this.text, this.backgroundColor, this.textColor})
      : super(key: key);
  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s25.w, 
      margin: EdgeInsets.symmetric(
          horizontal: AppSize.s1.w, vertical: AppSize.s1.h),
      padding: EdgeInsets.symmetric(
          vertical: AppSize.s1_5.h, horizontal: AppSize.s1.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorManager.secondaryText,
        borderRadius: BorderRadius.circular(AppSize.s15),
        boxShadow: [
          BoxShadow(
            color: ColorManager.secondaryText.withOpacity(.3),
          ),
          BoxShadow(
              color: ColorManager.dark,
              spreadRadius: -2.0,
              blurRadius: 4.0,
              offset: const Offset(0, 1)),
        ],
      ),
      child: Center(
        child: Text(
          text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: getRegularDINNextStyle(
              color: textColor ?? ColorManager.dark, fontSize: AppSize.s17.sp),
        ),
      ),
    );
  }
}
