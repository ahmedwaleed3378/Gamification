import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAnswerWidget extends StatelessWidget {
  const CustomAnswerWidget({Key? key, required this.text, required this.color}) : super(key: key);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSize.s1.w , vertical: AppSize.s03.h),
      padding: EdgeInsets.symmetric(
          vertical: AppSize.s05.h,
          horizontal: AppSize.s1.w
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: Text(
        text,
        style: getRegularDINNextStyle(color: ColorManager
            .white, fontSize: AppSize.s15.sp),
      ),
    );
  }
}
