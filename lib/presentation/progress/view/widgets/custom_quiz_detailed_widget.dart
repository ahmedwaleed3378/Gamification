import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class CustomQuizDetailedWidget extends StatelessWidget {
  const CustomQuizDetailedWidget({
    super.key,
    required this.examName,
    required this.totalPoints,
    required this.averagePoints,
    required this.experience, required this.examID, required this.subjectName,
  });
  final String examName;
  final int examID;
  final String subjectName;
  final double totalPoints;
  final double averagePoints;
  final double experience;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: AppPadding.p1.h,
          bottom: AppPadding.p1.h,
          // right: AppPadding.p1.w,
          // left: AppPadding.p1.w
          ),
      decoration: BoxDecoration(
        color: ColorManager.black02,
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      margin: EdgeInsets.only(
        top: AppMargin.m05.h,
        bottom: AppMargin.m1.h,
        // right: AppMargin.m1.w,
        // left: AppMargin.m1.w
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            ImageAssets.mathSubject,
            width: AppSize.s4.w,
            height: AppSize.s5.w,
          ),
          SizedBox(
            width: AppSize.s3.w,
          ),
          SizedBox(
            width: AppSize.s27.w,
            child: Text(
              examName,
              style: getRegularDINNextStyle(
                color: ColorManager.yellow,
                fontSize: AppSize.s17.sp,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: AppSize.s3.w,
          ),
          Text(
            averagePoints.toStringAsFixed(1),
            style: getRegularDINNextStyle(
              color: ColorManager.white,
              fontSize: AppSize.s15.sp,
            ),
          ),
          SizedBox(
            width: AppSize.s3.w,
          ),
          SvgPicture.asset(
            ImageAssets.gemBlue,
            width: AppSize.s4.w,
            height: AppSize.s5.w,
            fit: BoxFit.fitHeight,
          ),
          Text(
            totalPoints.toStringAsFixed(1),
            style: getRegularDINNextStyle(
              color: ColorManager.white,
              fontSize: AppSize.s15.sp,
            ),
          ),
          SizedBox(
            width: AppSize.s3.w,
          ),
          SvgPicture.asset(
            ImageAssets.smileIcon,
            width: AppSize.s4.w,
            height: AppSize.s5.w,
            fit: BoxFit.fitHeight,
          ),
          Text(
            experience.toStringAsFixed(1),
            style: getRegularDINNextStyle(
              color: ColorManager.white,
              fontSize: AppSize.s15.sp,
            ),
          ),
          SizedBox(
            width: AppSize.s4.w,
          ),
          InkWell(
            onTap: () {
                Navigator.of(context).pushNamed(
                                        Routes.examRoute,
                                        arguments: {
                                          'examId': examID,
                                          'subjectName': subjectName,
                                        });
            },
            child: Text(
              LocaleKeys.review.tr(),
              style: getRegularDINNextStyle(
                color: ColorManager.purple,
                fontSize: AppSize.s14.sp,
              ).copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
