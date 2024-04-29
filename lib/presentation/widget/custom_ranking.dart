import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/functions.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/constants.dart';
import '../../domain/model/scoreboard/top_ranking_winner.dart';

class CustomRankingScore extends StatelessWidget {
  const CustomRankingScore(
      {Key? key, required this.topRankingWinner, required this.isFinalResult})
      : super(key: key);
  final TopRankingWinner topRankingWinner;
  final bool isFinalResult;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          isFinalResult
              ? ImageAssets.allStagesMedalRanking
              : ImageAssets.allStagesRanking,
          width: double.infinity,
          height: isFinalResult ? (size.width > 650?AppSize.s27.h : AppSize.s25.h) : AppSize.s17.h,
          fit: BoxFit.fill,
        ),
        if (topRankingWinner.secondWinnerName != null &&
            topRankingWinner.secondWinnerPt != null)

          /// second rank
          Positioned(
              left: AppSize.s6.w,
              top: -AppSize.s14.h,
              child: contentWinnerStage(
                  topRankingWinner.secondWinnerImage!,
                  topRankingWinner.secondWinnerName!,
                  topRankingWinner.secondWinnerPt!,
                  context)),

        /// first rank
        Positioned(
            top: -AppSize.s17.h,
            child: contentWinnerStage(
                topRankingWinner.firstWinnerImage,
                topRankingWinner.firstWinnerName,
                topRankingWinner.fistWinnerPt,
                context)),

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
                  context)),
      ],
    );
  }

  contentWinnerStage(
      String image, String name, double pt, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s360),
            child: CachedNetworkImage(
              imageUrl:
                  Constants.baseUrl.substring(0, Constants.baseUrl.length - 1) +
                      image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) =>
                  SvgPicture.asset(ImageAssets.profileIcon),
              width: AppSize.s7.h,
              height: AppSize.s7.h,
            )),
        SizedBox(
          width: AppSize.s22.w,
          child: Text(
            name,
            style: getRegularDINNextStyle(
                color: ColorManager.white, fontSize: AppSize.s16.sp),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
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
            '${pt.toStringAsFixed(1)} ${LocaleKeys.pt.tr()}',
            style: getMediumDINNextStyle(
                color: ColorManager.black,
                fontSize: isCurrentLanguageEn(context)
                    ? AppSize.s15.sp
                    : AppSize.s13.sp),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
