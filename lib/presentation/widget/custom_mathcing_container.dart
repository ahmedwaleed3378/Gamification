import 'package:flutter/material.dart';
import 'package:gamification/domain/model/exam/gobal_matching_question.dart';
import 'package:gamification/presentation/exam/components/matching.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_answer_widget.dart';
import 'package:gamification/presentation/widget/custom_matched_item.dart';
import 'package:gamification/presentation/widget/empty_text_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MatchingWidget extends StatelessWidget {
  MatchingWidget(
      {Key? key,
      required this.titleAnswers,
      required this.answersData,
      required this.titleColor,
      required this.height,
      required this.isRight,
      this.questionData,
      required this.onAccept,
      required this.isSolved,
      this.result,
      this.setStateRemove, this.solvedExamButNotSubmitted})
      : super(key: key);
  final String titleAnswers;
  final List<AnswerData> answersData;
  List<QuestionData>? questionData;
  final Color titleColor;
  final double height;
  final bool isRight;
  final bool isSolved;
  final Function(GlobalLeftAndRightSideMatchingModel,
      GlobalLeftAndRightSideMatchingModel) onAccept;
  List<Color>? result;

  final Function? setStateRemove;
  final Color? solvedExamButNotSubmitted; 
  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: AppSize.s40.w,
      height: height,
      padding: EdgeInsets.symmetric(
          vertical: AppSize.s2.h, horizontal: AppSize.s3.w),
      decoration: BoxDecoration(
        color: ColorManager.newWidget,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppSize.s1.h,
          ),
          Text(
            titleAnswers,
            style:
                getMediumDINNextStyle(color: titleColor, fontSize: AppSize.s20),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: AppSize.s2.h,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: answersData != null
                  ? answersData.length
                  : questionData!.length,
              itemBuilder: (context, index) {
                if (isRight) {
                  // answer only right side
                  return Center(
                    child: IgnorePointer(
                      ignoring: solvedExamButNotSubmitted!=null? true:false,
                      child: Draggable<GlobalLeftAndRightSideMatchingModel>(
                        data: answersData[index].answerData,
                        feedback: CustomAnswerWidget(
                            color: ColorManager.skyBlue.withOpacity(.5),
                            text: answersData[index]
                                .answerData
                                .leftAndRightSideText),
                        childWhenDragging: Container(),
                        child: answersData[index].isExist
                            ? CustomMatchedItem(
                                color:solvedExamButNotSubmitted ?? ColorManager.skyBlue,
                                text: answersData[index]
                                    .answerData
                                    .leftAndRightSideText)
                            : EmptyTextContainer(
                                text: answersData[index]
                                    .answerData
                                    .leftAndRightSideText,
                                backgroundColor: ColorManager.dark,
                                textColor: ColorManager.dark),
                      ),
                    ),
                  );
                } else {
                  // answers and questions
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child:
                              DragTarget<GlobalLeftAndRightSideMatchingModel>(
                            builder: (context, candidateData, rejectedData) =>
                                SizedBox(
                              width: double.infinity,
                              child: CustomMatchedItem(
                                  color:solvedExamButNotSubmitted?? ColorManager.skyBlue,
                                  text: questionData![index]
                                      .questionModel
                                      .leftAndRightSideText),
                            ),
                            onWillAccept: (data) => !isSolved,
                            onAccept: (data) {
                              if (questionData![index].answer == null) {
                                for (int n = 0; n < answersData.length; n++) {
                                  if (answersData[n].answerData.id == data.id &&
                                      answersData[n].isExist) {
                                    answersData[n].isExist = false;
                                    questionData![index].answer = data;
                                    onAccept(questionData![index].questionModel,
                                        answersData[n].answerData);
                                  }
                                }
                              }
                            },
                          ),
                        ),
                      ),
                      if (questionData![index].answer != null) ...[
                        Expanded(
                            flex: 2,
                            child: Row(
                          children: [
                            Container(
                              color: ColorManager.maize,
                              height: AppSize.s03.h,
                              width: AppSize.s4.w,
                            ),
                            Expanded(
                              flex: 3,
                              child: Draggable<
                                  GlobalLeftAndRightSideMatchingModel>(
                                data: questionData![index].answer,
                                feedback: CustomAnswerWidget(
                                  color: ColorManager.skyBlue.withOpacity(.5),
                                  text: questionData![index]
                                      .answer!
                                      .leftAndRightSideText,
                                ),
                                childWhenDragging: isSolved && result != null
                                    ? null
                                    : Container(),
                                child: GestureDetector(
                                  onTap: isSolved && result != null
                                      ? null
                                      : () {
                                          for (int n = 0;
                                              n < answersData.length;
                                              n++) {
                                            if (questionData![index].answer !=
                                                null) {
                                              if (answersData[n]
                                                          .answerData
                                                          .id ==
                                                      questionData![index]
                                                          .answer!
                                                          .id &&
                                                  answersData[n].isExist ==
                                                      false) {
                                                answersData[n].isExist = true;

                                                // remove answer from question
                                                questionData![index].answer =
                                                    null;
                                              }
                                            }
                                            setStateRemove!();
                                          }
                                        },
                                  child: CustomMatchedItem(
                                      color: isSolved && result != null
                                          ? result![index]
                                          : ColorManager.skyBlue,
                                      text: questionData![index]
                                          .answer!
                                          .leftAndRightSideText,
                                      width: AppSize.s16.w),
                                ),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
