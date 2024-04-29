import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_dialog_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

customRobotDialog(BuildContext context, String title, VoidCallback onTap,
    Artboard? artboard) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p4.w, vertical: AppSize.s4.h),
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
                children: [
                  artboard != null
                      ? Container(
                          alignment: Alignment.center,
                          height: AppSize.s15.h,
                          width: AppSize.s15.h,
                          child: Rive(artboard: artboard),
                        )
                      : const SizedBox.shrink(),
                  Text(
                    title,
                    style: getMediumMPLUSRounded1CStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s19.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p1.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDialogButton(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          width: AppSize.s30.w,
                          shadowColor: ColorManager.charcoalGrey1,
                          borderColor: ColorManager.charcoalGrey1,
                          backGroundColor: ColorManager.charcoalGrey1,
                          title: LocaleKeys.no.tr(),
                          height: AppSize.s5.h,
                          textColor: ColorManager.terracota,
                          style: getMediumDINNextStyle(
                            color: ColorManager.terracota,
                            fontSize: AppSize.s18.sp,
                          ),
                        ),
                        CustomDialogButton(
                          onTap: onTap,
                          width: AppSize.s30.w,
                          shadowColor: ColorManager.terracota,
                          borderColor: ColorManager.terracota,
                          backGroundColor: ColorManager.terracota,
                          title: LocaleKeys.yes.tr(),
                          height: AppSize.s5.h,
                          textColor: ColorManager.dark,
                          style: getMediumDINNextStyle(
                            color: ColorManager.white,
                            fontSize: AppSize.s18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
