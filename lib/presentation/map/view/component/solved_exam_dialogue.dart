import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widget/custom_button.dart';
import '../maps_types/map_vertical_example.dart';

class SolvedExamDialogue extends StatelessWidget {
  const SolvedExamDialogue({
    super.key,
    required this.widget,
    required this.examName,
    required this.experience,
    required this.totalMark,
    required this.userResult,
    required this.examId,
    required this.grade,
    required this.totalPoints,
    required this.examMark,
    required this.examExperience,
  });
  final int experience;
  final int totalMark;
  final int userResult;
  final int grade;
  final int examId;
  final int totalPoints;
  final int examMark;
  final int examExperience;
  final String examName;

  final MapVerticalExample widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: AppSize.s95.w,
      height: AppSize.s85.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: AppSize.s20.h,
                child: Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s20),
                  ),
                  backgroundColor: Colors.transparent,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
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
                                SizedBox(height: AppSize.s2.h),
                                Card(
                                  color:
                                      ColorManager.offWhite.withOpacity(0.15),
                                  elevation: AppSize.s5,
                                  shadowColor: ColorManager.dark,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s20),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: AppSize.s1_2.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // SvgPicture.asset(
                                        //   ImageAssets.flashPurpleIcon,
                                        // ),
                                        // SizedBox(width: AppSize.s4.w),
                                        Text(
                                          examName,
                                          style: getMediumMPLUSRounded1CStyle(
                                            color: ColorManager.lightBlue,
                                            fontSize: AppSize.s18.sp,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSize.s2.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SolvedExamInfoItem(
                                          experience: totalPoints,
                                          image: ImageAssets.gemBlue,
                                        ),
                                        SolvedExamInfoItem(
                                          experience: experience,
                                          image: ImageAssets.emojiSmile,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   width: 3.w,
                                    // ),
                                    SolvedExamMark(
                                        totalMark: totalMark,
                                        examMark: examMark),
                                  ],
                                ),
                                SizedBox(
                                  height: AppSize.s05.h,
                                ),
                                Text(
                                  totalMark / examMark >= 0.5
                                      ? LocaleKeys.youAlreadyPassedExam.tr()
                                      : LocaleKeys.youDidntPassedExam.tr(),
                                  style: getMediumMPLUSRounded1CStyle(
                                    color: totalMark / examMark >= 0.5
                                        ? ColorManager.greenIshTeal
                                        : ColorManager.red,
                                    fontSize: AppSize.s17.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: AppSize.s5.h),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSize.s16.h),
                        ],
                      ),
                      Positioned(
                        top: AppSize.s33.h + AppSize.s05.h,
                        right: AppPadding.p10.w,
                        left: AppPadding.p10.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomButtonWidget(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  Routes.examRoute,
                                  arguments: {
                                    'examId': examId,
                                    'subjectName': widget.subjectName,
                                  },
                                );
                              },
                              shadowColor: ColorManager.yellow,
                              borderColor: ColorManager.yellowTan,
                              backGroundColor: ColorManager.yellow,
                              title: LocaleKeys.review.tr(),
                              height: AppSize.s7.h,
                              textColor: ColorManager.dark,
                              style: getMediumDINNextStyle(
                                color: ColorManager.white,
                                fontSize: AppSize.s21.sp,
                              ),
                            ),
                            SizedBox(height: AppSize.s2.h),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p7.w,
                              ),
                              child: CustomButtonWidget(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                shadowColor: ColorManager.charcoalGrey1,
                                borderColor: ColorManager.charcoalGrey1,
                                backGroundColor: ColorManager.charcoalGrey1,
                                title: LocaleKeys.cancel.tr(),
                                height: AppSize.s7.h,
                                textColor: ColorManager.white,
                                style: getMediumDINNextStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s21.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: AppSize.s3.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.s90.h,
                width: AppSize.s90.w,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SolvedExamMark extends StatelessWidget {
  const SolvedExamMark({
    super.key,
    required this.totalMark,
    required this.examMark,
  });

  final int totalMark;
  final int examMark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p4.w,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p7.w,
        ),
        margin: EdgeInsets.only(top: AppMargin.m1.w),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ColorManager.newWidget,
          border: Border.all(
            width: AppSize.s2.w,
            color: ColorManager.orangeyRed,
          ),
          borderRadius: BorderRadius.circular(AppSize.s50),
        ),
        child: Column(
          children: [
            SizedBox(height: AppSize.s07.h),
            Text(
              LocaleKeys.grade.tr(),
              style: getBoldOxygenStyle(
                color: ColorManager.greenIshTeal,
                fontSize: AppSize.s18.sp,
              ),
            ),
            SizedBox(height: AppSize.s1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  totalMark.toInt().toString(),
                  style: getBoldOxygenStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s23.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  ' / ${examMark.toString()} ',
                  style: getBoldOxygenStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s17.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: AppSize.s07.h),
          ],
        ),
      ),
    );
  }
}

class SolvedExamInfoItem extends StatelessWidget {
  const SolvedExamInfoItem({
    super.key,
    required this.experience,
    required this.image,
  });

  final int experience;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSize.s1.h),
      child: Card(
        color: ColorManager.offWhite.withOpacity(0.15),
        elevation: AppSize.s5,
        shadowColor: ColorManager.dark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: AppPadding.p1.h,
            right: AppPadding.p2_5.w,
            left: AppPadding.p2_5.w,
            top: AppPadding.p1.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                width: 8.w,
                height: 8.w,
              ),
              SizedBox(width: AppSize.s1.w),
              Text(
                '$experience + ',
                style: getMediumMPLUSRounded1CStyle(
                  color: ColorManager.lightBlue,
                  fontSize: AppSize.s18.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
