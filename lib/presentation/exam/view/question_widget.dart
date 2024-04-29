import 'package:flutter/material.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/presentation/exam/view/question_choice.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../resources/values_manager.dart';

class QuestionWidget extends StatefulWidget {
  final QuestionsModel question;
  final ExamViewModel examViewModel;
  final NumberPaginatorController paginatorController;
  final int numberOfPages;
  final int index;
  final ItemScrollController scrollController;

  const QuestionWidget(
      {Key? key,
      required this.question,
      required this.examViewModel,
      required this.paginatorController,
      required this.numberOfPages,
      required this.scrollController,
      required this.index})
      : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    final List<String> choicesText =
        widget.question.mcq!.map((choice) => choice.mcqText).toList();

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.s4.h)
            .copyWith(top: AppSize.s3.h),
        child: Container(
          padding: EdgeInsets.all(AppSize.s3.h),
          decoration: BoxDecoration(
              color: ColorManager.gray,
              borderRadius: BorderRadius.circular(AppSize.s30)),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '${widget.index + 1}) ',
                        style: getSemiBoldOpenSansStyle(
                            color: ColorManager.babyBlue,
                            fontSize: AppSize.s17.sp)),
                    TextSpan(
                        text:
                            ' ${widget.question.questionDetails!.questionText}',
                        style: getSemiBoldOpenSansStyle(
                            color: ColorManager.white,
                            fontSize: AppSize.s17.sp)),
                  ],
                ),
              ),
              SizedBox(
                height: AppSize.s2.h,
              ),
              widget.question.questionDetails!.questionAttach.isNotEmpty
                  // true
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s20),
                      child: Image.network(
                        Constants.baseUrl +
                            widget.question.questionDetails!.questionAttach,
                        // 'https://images.freeimages.com/images/previews/ac9/railway-hdr-1361893.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          ImageAssets.empty,
                          width: AppSize.s14.h,
                          height: AppSize.s14.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
      SizedBox(
        height: AppSize.s4.h,
      ),
      QuestionChoices(
          choicesText: choicesText,
          examViewModel: widget.examViewModel,
          question: widget.question,
          paginatorController: widget.paginatorController,
          numberOfPages: widget.numberOfPages,
          index: widget.index,
          scrollController: widget.scrollController,
          showButtonGroup: true),
    ]);
  }
}
