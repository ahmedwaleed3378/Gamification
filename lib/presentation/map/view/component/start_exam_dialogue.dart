import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../onboarding/view/custom_line_paint.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widget/custom_button.dart';
import '../maps_types/map_vertical_example.dart';

class StartExamWidget extends StatelessWidget {
  const StartExamWidget({
    super.key,
    required this.riveArtboard,
    required this.riveArtboard2,
    required this.widget,
    required this.examName,
    required this.experience,
    required this.time,
    required this.examId,
  });
  final int experience;
  final int time;
  final int examId;
  final String examName;
  final Artboard? riveArtboard;
  final Artboard? riveArtboard2;
  final MapVerticalExample widget;

  @override
  Widget build(BuildContext context) {
    return 
    // Stack(
    //   children: [
        // SizedBox(
        //   height: AppSize.s100.h,
        //   width: AppSize.s100.w,
        //   child: riveArtboard2 != null?
        //     //   Padding(
        //       //    padding: EdgeInsets.only(bottom: AppPadding.p6.h),
        //          // child:
        //            Rive(
        //             artboard: riveArtboard2!,
        //           )
        //       //  )
        //       : SizedBox.shrink(
        //           child: Container(color: ColorManager.dark),
        //         ),
        // ),
        Container(
          alignment: Alignment.center,
     
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // SizedBox(height: 100.h,
                  // width: 100.w,
                  // ),
                  Positioned(
                    top: AppSize.s0,
                    child: SizedBox(
                      height: AppSize.s90.h,
                      width: AppSize.s90.h,
                      child: riveArtboard != null
                          ? Rive(
                              artboard: riveArtboard!,
                            )
                          : SizedBox.shrink(
                              child: Container(color: ColorManager.dark),
                            ),
                    ),
                  ),
                  Positioned(
                    left: AppSize.s46.w,
                    top: AppSize.s33.h + AppSize.s06.h,
                    child: CustomPaint(
                      painter: CustomLinePainter(),
                      child: SizedBox(
                        height: AppSize.s7.h,
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppSize.s37.h,
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
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s20),
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
                                      color: ColorManager.offWhite
                                          .withOpacity(0.15),
                                      elevation: AppSize.s5,
                                      shadowColor: ColorManager.dark,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s20),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: AppPadding.p1.h,
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
                                              style:
                                                  getMediumMPLUSRounded1CStyle(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        StartExamInfoItem(
                                          info: experience.toString(),
                                          svgPath: ImageAssets.emojiSmile,
                                          header: LocaleKeys.xp.tr(),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        StartExamInfoItem(
                                          info: time.toString(),
                                          svgPath: ImageAssets.coin,
                                          header: LocaleKeys.min.tr(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      LocaleKeys.areYouReadyStart.tr(),
                                      style: getMediumMPLUSRounded1CStyle(
                                        color: ColorManager.white,
                                        fontSize: AppSize.s16.sp,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: AppSize.s4.h,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: AppSize.s16.h),
                            ],
                          ),
                          Positioned(
                            top: AppSize.s28.h,
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
                                        });
                                  },
                                  shadowColor: ColorManager.terracota,
                                  borderColor: ColorManager.terracota,
                                  backGroundColor: ColorManager.terracota,
                                  title: LocaleKeys.startNow.tr(),
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
        )
    //   ],
    // )
    ;
  }
}

class StartExamInfoItem extends StatelessWidget {
  const StartExamInfoItem({
    super.key,
    required this.info,
    required this.svgPath,
    required this.header,
  });
  final String info;
  final String header;
  final String svgPath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: AppSize.s2.h),
          child: Card(
            color: ColorManager.offWhite.withOpacity(0.15),
            elevation: AppSize.s5,
            shadowColor: ColorManager.dark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s20),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: AppPadding.p2.h,
                right: AppPadding.p1_5.w,
                left: AppPadding.p1_5.w,
                top: AppPadding.p3.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   ImageAssets.flashPurpleIcon,
                  // ),
                  // SizedBox(width: AppSize.s4.w),
                  Text(
                    info + header,
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
        ),
        Positioned(
          //   right: AppSize.s5.w,
          top: AppSize.s1.h,
          child: SvgPicture.asset(
            svgPath,
            width: AppSize.s10.w,
            height: AppSize.s10.w,
            // color: ColorManager.white,
          ),
        ),
      ],
    );
  }
}
