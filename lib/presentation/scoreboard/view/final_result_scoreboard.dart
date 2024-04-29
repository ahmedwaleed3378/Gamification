import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/domain/model/scoreboard/top_ranking_winner.dart';
import 'package:gamification/domain/model/student_rank/student_rank_model.dart';
import 'package:gamification/presentation/scoreboard/view/view_all_final_scoreboard.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../../app/constants.dart';
import '../../../app/di.dart';
import '../../common/state_rendrer/state_renderer.dart';
import '../../widget/custom_ranking.dart';
import '../../widget/refresh_indicator_widget.dart';
import '../viewmodel/scoreboard_viewmodel.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class FinalResultScoreBoardView extends StatefulWidget {
  const FinalResultScoreBoardView({Key? key}) : super(key: key);

  @override
  State<FinalResultScoreBoardView> createState() =>
      _FinalResultScoreBoardViewState();
}

class _FinalResultScoreBoardViewState extends State<FinalResultScoreBoardView> {
  final ScoreBoardViewModel _viewModel = instance<ScoreBoardViewModel>();
  int selectedIndex = -1;
  ScreenshotController screenshotController = ScreenshotController();

  _saveImage(Uint8List image) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    String imageName = 'ScreenShot$time';
    await ImageGallerySaver.saveImage(image, name: imageName);
  }

  Widget _addThreeStudentMedal(StudentRankModel studentRankModel) {
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
      isFinalResult: true,
    );
  }

  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Future loadList() async {
    _viewModel.start();
  }

  Widget _getContentWidget() {
    return RefreshWidget(
        onRefresh: loadList,
        widgetChild: Screenshot(
          controller: screenshotController,
          child: Scaffold(
              backgroundColor: ColorManager.dark,
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
                        ),
                      ),
                    ),
                    StreamBuilder<StudentRankModel>(
                        stream: _viewModel.outScoreBoardDataStream,
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            return SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p6.w,
                                    vertical: AppPadding.p1.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: AppPadding.p3.h,
                                            bottom: AppPadding.p2.h,
                                            left: AppPadding.p2.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              icon: Icon(
                                                Icons.close,
                                                size: AppSize.s4.h,
                                                color: ColorManager.terracota,
                                              ),
                                            ),

                                           Expanded(
                                             child:  Center(
                                               child: Text(
                                               LocaleKeys.finalScoreBoard.tr(),
                                               style: getRegularDINNextStyle(
                                                 color: ColorManager.terracota,
                                                 fontSize: AppSize.s21.sp,
                                               ),
                                               textAlign: TextAlign.center,
                                           ),
                                             ),)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppSize.s17.h,
                                      ),
                                      if (snapshot.data!.top3Students.isNotEmpty)
                                        _addThreeStudentMedal(snapshot.data!),
                                      if (snapshot.data!.top3Students.isEmpty)
                                        CustomRankingScore(
                                          topRankingWinner: TopRankingWinner(
                                            firstWinnerImage: Constants.empty,
                                            firstWinnerName: Constants.empty,
                                            fistWinnerPt:
                                                Constants.zero.toDouble(),
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
                                                  bottomRight: Radius.circular(
                                                      AppSize.s20),
                                                  bottomLeft: Radius.circular(
                                                      AppSize.s20),
                                                )),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: AppSize.s24.h,
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    itemCount: snapshot
                                                        .data!
                                                        .mylogginStudentShortList
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return InkWell(
                                                        onTap: () {
                                                          setState(() =>
                                                              selectedIndex =
                                                                  index);
                                                        },
                                                        child: Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      AppSize.s009
                                                                          .h),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      AppSize
                                                                          .s1.h,
                                                                  horizontal:
                                                                      AppSize
                                                                          .s4.w),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        AppSize
                                                                            .s10),
                                                            color: selectedIndex ==
                                                                    index
                                                                ? ColorManager
                                                                    .grayBrown2
                                                                : Colors
                                                                    .transparent,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                width:
                                                                    AppSize.s10.w,
                                                                child: Text(
                                                                  '${index + 1}',
                                                                  style: getMediumDINNextStyle(
                                                                      color: selectedIndex ==
                                                                              index
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
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      SvgPicture.asset(
                                                                          ImageAssets
                                                                              .profileIcon),
                                                                  width: AppSize
                                                                      .s10.w,
                                                                  height: AppSize
                                                                      .s10.w,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    AppSize.s6.w,
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    AppSize.s35.w,
                                                                child: Text(
                                                                  (snapshot
                                                                          .data
                                                                          ?.mylogginStudentShortList[
                                                                              index]
                                                                          ?.arName ??
                                                                      Constants
                                                                          .empty),
                                                                  style: getRegularDINNextStyle(
                                                                      color: selectedIndex ==
                                                                              index
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
                                                                            .data
                                                                            ?.mylogginStudentShortList[
                                                                                index]
                                                                            ?.totalPoints ??
                                                                        Constants
                                                                            .zero)
                                                                    .toString(),
                                                                style: getMediumDINNextStyle(
                                                                    color: ColorManager
                                                                        .goldenRod,
                                                                    fontSize:
                                                                        AppSize
                                                                            .s19
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
                                                                const ViewAllFinalScoreBoardExamView(),
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
                                        height: AppSize.s15.h,
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
                                  _viewModel.start();
                                },
                              ),
                            );
                          }
                        }),
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                height: AppSize.s10.h,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      top: BorderSide(
                        color: ColorManager.secondaryText,
                        width: AppSize.s1_5,
                      ),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: AppSize.s37.w,
                      child: CustomButtonWidget(
                        icon: MdiIcons.share,
                        onTap: () async {
                          shareScreenShot();
                        },
                        shadowColor: ColorManager.terracota,
                        borderColor: ColorManager.terracota,
                        backGroundColor: ColorManager.dark,
                        title: LocaleKeys.share.tr(),
                        textColor: ColorManager.terracota,
                        iconColor: ColorManager.terracota,
                      ),
                    ),

                    /// TODO WILL ADD SHARE FUNCTION
                    // SizedBox(
                    //   width: AppSize.s37.w,
                    //   child: CustomButtonWidget(
                    //     icon: MdiIcons.nearMe,
                    //     onTap: () {},
                    //     shadowColor: ColorManager.terracota,
                    //     borderColor: ColorManager.terracota,
                    //     backGroundColor: ColorManager.terracota,
                    //     title: LocaleKeys.share.tr(),
                    //     textColor: ColorManager.white,
                    //   ),
                    // ),
                  ],
                ),
              )),
        ));
  }

  shareScreenShot() {
    screenshotController
        .capture(delay: const Duration(milliseconds: 200))
        .then((capturedImage) async {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = await File('${directory.path}/image.png').create();
      await imagePath.writeAsBytes(capturedImage!);

      await Share.shareXFiles([XFile(imagePath.path)],
          text: '${LocaleKeys.shareApp.tr()} \n ${LocaleKeys.startDesc.tr()}'
              '\n${LocaleKeys.playStore.tr()} ${Constants.playStoreUrl} '
              '\n${LocaleKeys.appStore.tr()} ${Constants.appStoreUrl}.');
    }).catchError((onError) {
      print(onError);
    });
  }
}
