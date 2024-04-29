import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../../widget/custom_button.dart';

class EndedSubsCriptionDialogue extends StatelessWidget {
  const EndedSubsCriptionDialogue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p1.w,
          vertical: AppPadding.p1_5.h,
        ),
        height: AppSize.s40.h,
        width: AppSize.s85.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
          color: ColorManager.newWidget,
          border: Border.all(
            color: ColorManager.white,
            width: AppSize.s2,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManager.white.withOpacity(0.5),
              spreadRadius: AppSize.s1,
              blurRadius: AppSize.s2,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                LocaleKeys.subscribeToContinue.tr(),
                style: getMediumDINNextStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s22.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s2.h,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: LocaleKeys.youHaveUsed.tr(),
                      style: getMediumDINNextStyle(
                        color: ColorManager.red,
                        fontSize: FontSize.s18.sp,
                      ),
                    ),
                    TextSpan(
                      text: '5',
                      style: getMediumDINNextStyle(
                        color: ColorManager.primaryColor,
                        fontSize: FontSize.s20.sp,
                      ),
                    ),
                    TextSpan(
                      text: LocaleKeys.freeExamsSubscribe.tr(),
                      style: getMediumDINNextStyle(
                        color: ColorManager.red,
                        fontSize: FontSize.s18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSize.s3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: AppSize.s8.h,
                    width: AppSize.s35.w,
                    child: CustomButtonWidget(
                      backGroundColor: ColorManager.newWidget,
                      borderColor: ColorManager.secondaryText,
                      title: LocaleKeys.returnButton.tr(),
                      shadowColor: ColorManager.transparent,
                      textColor: ColorManager.white,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s8.h,
                    width: AppSize.s35.w,
                    child: CustomButtonWidget(
                      backGroundColor: ColorManager.primaryColor,
                      borderColor: ColorManager.transparent,
                      title: LocaleKeys.subscription.tr(),
                      shadowColor: ColorManager.transparent,
                      textColor: ColorManager.white,
                      onTap: () {
                        Navigator.popAndPushNamed(
                            context, Routes.paymentRoute);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}