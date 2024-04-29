import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/model/scoreboard/top_ranking_winner.dart';

class CustomMedalRankingScore extends StatelessWidget {
  const CustomMedalRankingScore({Key? key, required this.topRankingWinner})
      : super(key: key);
  final TopRankingWinner topRankingWinner;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          ImageAssets.allStagesMedalRanking,
          width: double.infinity,
          height: AppSize.s21.h,
          fit: BoxFit.fill, // Added this line
        ),

        /// second rank
        if (topRankingWinner.secondWinnerName != null &&
            topRankingWinner.secondWinnerPt != null)
          Positioned(
              left: AppSize.s6.w,
              top: -AppSize.s14.h,
              child: contentWinnerStage(
                  topRankingWinner.secondWinnerImage!,
                  topRankingWinner.secondWinnerName!,
                  topRankingWinner.secondWinnerPt!,
                  ImageAssets.medalIconSliver)),

        /// first rank
        Positioned(
            top: -AppSize.s17.h,
            child: contentWinnerStage(
                topRankingWinner.firstWinnerImage,
                topRankingWinner.firstWinnerName,
                topRankingWinner.fistWinnerPt,
                ImageAssets.medalIconGold)),

        /// third rank
        if (topRankingWinner.thirdWinnerName != null &&
            topRankingWinner.thirdWinnerPt != null)
          Positioned(
              right: AppSize.s6.w,
              top: -AppSize.s12.h,
              child: contentWinnerStage(
                  topRankingWinner.thirdWinnerImage!,
                  topRankingWinner.thirdWinnerName!,
                  topRankingWinner.thirdWinnerPt!,
                  ImageAssets.medalIconBronze)),
      ],
    );
  }

  contentWinnerStage(String image, String name, double pt, String medalImage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s360),
                child: Image.asset(
                  image,
                  width: AppSize.s7.h,
                  height: AppSize.s7.h,
                )),
            SvgPicture.asset(
              medalImage,
              width: AppSize.s3.h,
              height: AppSize.s3.h,
            )
          ],
        ),
        SizedBox(
          height: AppSize.s1.h,
        ),
        SizedBox(
          width: AppSize.s20.w,
          child: Text(
            name,
            style: getRegularDINNextStyle(
                color: ColorManager.white, fontSize: AppSize.s18.sp),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: AppSize.s1.h,
        ),
        Container(
          width: AppSize.s20.w,
          height: AppSize.s4.h,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              vertical: AppSize.s008.h, horizontal: AppSize.s1.w),
          decoration: BoxDecoration(
            color: ColorManager.maize,
            borderRadius: BorderRadius.circular(AppSize.s15),
            border:
                Border.all(color: ColorManager.terracota, width: AppSize.s1),
            boxShadow: [
              BoxShadow(
                color: ColorManager.maize.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 9,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Text(
            '$pt ${LocaleKeys.pt.tr()}',
            style: getMediumDINNextStyle(
                color: ColorManager.black, fontSize: AppSize.s15.sp),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
