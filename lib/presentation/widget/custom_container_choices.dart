import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_answer_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/model/exam/exam_details_model.dart';

class CustomContainerChoices extends StatelessWidget {
  const CustomContainerChoices(
      {Key? key, required this.titleAnswers, required this.choicesAnswers})
      : super(key: key);
  final String titleAnswers;
  final List<QContainerAnswerModel> choicesAnswers;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s44.w,
      height: AppSize.s35.h,
      padding: EdgeInsets.symmetric(
          vertical: AppSize.s2.h, horizontal: AppSize.s1.w),
      decoration: BoxDecoration(
        color: ColorManager.newWidget,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: SingleChildScrollView(
        child: Column(
          
          children: [
            Text(
              titleAnswers,
              style: getMediumDINNextStyle(
                  color: ColorManager.maize, fontSize: AppSize.s20),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: AppSize.s1.h,
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: choicesAnswers.length,
              itemBuilder: (context, index) => Draggable<QContainerAnswerModel>(
                data: choicesAnswers[index],
                feedback: CustomAnswerWidget(
                    color: ColorManager.skyBlue.withOpacity(.5),
                    text: choicesAnswers[index].answer),
                childWhenDragging: Container(),
                child: Center(
                  child: Container(
                    width: AppSize.s28.w,
                    margin: EdgeInsets.symmetric(
                        horizontal: AppSize.s1.w, vertical: AppSize.s1.h),
                    padding: EdgeInsets.symmetric(
                      vertical: AppSize.s1.h,
                      horizontal: AppSize.s1.w,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.skyBlue,
                      borderRadius: BorderRadius.circular(AppSize.s15),
                    ),
                    child: Text(
                      choicesAnswers[index].answer,
                      style: getRegularDINNextStyle(
                        color: ColorManager.white,
                        fontSize: AppSize.s16.sp,
                      ),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ), SizedBox(
              height: 7.h,
            )
          ],
        ),
      ),
    );
  }
}
