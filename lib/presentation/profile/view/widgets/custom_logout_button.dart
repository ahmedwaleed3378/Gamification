
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomLogoutButton extends StatelessWidget {

  final Function onPressed;
  const CustomLogoutButton({Key? key ,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:  EdgeInsets.symmetric(
          horizontal: AppMargin.m4.w)
          .copyWith(bottom: AppMargin.m2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding:  EdgeInsets.all(AppPadding.p07.h),
              decoration: BoxDecoration(
                  color: ColorManager.orange.withOpacity(AppSize.s02),
                  borderRadius:
                  BorderRadius.circular(AppSize.s2.h)),
              child: IconButton(
                color: ColorManager.orange,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon:  Icon(
                  MdiIcons.logout,
                  size: AppSize.s3.h,
                ),
                onPressed: () => onPressed(),
              )),
           SizedBox(width: AppSize.s2.w),
          Text(
            LocaleKeys.logout.tr(),
            style: getMediumInterStyle(
                color: ColorManager.midBlack,
                fontSize: AppSize.s16.sp),
          )
        ],
      ),
    );
  }
}
