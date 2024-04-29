import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({Key? key, required this.day, required this.hour, required this.minute}) : super(key: key);
  final int day;
  final int hour;
  final int minute;
  @override
  Widget build(BuildContext context) {

    String minuteStr= (minute != 0)? '$minute ${LocaleKeys.minute.tr()}' : '' ;
    String hourStr= (hour != 0)? '$hour ${LocaleKeys.hour.tr()} : ' : '' ;
    String dayStr= (day != 0)? '$day ${LocaleKeys.day.tr()} : ' : '' ;
    String fullTime = dayStr+hourStr+minuteStr;
    return Container(
      height: AppSize.s6.h,
      padding: EdgeInsets.symmetric(
        vertical: AppPadding.p1.h,
        horizontal: AppPadding.p2.w
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12),
        gradient: LinearGradient(
          colors: [
            ColorManager.periwinkle80,
            ColorManager.darkSkyBlue80,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(ImageAssets.clock , width: AppSize.s3.h,height: AppSize.s3.h,),
          SizedBox(
            width: AppSize.s2.w,
          ),
          Text(fullTime, style: getMediumDINNextStyle(color: ColorManager.white , fontSize: AppSize.s17.sp),)
        ],
      ),
    );
  }
}
