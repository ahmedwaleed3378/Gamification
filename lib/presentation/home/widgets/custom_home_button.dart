import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class HomeCustomChallengeButton extends StatelessWidget {
  const HomeCustomChallengeButton({
    super.key,
    required this.score,
    required this.scoreOfTen,
    required this.image,
    required this.challengeName,
    required this.examsNumber,
  });

  final int score;
  final int scoreOfTen;
  final int examsNumber;
  final String image;
  final String challengeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.s7.h,
      padding:
          EdgeInsets.symmetric(horizontal: AppPadding.p3.w).copyWith(bottom: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s20),
        gradient: LinearGradient(
            colors: [ColorManager.orangeLight, ColorManager.terracota],
            end: Alignment.centerRight,
            begin: Alignment.centerLeft),
        boxShadow: [
          BoxShadow(
            color: ColorManager.orange11.withOpacity(0.5),
            offset: const Offset(0, 4.5),
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: AppSize.s1.w,
          ),
          SizedBox(
            width: AppSize.s10.w,
            height: AppSize.s10.w,
            child: SvgPicture.asset(image),
          ),
          SizedBox(
            width: AppSize.s4.w,
          ),
          Text(
            '$challengeName : ',
            style: getBoldOxygenStyle(
                color: ColorManager.dark, fontSize: AppSize.s18.sp),
          ),
          SizedBox(
            width: AppSize.s2.w,
          ),
          Expanded(
            child: Text(
              '$examsNumber ${LocaleKeys.newExams.tr()}',
              style: getRegularPoppinsStyle(
                  color: ColorManager.black, fontSize: AppSize.s17.sp),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // const SizedBox(
          //   width: AppSize.s5,
          // ),
          // Text(
          //   '$scoreOfTen/10',
          //   style: getSemiBoldInterStyle(
          //       color: ColorManager.white, fontSize: AppSize.s16.sp
          //    ),
          // )
        ],
      ),
    );
  }
}
