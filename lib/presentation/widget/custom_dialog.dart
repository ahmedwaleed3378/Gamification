import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//ignore: must_be_immutable
class CustomDialog extends StatelessWidget {
  CustomDialog({
    super.key,
    required ExamViewModel examViewModel,
    required this.timesUp,
    required this.leftQuestions,
    this.numLeftQuestions,
    this.pageController,
  }) : _examViewModel = examViewModel;

  final ExamViewModel _examViewModel;
  final bool timesUp;
  final bool leftQuestions;
  List<int>? numLeftQuestions;
  PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p2.w,
            ),
            margin: EdgeInsets.only(top: AppMargin.m1.w),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: ColorManager.dark,
              border: Border.all(
                width: AppSize.s2,
                color: ColorManager.white,
              ),
              borderRadius: BorderRadius.circular(AppSize.s20),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.white,
                  blurRadius: AppSize.s10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: AppSize.s4.h),
                Text(
                  timesUp
                      ? LocaleKeys.timeOver.tr()
                      : LocaleKeys.areYouSureSubmitSolve.tr(),
                  style: getMediumMPLUSRounded1CStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s19.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSize.s3.h),
                Text(
                  timesUp
                      ? LocaleKeys.betterLuckNextTime.tr()
                      : LocaleKeys.youDidNotFinished.tr(),
                  style: getRegularDINNextStyle(
                    color: timesUp ? ColorManager.white : ColorManager.red200,
                    fontSize: AppSize.s17.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSize.s2.h),
                leftQuestions
                    ? Text(
                        '${LocaleKeys.leftQuestions.tr()} ${numLeftQuestions!.length}',
                        style: getRegularDINNextStyle(
                          color: ColorManager.red200,
                          fontSize: AppSize.s17.sp,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox(),
                SizedBox(height: AppSize.s4.h),
                timesUp || leftQuestions
                    ? Center(
                        child: CustomButtonWidget(
                          onTap: () {
                            if (leftQuestions) {
                              // _examViewModel.submitExam();
                              Navigator.of(context).pop();

                              pageController!.animateToPage(
                                numLeftQuestions![0],
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              _examViewModel.submitExam();

                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const PassTestView(passed: true),
                              //   ),
                              // );
                            }
                          },
                          width: AppSize.s30.w,
                          shadowColor: ColorManager.terracota,
                          borderColor: ColorManager.terracota,
                          backGroundColor: ColorManager.terracota,
                          title: leftQuestions
                              ? LocaleKeys.returnT.tr()
                              : LocaleKeys.confirm.tr(),
                          height: AppSize.s5.h,
                          textColor: ColorManager.dark,
                          style: getMediumDINNextStyle(
                            color: ColorManager.white,
                            fontSize: AppSize.s18.sp,
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButtonWidget(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            width: AppSize.s42.w,
                            shadowColor: ColorManager.charcoalGrey1,
                            borderColor: ColorManager.charcoalGrey1,
                            backGroundColor: ColorManager.charcoalGrey1,
                            title: LocaleKeys.cancel.tr(),
                            height: AppSize.s5.h,
                            textColor: ColorManager.terracota,
                            style: getMediumDINNextStyle(
                              color: ColorManager.terracota,
                              fontSize: AppSize.s18.sp,
                            ),
                          ),
                          CustomButtonWidget(
                            onTap: () {
                              _examViewModel.submitExam();

                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         const PassTestView(passed: true),
                              //   ),
                              // );
                            },
                            width: AppSize.s30.w,
                            shadowColor: ColorManager.terracota,
                            borderColor: ColorManager.terracota,
                            backGroundColor: ColorManager.terracota,
                            title: LocaleKeys.submit.tr(),
                            height: AppSize.s5.h,
                            textColor: ColorManager.dark,
                            style: getMediumDINNextStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s18.sp,
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: AppSize.s5.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
