import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class CustomSubjectProgressWidget extends StatelessWidget {
  const CustomSubjectProgressWidget({
    required this.image,
    required this.subjectName,
    required this.progressPercentage,
    required this.unitsNum,
    required this.quizesNum,
    super.key,
  });

  final String image;
  final String subjectName;
  final int progressPercentage;
  final int unitsNum;
  final int quizesNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppPadding.p1.h),
      padding: EdgeInsets.only(
        top: AppPadding.p3.h,
        bottom: AppPadding.p2.h,
        left: AppPadding.p4.w,
        right: AppPadding.p2.w,
      ),
      width: AppSize.s87.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s15),
        border: Border.all(color: ColorManager.secondaryText),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: AppSize.s1_5.w,),
          CachedNetworkImage(
            imageUrl: image,

            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) =>
                SvgPicture.asset(ImageAssets.noSubjectImage),
            height: AppSize.s7.h,
            width: AppSize.s7.h,
          ),
          SizedBox(
            width: AppSize.s8.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: AppSize.s40.w,
                    child: Text(
                      subjectName,
                      style: getMediumDINNextStyle(
                        color: ColorManager.blue,
                        fontSize: subjectName.length > 10
                            ? AppSize.s18.sp
                            : AppSize.s20.sp,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    width: AppSize.s7.w,
                  ),
                  Text(
                    progressPercentage > 100 ? '100%' : '$progressPercentage%',
                    style: getMediumDINNextStyle(
                      color: ColorManager.green,
                      fontSize: AppSize.s18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.s1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppSize.s1_5.w,
                  ),
                  Text(
                    '$unitsNum ${LocaleKeys.units}'.tr(),
                    style: getMediumDINNextStyle(
                      color: ColorManager.primaryColor,
                      fontSize: AppSize.s17.sp,
                    ),
                  ),
                  SizedBox(
                    width: AppSize.s9.w,
                  ),
                  Text(
                    '$quizesNum ${LocaleKeys.quiz}'.tr(),
                    style: getMediumDINNextStyle(
                      color: ColorManager.yellow,
                      fontSize: AppSize.s17.sp,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: AppMargin.m017.h),
                child: LinearPercentIndicator(
                  width: AppSize.s40.w,
                  lineHeight: AppSize.s05.h,
                  percent: progressPercentage > 100
                      ? 100 / 100
                      : progressPercentage / 100,
                  barRadius: const Radius.circular(AppSize.s25),
                  progressColor: progressPercentage == 0
                      ? ColorManager.newWidget
                      : ColorManager.white,
                  linearGradientBackgroundColor: LinearGradient(
                    colors: [
                      progressPercentage == 0
                          ? ColorManager.newWidget
                          : ColorManager.secondaryText,
                      ColorManager.newWidget,
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
