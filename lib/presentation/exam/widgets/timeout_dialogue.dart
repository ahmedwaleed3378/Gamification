import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widget/custom_button.dart';
import '../viewmodel/exam_viewmodel.dart';

class ExamTimeOutDialogue extends StatelessWidget {
  const ExamTimeOutDialogue({
    super.key,
    required this.examViewModel,
  });

  final ExamViewModel examViewModel;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
         examViewModel.submitExam();
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
        return false;
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        backgroundColor: Colors.transparent,
        child: Container(
          width: AppSize.s90.w,
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p05.w,
            // vertical: AppPadding.p2.h,
          ),
          margin: EdgeInsets.only(top: AppMargin.m1.w),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: ColorManager.dark,
            border: Border.all(
              width: AppSize.s2,
              color: ColorManager.white,
            ),
            borderRadius: BorderRadius.circular(AppSize.s20),
            boxShadow: [
              BoxShadow(
                color: ColorManager.white,
                blurRadius: AppSize.s10,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppSize.s6.h),
              Text(
                LocaleKeys.timeOut.tr(),
                style: getMediumMPLUSRounded1CStyle(
                  color: ColorManager.red,
                  fontSize: AppSize.s18.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.s3.h),
              Text(
                LocaleKeys.beFaster.tr(),
                style: getMediumMPLUSRounded1CStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s16.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.s7.h),
              CustomButtonWidget(
                onTap: () {
                  // TODO :  add pop
                  examViewModel.submitExam();
                },
                shadowColor: ColorManager.terracota,
                borderColor: ColorManager.terracota,
                backGroundColor: ColorManager.terracota,
                title: LocaleKeys.returnToMap.tr(),
                height: AppSize.s7.h,
                width: AppSize.s70.w,
                textColor: ColorManager.dark,
                style: getMediumDINNextStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s21.sp,
                ),
              ),
              SizedBox(height: AppSize.s7.h),
            ],
          ),
        ),
      ),
    );
  }
}
