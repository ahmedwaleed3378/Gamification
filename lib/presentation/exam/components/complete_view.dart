import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/exam/view/exam_view.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/functions.dart';

class CompleteView extends StatefulWidget {
  const CompleteView({
    Key? key,
    required this.isSolved,
    required this.questionsModel,
    required this.pageController,
    required this.examId,
    required this.index, required this.numberOfAllQuestions,
  }) : super(key: key);

  final bool isSolved;
  final QuestionsModel questionsModel;
  final PageController pageController;
  final int index;
  final int examId;
  final int numberOfAllQuestions;

  @override
  State<CompleteView> createState() => _CompleteViewState();
}

class _CompleteViewState extends State<CompleteView> {
  final ExamViewModel _examViewModel = instance<ExamViewModel>();

  List<String> completeFirstSentence = [];
  List<String> completeSecondSentence = [];
  List<String> studentChoice = [];
  List<String> completeAnswers = [];
  List<CompleteQuestionDetails> questionDetails = [];

  int selectedAnswer = -1;

  int indexOfDroppedItem = -1;
  bool correction = false;
  List<bool> studentResult = [];

  void _acceptDraggedItem(int index) {
    setState(() {
      indexOfDroppedItem = index;
    });
  }

  @override
  void initState() {
    _examViewModel.getUserId();

    for (var element in widget.questionsModel.complete!.questionSequence!) {
      completeFirstSentence.add(element.firstSentence);
      completeSecondSentence.add(element.secondSentence);
      studentChoice.add('_______');

      if (widget.questionsModel.questionDetails!.studentCompleteChoice!
              .isNotEmpty ||
          widget.isSolved) {
        for (var answer
            in widget.questionsModel.questionDetails!.studentCompleteChoice!) {
          for (var choice in widget.questionsModel.complete!.questionAnswer!) {
            if (answer.questionAnswerId == choice.questionAnswerId) {
              studentChoice.add(choice.answer);
            }
          }
        }

        selectedAnswer = 0;
        if (widget.isSolved) {
          for (var correct in widget
              .questionsModel.questionDetailsResults!.studentCompleteChoice!) {
            studentResult.add(correct.result);
          }
        }
      } else {
        studentChoice.add('_______');
      }
    }

    for (var element in widget.questionsModel.complete!.questionAnswer!) {
      completeAnswers.add(element.answer);
    }
    _studentAnswer();

    super.initState();
  }

  _studentAnswer() {
    if (widget.questionsModel.questionDetails!.studentCompleteChoice!
            .isNotEmpty ||
        widget.isSolved) {
      completeAnswers
          .removeWhere((element) => completeAnswers.contains(element));
    }

    if (widget.isSolved) {
      correction = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p4.w,
              vertical: AppPadding.p2.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                correction
                    ? const SizedBox()
                    : DragTarget<String>(
                        builder: (
                          BuildContext context,
                          List<dynamic> accepted,
                          List<dynamic> rejected,
                        ) {
                          return Container(
                            height: AppSize.s22.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.s3.w,
                            ),
                            decoration: BoxDecoration(
                              color: ColorManager.newWidget,
                              borderRadius: BorderRadius.circular(AppSize.s14),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: AppSize.s2.h),
                                Center(
                                  child: Text(
                                    LocaleKeys.groupA.tr(),
                                    style: getSemiBoldInterStyle(
                                      color: ColorManager.liliac,
                                      fontSize: AppSize.s20,
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSize.s1.h),
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Wrap(
                                      children: List<Widget>.generate(
                                          completeAnswers.length,
                                          (index) => Draggable<String>(
                                                data: completeAnswers[index],
                                                feedback: Container(
                                                  margin: EdgeInsets.symmetric(
                                                    horizontal: AppSize.s2.w,
                                                    vertical: AppSize.s1.h,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: AppSize.s1.h,
                                                    horizontal: AppSize.s3.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: ColorManager
                                                        .darkSkyBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      AppSize.s15,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    completeAnswers[index],
                                                    style:
                                                        getRegularDINNextStyle(
                                                      color: ColorManager.white,
                                                      fontSize: AppSize.s18.sp,
                                                    ),
                                                  ),
                                                ),
                                                childWhenDragging: Container(),
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                    vertical: AppSize.s1_2.h,
                                                    horizontal: AppSize.s2_5.w,
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: AppSize.s1_2.h,
                                                    horizontal: AppSize.s3.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: ColorManager.skyBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      AppSize.s15,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    completeAnswers[index],
                                                    style:
                                                        getRegularDINNextStyle(
                                                      color: ColorManager.white,
                                                      fontSize: AppSize.s18.sp,
                                                    ),
                                                  ),
                                                ),
                                              )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        onWillAccept: (data) => true,
                        onAccept: (data) {
                          setState(() {
                            completeAnswers.add(data);

                            for (int i = 0; i < studentChoice.length; i++) {
                              if (studentChoice[i] == data) {
                                studentChoice[i] = '_______';
                              }
                            }
                          });
                        },
                      ),
                SizedBox(height: AppSize.s2.h),
                correction
                    ? const SizedBox()
                    : Center(
                        child: Text(
                          LocaleKeys.groupB.tr(),
                          style: getSemiBoldInterStyle(
                            color: ColorManager.liliac,
                            fontSize: AppSize.s22,
                          ),
                        ),
                      ),
                SizedBox(height: AppSize.s2.h),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: completeFirstSentence.length,
                  itemBuilder: (context, index) => Card(
                    margin: EdgeInsets.only(
                      top: AppPadding.p02.h,
                      bottom: AppPadding.p07.h,
                      right: AppPadding.p05.w,
                      left: AppPadding.p05.w,
                    ),
                    color: ColorManager.newWidget,
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
                      child: Row(
                        children: [
                          isCurrentLanguageEn(context)
                              ? Container()
                              : DragTarget<String>(
                                  builder: (
                                    BuildContext context,
                                    List<dynamic> accepted,
                                    List<dynamic> rejected,
                                  ) {
                                    return correction
                                        ? Text(
                                            studentChoice[index],
                                            style: getRegularDINNextStyle(
                                              color: studentResult[index] ==
                                                      true
                                                  ? ColorManager.correctGreen
                                                  : ColorManager.orangeyRed,
                                              fontSize: AppSize.s21,
                                              height: AppSize.s1_2,
                                            ),
                                          )
                                        : Draggable<String>(
                                            data: studentChoice[index],
                                            feedback: Text(
                                              studentChoice[index],
                                              style: getRegularDINNextStyle(
                                                color: studentChoice[index] ==
                                                        '_______'
                                                    ? ColorManager.white
                                                    : ColorManager.darkSkyBlue,
                                                fontSize: AppSize.s21,
                                                height: AppSize.s1_2,
                                              ),
                                            ),
                                            childWhenDragging: Container(),
                                            child: Text(
                                              studentChoice[index],
                                              style: getRegularDINNextStyle(
                                                color: studentChoice[index] ==
                                                        '_______'
                                                    ? ColorManager.white
                                                    : ColorManager.darkSkyBlue,
                                                fontSize: AppSize.s21,
                                                height: AppSize.s1_2,
                                              ),
                                            ),
                                          );
                                  },
                                  onWillAccept: (data) => true,
                                  onAccept: (data) {
                                    _acceptDraggedItem(index);

                                    setState(() {
                                      completeAnswers.remove(data);
                                      studentChoice[index] = data;

                                      questionDetails.add(
                                        CompleteQuestionDetails(
                                          questionSentenceId: widget
                                              .questionsModel
                                              .complete!
                                              .questionSequence![index]
                                              .questionSentenceId,
                                          questionAnswerIds: widget
                                              .questionsModel
                                              .complete!
                                              .questionAnswer![index]
                                              .questionAnswerId,
                                        ),
                                      );

                                      if (completeAnswers.isEmpty) {
                                        selectedAnswer = 0;
                                      }
                                    });
                                  },
                                ),
                          SizedBox(width: AppSize.s2.w),
                          Expanded(
                            child: Text(
                              completeFirstSentence[index],
                              style: getRegularDINNextStyle(
                                color: ColorManager.white,
                                fontSize: AppSize.s21,
                                height: AppSize.s1_2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: AppSize.s2.h);
                  },
                ),
                SizedBox(height: AppSize.s4.h),
                correction
                    ? const SizedBox()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p6.w,
                        ),
                        child: CustomButtonWidget(
                          onTap: () {
                          //  _examViewModel.allQuestAnswers[widget.index] = true;
                            /// set the question is solved
                            ExamView.allQuestAnswers[widget.index] = true;
                            print('${ExamView.allQuestAnswers}');

                            _examViewModel.submitCompleteSingleQuestion(
                              questionId: widget
                                  .questionsModel.questionDetails!.questionId,
                              examId: widget.examId,
                              questionDetails: questionDetails,
                            );
                            widget.pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.bounceInOut,
                            );
                          },
                          height: AppSize.s7.h,
                          shadowColor: selectedAnswer != -1
                              ? ColorManager.terracota
                              : ColorManager.white30,
                          borderColor: selectedAnswer != -1
                              ? ColorManager.terracota
                              : ColorManager.white30,
                          backGroundColor: selectedAnswer != -1
                              ? ColorManager.terracota
                              : ColorManager.white30,
                          title:widget.index == widget.numberOfAllQuestions - 1? LocaleKeys.confirmAnswer.tr() :  LocaleKeys.check.tr(),
                          style: getMediumDINNextStyle(
                            color: selectedAnswer != -1
                                ? ColorManager.white
                                : ColorManager.dark,
                            fontSize: AppSize.s26,
                          ),
                          textColor: ColorManager.dark,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
