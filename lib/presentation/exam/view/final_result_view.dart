import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/domain/model/exam/exam_result_model.dart';
import 'package:gamification/domain/model/exam/submit_exam_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/exam/view/exam_view.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/subject/view/subject_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FinalResultView extends StatefulWidget {
  final ExamViewModel examViewModel;
  final int subjectId;
  final int examId;
  final String subjectName;
  const FinalResultView({
    super.key,
    required this.examViewModel,
    required this.subjectId,
    required this.examId,
    required this.subjectName,
  });

  @override
  State<FinalResultView> createState() => _FinalResultViewState();
}

class _FinalResultViewState extends State<FinalResultView> {
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
    widget.examViewModel.examResults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: StreamBuilder<ExamResultModel>(
            stream: widget.examViewModel.outputExamResult,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return StateRenderer(
                  stateRendererType: StateRendererType.fullScreenLoadingState,
                  retryActionFunction: () {},
                );
              } else {
                return Padding(
                  padding: EdgeInsets.all(AppPadding.p4.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p10.w,
                          ),
                          child: SvgPicture.asset(
                            ImageAssets.finalResultImage,
                            height: AppSize.s45.h,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(AppSize.s70),
                            ),
                            border: Border.all(
                              width: AppSize.s3.w,
                              color: ColorManager.orangeLight,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorManager.orange,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(AppSize.s55),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p14.w,
                              vertical: AppPadding.p2.h,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "${LocaleKeys.grade.tr()} ${snapshot.data!.ex!.examResult.toInt()} / ${snapshot.data!.ex!.totalMark}",
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.white,
                                    fontSize: AppSize.s21.sp,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${(snapshot.data!.ex!.examResult / snapshot.data!.ex!.totalMark) * 100}',
                                      style: getBoldOxygenStyle(
                                        color: ColorManager.white,
                                        fontSize: AppSize.s28.sp,
                                      ),
                                    ),
                                    Text(
                                      '%',
                                      style: TextStyle(
                                        color: ColorManager.white,
                                        fontSize: AppSize.s20.sp,
                                        fontFeatures: const [
                                          FontFeature.subscripts(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.s2.h),
                        Text(
                          LocaleKeys.passedExam.tr(),
                          style: getRegularInterStyle(
                            color: ColorManager.warmGrey3,
                            fontSize: AppSize.s17.sp,
                          ),
                        ),
                        SizedBox(height: AppSize.s4.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p6.w,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              // int numberOfPages = 0;
                              //
                              // examViewModel.examResults();
                              //
                              // examViewModel.examResultController.stream
                              //     .listen((event) {
                              //   numberOfPages = event.item!.groups![0].heads![0]
                              //       .questions!.length;
                              // });
                              Navigator.of(context).pushReplacementNamed(
                                  Routes.examRoute,
                                  arguments: {
                                    'examId': widget.examId,
                                    'subjectName': widget.subjectName,
                                  });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSize.s35,
                              ),
                            ),
                            color: ColorManager.orange,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p3.w,
                                vertical: AppPadding.p2.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    LocaleKeys.reviewQuestions.tr(),
                                    style: getBoldOxygenStyle(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s16.sp,
                                    ),
                                  ),
                                  SizedBox(width: AppSize.s2.w),
                                  Icon(
                                    Icons.sync,
                                    color: ColorManager.white,
                                    size: AppSize.s10.w,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.s4.h),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p6.w,
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                              //         SubjectView(subjectId: subjectId),
                              //   ),
                              // );

                              Navigator.of(context)
                                  .pushReplacementNamed(Routes.homeRoute);
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSize.s35,
                              ),
                            ),
                            color: ColorManager.greyDark,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p10.w,
                                vertical: AppPadding.p2.h,
                              ),
                              child: Text(
                                LocaleKeys.backHome.tr(),
                                style: getBoldOxygenStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s18.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}
