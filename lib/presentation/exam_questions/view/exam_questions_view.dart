import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExamQuestionsView extends StatefulWidget {
  const ExamQuestionsView({Key? key}) : super(key: key);

  @override
  State<ExamQuestionsView> createState() => _ExamQuestionsViewState();
}

class _ExamQuestionsViewState extends State<ExamQuestionsView> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: '
      '${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorManager.white300,
              ColorManager.white400,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppPadding.p4.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: SizedBox(
                      height: AppSize.s4.h,
                      width: AppSize.s4.h,
                      child: SvgPicture.asset(ImageAssets.arrowIc),
                    ),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Center(
                    child: Card(
                      color: ColorManager.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppSize.s20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(ImageAssets.timerIcon),
                            SizedBox(width: AppSize.s2.w),
                            Text(
                              timerText,
                              style: getSemiBoldInterStyle(
                                color: ColorManager.red100,
                                fontSize: AppSize.s20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorManager.orange,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(AppSize.s50),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: AppPadding.p2.h,
                              ),
                              child: Text(
                                LocaleKeys.allQuestions.tr(),
                                textAlign: TextAlign.center,
                                style: getBoldOxygenStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s20.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: AppSize.s14.h),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppPadding.p8.w,
                          right: AppPadding.p8.w,
                          top: AppPadding.p8.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(AppSize.s30),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: AppPadding.p4.h,
                              horizontal: AppPadding.p8.w,
                            ),
                            child: AnimationLimiter(
                              child: GridView.count(
                                shrinkWrap: true,
                                primary: Platform.isIOS ? false : true,
                                physics: const BouncingScrollPhysics(),
                                crossAxisCount: AppSize.s5.toInt(),
                                mainAxisSpacing: AppSize.s10,
                                crossAxisSpacing: AppSize.s9,
                                children: List.generate(
                                  40,
                                  (int index) {
                                    return AnimationConfiguration.staggeredGrid(
                                      columnCount: AppSize.s5.toInt(),
                                      position: index,
                                      duration: Duration(
                                          milliseconds: AppSize.s500.toInt()),
                                      child: ScaleAnimation(
                                        scale: AppSize.s05,
                                        child: FadeInAnimation(
                                          child: InkWell(
                                            onTap: () {
                                              // PersistentNavBarNavigator
                                              //     .pushDynamicScreen(
                                              //   context,
                                              //   screen: MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         const ExamView(),
                                              //   ),
                                              //   withNavBar: false,
                                              // );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSize.s12),
                                                color: ColorManager.darkGrey,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${index + 1}'.toString(),
                                                  style: getBoldOxygenStyle(
                                                    color: ColorManager.white,
                                                    fontSize: AppSize.s20.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Center(
                    child: MaterialButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p10.w,
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppSize.s16,
                        ),
                      ),
                      color: ColorManager.orange,
                      child: Text(
                        LocaleKeys.submitAll.tr(),
                        style: getBoldOxygenStyle(
                          color: ColorManager.white,
                          fontSize: AppSize.s16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
