import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/model/exam/exam_details_model.dart';

class CustomSolvedChoiceContainer extends StatelessWidget {
  const CustomSolvedChoiceContainer(
      {Key? key,
      required this.titleAnswers,
      required this.choicesAnswers,
     required this.isCorrect})
      : super(key: key);
  final String titleAnswers;
  final List<QContainerAnswerModel> choicesAnswers;
  final List<bool> isCorrect;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppSize.s40.w,
        height: AppSize.s35.h,
        padding: EdgeInsets.symmetric(
            vertical: AppSize.s2.h, horizontal: AppSize.s3.w),
        decoration: BoxDecoration(
          color: ColorManager.newWidget,
          borderRadius: BorderRadius.circular(AppSize.s20),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            titleAnswers,
            style: getMediumDINNextStyle(
                color: ColorManager.maize, fontSize: AppSize.s20),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: AppSize.s1.h,
          ),
          Expanded(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: choicesAnswers.length,
            itemBuilder: (context, index) => IntrinsicWidth(
              child: 
              Center(
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: AppSize.s1.h),
                    padding: EdgeInsets.symmetric(
                        vertical: AppSize.s1.h, horizontal: AppSize.s3.w),
                    decoration: BoxDecoration(
                      // if false
                      // color: ColorManager.red,
                      color: ColorManager.correctGreen,
                      borderRadius: BorderRadius.circular(AppSize.s15),
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Text(
                          choicesAnswers[index].answer[index],
                          style: getMediumDINNextStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s15.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Positioned(
                          bottom: -AppSize.s1.h,
                          right: -AppSize.s1_7.h,
                          child: CircleAvatar(
                            // if false
                            //    backgroundColor: Colors.red,
                            backgroundColor: ColorManager.correctGreen,
                            radius: AppSize.s09.h,
                            child: Icon(
                              // if false
                              // MdiIcons.closeCircle,
                              Icons.check_circle,
                              color: ColorManager.white,
                              size: AppSize.s2.h,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ))
        ]));
  }
}
