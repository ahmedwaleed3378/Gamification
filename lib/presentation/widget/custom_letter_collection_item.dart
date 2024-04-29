import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomLetterCollectionItem extends StatelessWidget {
  const CustomLetterCollectionItem(
      {Key? key, required this.text, required this.color})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s5.h,
      height: AppSize.s5.h,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
          horizontal: AppSize.s1.w, vertical: AppSize.s05.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      child: Text(
        text,
        style: getRegularDINNextStyle(
            color: ColorManager.white, fontSize: AppSize.s17.sp),
      ),
    );
  }
}
