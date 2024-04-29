import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'custom_button.dart';

class CustomHomeDialoge extends StatelessWidget {
  const CustomHomeDialoge({
    super.key,
    required this.currentIndex,
    required this.counter,
    required this.totalStreak,
  });

  final int counter;
  final int totalStreak;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: AppSize.s3.h,
            ),
            padding: EdgeInsets.only(
             // top: AppSize.s2.h,
              left: AppSize.s5.w,
              right: AppSize.s5.w,
            ),
            width: AppSize.s90.w,
            height: AppSize.s42.h,
            decoration: BoxDecoration(
                color: ColorManager.newWidget,
                borderRadius: BorderRadius.circular(AppSize.s20),),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //streak shape
                  DailyStreakWidget(counter: counter),
                  // SizedBox(
                  //   height: AppSize.s2.h,
                  // ),
                  // days gridview
                  Text(
                    '${LocaleKeys.day.tr()} $totalStreak',
                    style: getMediumDINNextStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s21.sp,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s1.h,
                  ),
                  Text(
                    '${LocaleKeys.totalStreaks.tr()} $totalStreak',
                    style: getMediumDINNextStyle(
                      color: ColorManager.purple,
                      fontSize: FontSize.s16.sp,
                    ),
                  ),

                  //   DaysGridView(currentIndex: currentIndex),
                ],
              ),
            ),
          ),
          //claim button
          Positioned(
            bottom: AppSize.s6.h,
         right: AppSize.s24.w,
            child: SizedBox(
           width: AppSize.s40.w,
                height: AppSize.s7.h,
              child: CustomButtonWidget(
                backGroundColor: ColorManager.yellow,
                shadowColor: ColorManager.transparent,
                textColor: ColorManager.newWidget,
                title: LocaleKeys.claim.tr(),
                fontSize: AppSize.s22.sp,
                borderColor: ColorManager.transparent,
                width: AppSize.s40.w,
                height: AppSize.s7.h,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DailyStreakWidget extends StatelessWidget {
  const DailyStreakWidget({
    super.key,
    required this.counter,
  });
  final int counter;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 20.h,
            )
          ],
        ),
        Positioned(
          top: AppSize.s0,
          right: AppSize.s1minus,
          child: Text(
            '$counter +',
            style: getMediumDINNextStyle(
              color: ColorManager.green,
              fontSize: FontSize.s20,
            ),
          ),
        ),
        Container(
          width: AppSize.s40.w,
          height: AppSize.s35.w,
          padding: EdgeInsets.only(
            top: AppSize.s3.h,
            bottom: AppSize.s3.h,
            left: AppSize.s3.w,
            right: AppSize.s3.w,
          ),
          margin: EdgeInsets.only(
            top: AppSize.s1.h,
            left: AppSize.s1.w,
            right: AppSize.s1.w,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                blurRadius: 5,
                spreadRadius: 1.3,
                color: ColorManager.green,
              )
            ],
            border: Border.all(
              color: ColorManager.green,
              width: AppSize.s2_5,
            ),
          ),
          child: SvgPicture.asset(
            ImageAssets.newStreak,
            width: AppSize.s8,
            height: AppSize.s8,
          ),
        ),
        Positioned(
          left: AppSize.s17,
          top: AppSize.s118,
          child: Container(
              decoration: BoxDecoration(
                color: ColorManager.newWidget,
                borderRadius: BorderRadius.circular(10),
              ),
              width: AppSize.s37.w,
              height: AppSize.s9.h,
              child: Text(
                LocaleKeys.dailyStreak.tr(),
                textAlign: TextAlign.center,
                style: getMediumDINNextStyle(
                  color: ColorManager.green,
                  fontSize: FontSize.s20,
                ),
              )),
        ),
      ],
    );
  }
}

class DaysGridView extends StatelessWidget {
  const DaysGridView({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s37.h,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 9,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return DaysGridViewItem(
            currentIndex: currentIndex,
            gridViewIndex: index,
          );
        },
      ),
    );
  }
}

class DaysGridViewItem extends StatelessWidget {
  const DaysGridViewItem({
    super.key,
    required this.currentIndex,
    required this.gridViewIndex,
  });

  final int currentIndex;
  final int gridViewIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${LocaleKeys.day} ${1 + gridViewIndex}'.tr(),
          style: getMediumDINNextStyle(
            color: ColorManager.white.withOpacity(
              0.7,
            ),
          ),
        ),
        SizedBox(
          height: AppSize.s1.h,
        ),
        Container(
          width: AppSize.s15.w,
          height: AppSize.s17.w,
          decoration: BoxDecoration(
            color: ColorManager.backGroundColor,
            border: Border.all(
              color: (gridViewIndex + 1) == currentIndex
                  ? ColorManager.blue
                  : ColorManager.steel50,
              width: AppSize.s2,
            ),
            borderRadius: BorderRadius.circular(
              AppSize.s20,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSize.s05.h,
              ),
              SvgPicture.asset(
                ImageAssets.flashPirple,
                width: AppSize.s8.w,
                height: AppSize.s8.w,
              ),
              SizedBox(
                height: AppSize.s03.h,
              ),
              Text(
                LocaleKeys.plusOne.tr(),
                style: getMediumDINNextStyle(color: ColorManager.liliac),
              ),
            ],
          ),
        )
      ],
    );
  }
}
