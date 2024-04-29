import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/app/functions.dart';
import 'package:gamification/domain/model/scoreboard/top_ranking_winner.dart';
import 'package:gamification/domain/model/student_rank/student_rank_model.dart';
import 'package:gamification/presentation/resources/constants_manager.dart';
import 'package:gamification/presentation/scoreboard/view/final_result_scoreboard.dart';
import 'package:gamification/presentation/scoreboard/view/instruction_view.dart';
import 'package:gamification/presentation/scoreboard/view/view_all_scoreboards.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/custom_ranking.dart';
import 'package:gamification/presentation/widget/custom_timer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/state_rendrer/state_renderer.dart';
import '../../common/state_rendrer/state_renderer_impl.dart';
import '../../widget/refresh_indicator_widget.dart';
import '../viewmodel/scoreboard_viewmodel.dart';

class ScoreBoardView extends StatefulWidget {
  const ScoreBoardView({Key? key}) : super(key: key);

  @override
  State<ScoreBoardView> createState() => _ScoreBoardViewState();
}

class _ScoreBoardViewState extends State<ScoreBoardView> {
  final ScoreBoardViewModel _viewModel = instance<ScoreBoardViewModel>();
  int selectedIndex = -1;
  Timer? _timer;

  void _bind() {
    _viewModel.start();
  }

  _countDown() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    _timer = Timer.periodic(const Duration(seconds: AppConstants.timerDuration),
        (Timer t) => _countDown());

    super.initState();
  }

  Widget _addThreeStudent(StudentRankModel studentRankModel) {
    int lengthTopStudent = studentRankModel.top3Students.length;
    return CustomRankingScore(
      topRankingWinner: TopRankingWinner(
        firstWinnerImage: studentRankModel.top3Students[0]!.userProfile,
        firstWinnerName: studentRankModel.top3Students[0]!.arName,
        fistWinnerPt: studentRankModel.top3Students[0]!.totalPoints,
        secondWinnerImage: lengthTopStudent > 1
            ? studentRankModel.top3Students[1]!.userProfile
            : null,
        secondWinnerName: lengthTopStudent > 1
            ? studentRankModel.top3Students[1]!.arName
            : null,
        secondWinnerPt: lengthTopStudent > 1
            ? (studentRankModel.top3Students[1]?.totalPoints ?? Constants.zero)
                .toDouble()
            : null,
        thirdWinnerImage: lengthTopStudent > 2
            ? studentRankModel.top3Students[2]!.userProfile
            : null,
        thirdWinnerName: lengthTopStudent > 2
            ? studentRankModel.top3Students[2]!.arName
            : null,
        thirdWinnerPt: lengthTopStudent > 2
            ? (studentRankModel.top3Students[2]?.totalPoints ?? Constants.zero)
                .toDouble()
            : null,
      ),
      isFinalResult: false,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.start();
              }) ??
              _getContentWidget();
        });
  }

  Future loadList() async {
    _viewModel.start();
  }

  Widget _getContentWidget() {
    return RefreshWidget(
        onRefresh: loadList,
        widgetChild: Scaffold(
          backgroundColor: ColorManager.dark,
          appBar: AppBar(
            toolbarHeight: AppSize.s0,
            elevation: AppSize.s0,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                  child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: SvgPicture.asset(
                        ImageAssets.backGroundArrow,
                        fit: BoxFit.fill,
                      )),
                ),
                StreamBuilder<StudentRankModel>(
                    stream: _viewModel.outScoreBoardDataStream,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p6.w,
                            vertical: AppPadding.p1.h,
                          ),
                          child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        //top: AppPadding.p6.h,
                                        bottom: AppPadding.p2.h,
                                        left: AppPadding.p2.w),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: AppSize.s20.w,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            LocaleKeys.scoreBoard.tr(),
                                            style: getMediumDINNextStyle(
                                              color: ColorManager.terracota,
                                              fontSize: AppSize.s21.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppSize.s15.w,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      InstructionsView(
                                                          instructions: snapshot
                                                              .data!
                                                              .instructions!),
                                                ));
                                          },
                                          child: SvgPicture.asset(
                                            ImageAssets.questionIcon,
                                            width: AppSize.s4.h,
                                            height: AppSize.s4.h,
                                            color: ColorManager.terracota,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: CustomTimer(
                                      day: snapshot.data!.resetDays!,
                                      hour: snapshot.data!.resetHours!,
                                      minute: snapshot.data!.resetMinutes!,
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppSize.s18.h,
                                  ),
                                  if (snapshot.data!.top3Students.isNotEmpty)
                                    _addThreeStudent(snapshot.data!),
                                  if (snapshot.data!.top3Students.isEmpty)
                                    CustomRankingScore(
                                      topRankingWinner: TopRankingWinner(
                                        firstWinnerImage: Constants.empty,
                                        firstWinnerName: Constants.empty,
                                        fistWinnerPt: Constants.zero.toDouble(),
                                        secondWinnerImage: Constants.empty,
                                        secondWinnerName: Constants.empty,
                                        secondWinnerPt:
                                            Constants.zero.toDouble(),
                                        thirdWinnerImage: Constants.empty,
                                        thirdWinnerName: Constants.empty,
                                        thirdWinnerPt:
                                            Constants.zero.toDouble(),
                                      ),
                                      isFinalResult: false,
                                    ),
                                  if (snapshot.data!.mylogginStudentShortList
                                      .isNotEmpty)
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: AppSize.s005.h),
                                        decoration: BoxDecoration(
                                            color: ColorManager.charcoalGrey,
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(AppSize.s20),
                                              bottomLeft:
                                                  Radius.circular(AppSize.s20),
                                            )),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: AppSize.s23.h,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemCount: snapshot
                                                    .data
                                                    ?.mylogginStudentShortList
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() =>
                                                          selectedIndex =
                                                              index);
                                                    },
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: AppSize
                                                                  .s009.h),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical:
                                                                  AppSize.s1.h,
                                                              horizontal:
                                                                  AppSize.s4.w),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    AppSize
                                                                        .s10),
                                                        color:
                                                            selectedIndex ==
                                                                    index
                                                                ? ColorManager
                                                                    .grayBrown2
                                                                : Colors
                                                                    .transparent,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: AppSize.s8.w,
                                                            child: Text(
                                                              snapshot
                                                                  .data!
                                                                  .mylogginStudentShortList[
                                                                      index]!
                                                                  .userRank
                                                                  .toString(),
                                                              style: getMediumDINNextStyle(
                                                                  color: selectedIndex == index
                                                                      ? ColorManager
                                                                          .green
                                                                      : ColorManager
                                                                          .lightBlue,
                                                                  fontSize:
                                                                      AppSize
                                                                          .s19
                                                                          .sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        AppSize
                                                                            .s360),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: Constants
                                                                      .baseUrl
                                                                      .substring(
                                                                          0,
                                                                          Constants.baseUrl.length -
                                                                              1) +
                                                                  snapshot
                                                                      .data!
                                                                      .mylogginStudentShortList[
                                                                          index]!
                                                                      .userProfile,
                                                              progressIndicatorBuilder: (context,
                                                                      url,
                                                                      downloadProgress) =>
                                                                  CircularProgressIndicator(
                                                                      value: downloadProgress
                                                                          .progress),
                                                              fit: BoxFit.cover,
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  SvgPicture.asset(
                                                                      ImageAssets
                                                                          .profileIcon),
                                                              width:
                                                                  AppSize.s10.w,
                                                              height:
                                                                  AppSize.s10.w,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: AppSize.s4.w,
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                AppSize.s35.w,
                                                            child: Text(
                                                              snapshot
                                                                  .data!
                                                                  .mylogginStudentShortList[
                                                                      index]!
                                                                  .arName,
                                                              style: getRegularDINNextStyle(
                                                                  color: selectedIndex == index
                                                                      ? ColorManager
                                                                          .green
                                                                      : ColorManager
                                                                          .lightBlue,
                                                                  fontSize:
                                                                      AppSize
                                                                          .s18
                                                                          .sp),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            (snapshot
                                                                    .data!
                                                                    .mylogginStudentShortList[
                                                                        index]!
                                                                    .totalPoints)
                                                                .toStringAsFixed(
                                                                    1),
                                                            style: getMediumDINNextStyle(
                                                                color: ColorManager
                                                                    .goldenRod,
                                                                fontSize:
                                                                    AppSize.s19
                                                                        .sp),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ViewAllScoreBoardExamView(),
                                                      ));
                                                },
                                                child: Text(
                                                  LocaleKeys.viewMore.tr(),
                                                  style: getRegularDINNextStyle(
                                                          color: ColorManager
                                                              .terracota,
                                                          fontSize:
                                                              AppSize.s17.sp)
                                                      .copyWith(
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ))
                                          ],
                                        )),
                                  if (snapshot
                                      .data!.mylogginStudentShortList.isEmpty)
                                    Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: AppSize.s2.h,
                                          ),
                                          SvgPicture.asset(ImageAssets.robot),
                                          SizedBox(
                                            height: AppSize.s2.h,
                                          ),
                                          Text(
                                            LocaleKeys.emptyList.tr(),
                                            style: getMediumDINNextStyle(
                                                color: ColorManager.white,
                                                fontSize: AppSize.s20.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  SizedBox(
                                    height: AppSize.s05.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppPadding.p8.w),
                                    child: CustomButtonWidget(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const FinalResultScoreBoardView(),
                                            ));
                                      },
                                      shadowColor: ColorManager.terracota,
                                      borderColor: ColorManager.terracota,
                                      backGroundColor: ColorManager.terracota,
                                      title: LocaleKeys.lastWeekResult.tr(),
                                      textColor: ColorManager.white,
                                      fontSize: isCurrentLanguageEn(context)
                                          ? null
                                          : AppSize.s17.sp,
                                    ),
                                  )
                                ],
                              )),
                        );
                      } else {
                        return Align(
                          alignment: Alignment.center,
                          child: StateRenderer(
                            stateRendererType:
                                StateRendererType.fullScreenLoadingState,
                            retryActionFunction: () {
                              _viewModel.getScoreBoardData();
                            },
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ));
  }
}
