import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExamTitle extends StatelessWidget {
  final String examTitle;

  const ExamTitle({Key? key, required this.examTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.orange,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s45),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppPadding.p2.h,
            ),
            child: Text(
              examTitle,
              textAlign: TextAlign.center,
              style: getBoldOxygenStyle(
                color: ColorManager.white,
                fontSize: AppSize.s18.sp,
              ),
            ),
          ),
          SizedBox(height: AppSize.s14.h),
        ],
      ),
    );
  }
}
