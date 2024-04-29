import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/domain/model/exam/exam_result_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

import '../../../app/di.dart';
import '../../map/viewmodel/map_viewmodel.dart';

class PassTestView extends StatefulWidget {
  final ExamViewModel examViewModel;
  // final MapViewModel mapViewModel;
  final int subjectId;
  final int examId;
  final String subjectName;
  final bool passed;
  const PassTestView({
    super.key,
    required this.examViewModel,
    required this.subjectId,
    required this.examId,
    required this.subjectName,
    required this.passed,
    //  required this.mapViewModel,
  });

  @override
  State<PassTestView> createState() => _PassTestViewState();
}

class _PassTestViewState extends State<PassTestView> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerSplash;
  Artboard? riveArtboardsad;
  late RiveAnimationController controllerSplashSad;
  Artboard? riveArtboardVan;
  late RiveAnimationController controllerSplashVan;
  final MapViewModel mapViewModel = instance<MapViewModel>();
  _progressLoading() {
    return const SimpleDialog(
      elevation: AppSize.s0,
      backgroundColor: Colors.transparent,
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    widget.examViewModel.examResults();
    log(widget.passed.toString());
    controllerSplash = SimpleAnimation('Timeline 1');
    controllerSplashSad = SimpleAnimation('Sad 2');
    controllerSplashVan = SimpleAnimation('idle');

    rootBundle.load(RiveAssets.celebratingExam).then((data) {
      final file = RiveFile.import(data);
      final art = file.mainArtboard;
      art.addController(controllerSplash);

      Future.delayed(const Duration(seconds: 3)).then((value) {
        setState(() => riveArtboard = art);
      });
    });
    rootBundle.load(RiveAssets.newSad).then((data) {
      final file = RiveFile.import(data);
      final art = file.mainArtboard;
      art.addController(controllerSplashSad);

      Future.delayed(const Duration(seconds: 3)).then((value) {
        setState(() => riveArtboardsad = art);
      });
    });
    rootBundle.load(RiveAssets.lightWithOutBg).then((data) {
      final file = RiveFile.import(data);
      final art = file.mainArtboard;
      art.addController(controllerSplashVan);

      Future.delayed(const Duration(seconds: 3)).then((value) {
        setState(() => riveArtboardVan = art);
      });
    });
  }

  @override
  void dispose() {
    controllerSplash.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            ImageAssets.testResultBackgrd,
          ),
        ),
      ),
      child: Scaffold(
          backgroundColor: ColorManager.transparent,
          body: StreamBuilder<ExamResultModel>(
              stream: widget.examViewModel.outputExamResult,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return StateRenderer(
                    stateRendererType: StateRendererType.fullScreenLoadingState,
                    retryActionFunction: () {},
                  );
                } else {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Center(
                      child: Stack(
                        children: [
                          Positioned(
                            top: -AppSize.s2.h,
                            right: -AppSize.s15.w,
                            child: riveArtboardVan != null &&
                                    snapshot.data!.ex!.examResult.toInt() /
                                            snapshot.data!.ex!.totalMark >=
                                        .5
                                ? SizedBox(
                                    // transform: Matrix4.translationValues(
                                    //   AppSize.s8.h,
                                    //   AppSize.s12.h,
                                    //   AppSize.s0,
                                    // ),
                                    height: AppSize.s60.h,
                                    width: AppSize.s60.h,
                                    child: Rive(artboard: riveArtboardVan!),
                                  )
                                : SizedBox(
                                    height: AppSize.s30.h,
                                    width: AppSize.s30.h,
                                  ),
                          ),
                          Positioned(
                            top: snapshot.data!.ex!.examResult.toInt() /
                                        snapshot.data!.ex!.totalMark >=
                                    .5
                                ? 
                                AppSize.s8.h
                                 : AppSize.s2.h,
                            left: snapshot.data!.ex!.examResult.toInt() /
                                        snapshot.data!.ex!.totalMark >=
                                    .5
                                ? 
                                AppSize.s17.w
                                : - AppSize.s2.w,
                            child:
                                snapshot.data!.ex!.examResult.toInt() /
                                            snapshot.data!.ex!.totalMark >=
                                        .5
                              
                                    ? riveArtboard != null
                                        ? SizedBox(
                                            height: AppSize.s30.h,
                                            width: AppSize.s30.h,
                                            child:
                                                Rive(artboard: riveArtboard!),
                                          )
                                        : SizedBox(
                                            height: AppSize.s30.h,
                                            width: AppSize.s30.h,
                                          )
                                    : riveArtboardsad != null
                                        ? SizedBox(
                                            height: AppSize.s50.h,
                                            width: AppSize.s50.h,
                                            child: Rive(
                                                artboard: riveArtboardsad!),
                                          )
                                        : SizedBox(
                                            height: AppSize.s30.h,
                                            width: AppSize.s30.h,
                                          ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p5.w,
                              vertical: AppPadding.p2.h,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: AppSize.s30.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p24.w,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppPadding.p4.w,
                                    ),
                                    margin:
                                        EdgeInsets.only(top: AppMargin.m1.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color:
                                            snapshot.data!.ex!.examResult.toInt() /
                                              snapshot.data!.ex!.totalMark >=
                                          .5
                                          
                                              ? ColorManager.newWidget
                                              : ColorManager.transparent,
                                      border: Border.all(
                                        width: AppSize.s2.w,
                                        color: snapshot.data!.ex!.examResult
                                                        .toInt() /
                                                    snapshot
                                                        .data!.ex!.totalMark >=
                                                .5
                                            ? ColorManager.darkSkyBlue
                                            : ColorManager.orangeyRed,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        AppSize.s50,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: AppSize.s07.h),
                                        Text(
                                          LocaleKeys.grade.tr(),
                                          style: getBoldOxygenStyle(
                                            color: widget.passed
                                                ? ColorManager.greenishTeal
                                                : ColorManager.orangeyRed,
                                            fontSize: AppSize.s18.sp,
                                          ),
                                        ),
                                        SizedBox(height: AppSize.s1.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              snapshot.data!.ex!.examResult
                                                  .toInt()
                                                  .toString(),
                                              style: getBoldOxygenStyle(
                                                color: ColorManager.white,
                                                fontSize: AppSize.s23.sp,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              ' / ${snapshot.data!.ex!.totalMark.toString()} ',
                                              style: getBoldOxygenStyle(
                                                color: ColorManager.white,
                                                fontSize: AppSize.s17.sp,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: AppSize.s07.h),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSize.s6.h),
                                Text(
                                  snapshot.data!.ex!.examResult.toInt() /
                                              snapshot.data!.ex!.totalMark >=
                                          .5
                                      ? LocaleKeys.congratulation.tr()
                                      : LocaleKeys.didntPass.tr(),
                                  textAlign: TextAlign.center,
                                  style: getMediumDINNextStyle(
                                    color: widget.passed
                                        ? ColorManager.maize
                                        : ColorManager.darkSkyBlue,
                                    fontSize: AppSize.s23.sp,
                                  ),
                                ),
                                SizedBox(height: AppSize.s2.h),
                                Text(
                                  snapshot.data!.ex!.examResult.toInt() /
                                              snapshot.data!.ex!.totalMark >=
                                          .5
                                      ? LocaleKeys.youPassedExam.tr()
                                      : LocaleKeys.didntPassTitle.tr(),
                                  textAlign: TextAlign.center,
                                  style: getRegularDINNextStyle(
                                    color: ColorManager.white,
                                    fontSize: AppSize.s18.sp,
                                  ),
                                ),
                                snapshot.data!.ex!.examResult.toInt() /
                                            snapshot.data!.ex!.totalMark >=
                                        .5
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomCardWidget(
                                            title:
                                                '${snapshot.data!.item!.details!.examPeriodMinute} min',
                                            image: ImageAssets.coin,
                                          ),
                                          CustomCardWidget(
                                            title:
                                                '+${snapshot.data!.ex!.userExamPoint.toInt()} Gems',
                                            image: ImageAssets.gemBlueIcon,
                                          ),
                                          CustomCardWidget(
                                            title:
                                                '${snapshot.data!.ex!.userExamExperince.toInt()} XP',
                                            image: ImageAssets.emojiSmile,
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                                SizedBox(height: AppSize.s5.h),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorManager.terracota
                                            .withOpacity(0.5),
                                        //  blurRadius: 1,
                                        offset: const Offset(0, 5),
                                        spreadRadius: AppSize.s03.w,
                                      ),
                                    ],
                                  ),
                                  child: CustomButtonWidget(
                                    onTap: () {
                                      mapViewModel
                                          .getSubjectMapById(
                                        widget.subjectId,
                                      )
                                          .then(
                                        (value) {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            Routes.homeRoute,
                                          );
                                        },
                                      );
                                    },
                                    shadowColor: ColorManager.terracota,
                                    borderColor: ColorManager.terracota,
                                    backGroundColor: ColorManager.terracota,
                                    title: LocaleKeys.continu.tr(),
                                    height: AppSize.s7.h,
                                    textColor: ColorManager.dark,
                                    style: getMediumDINNextStyle(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s21.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSize.s3.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p12.w,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorManager.yellowTan
                                              .withOpacity(0.25),
                                          //  blurRadius: 1,
                                          offset: const Offset(0, 5),
                                          spreadRadius: AppSize.s03.w,
                                        ),
                                      ],
                                    ),
                                    child: CustomButtonWidget(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                Routes.examRoute,
                                                arguments: {
                                              'examId': widget.examId,
                                              'subjectName': widget.subjectName,
                                            });
                                      },
                                      shadowColor:
                                          ColorManager.maize.withOpacity(0.9),
                                      borderColor:
                                          ColorManager.maize.withOpacity(0.9),
                                      backGroundColor:
                                          ColorManager.maize.withOpacity(0.9),
                                      title: LocaleKeys.review.tr(),
                                      height: AppSize.s6_5.h,
                                      textColor: ColorManager.dark,
                                      widget: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.sync,
                                            color: ColorManager.dark,
                                          ),
                                          SizedBox(width: AppSize.s3.w),
                                          Text(
                                            LocaleKeys.review.tr(),
                                            style: getRegularDINNextStyle(
                                              color: ColorManager.dark,
                                              fontSize: AppSize.s21.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: AppSize.s2.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              })),
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            SizedBox(height: AppSize.s5.h),
            Card(
              color: ColorManager.white30,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppSize.s14,
                ),
              ),
              child: Card(
                margin: EdgeInsets.only(
                  top: AppPadding.p02.h,
                  bottom: AppPadding.p07.h,
                  right: AppPadding.p05.w,
                  left: AppPadding.p05.w,
                ),
                color: ColorManager.dark.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppSize.s14,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppPadding.p2.h,
                    horizontal: AppPadding.p3.w,
                  ),
                  child: Text(
                    title,
                    style: getRegularDINNextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s19,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: AppPadding.p3.h,
          ),
          child: SvgPicture.asset(
            image,
            height: AppSize.s5.h,
          ),
        ),
      ],
    );
  }
}
