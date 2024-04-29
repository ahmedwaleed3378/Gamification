import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyExamDialog extends StatefulWidget {
  const EmptyExamDialog({Key? key, this.text}) : super(key: key);
  final String? text;
  @override
  State<EmptyExamDialog> createState() => _EmptyExamDialogState();
}

class _EmptyExamDialogState extends State<EmptyExamDialog> {
  @override
  Widget build(BuildContext context) {
    return  Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p4.w,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: AppSize.s5.h),
              SvgPicture.asset(ImageAssets.robot),
              SizedBox(height: AppSize.s5.h),
              Text(
                 widget.text??   LocaleKeys.noExamData.tr(),
                style: getMediumDINNextStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s20.sp,
                ),
              ),
              SizedBox(height: AppSize.s5.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p6.h,
                ),
                child: CustomButtonWidget(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.homeRoute,
                    );
                  },
                  height: AppSize.s7.h,
                  shadowColor: ColorManager.terracota,
                  borderColor: ColorManager.terracota,
                  backGroundColor: ColorManager.terracota,
                  title: LocaleKeys.returnT.tr(),
                  style: getMediumDINNextStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s26,
                  ),
                  textColor: ColorManager.dark,
                ),
              ),
              SizedBox(height: AppSize.s5.h),
            ],
          ),
        ),
      ),
    );

  }
}
