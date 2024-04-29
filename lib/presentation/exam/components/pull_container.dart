import 'dart:developer';

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
import 'package:gamification/presentation/widget/custom_answer_widget.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/custom_container_choices.dart';
import 'package:gamification/presentation/widget/custom_container_item.dart';
import 'package:gamification/presentation/widget/empty_text_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/model/exam/exam_result_model.dart';
import '../../resources/font_manager.dart';
import '../widgets/solved_answers_pull_container.dart';

class PullContainerView extends StatefulWidget {
  const PullContainerView(
    this.index,
    this.isSolved,
    this.questionModel,
    this.studentCompleteChoiceResultModel,
    this.pageController,
    this.examId,
    this.numberOfAllQuestions,
  );

  final bool isSolved;
  final int index;

  final QuestionsModel questionModel;
  final List<StudentCompleteContainerChoiceResultModel>
      studentCompleteChoiceResultModel;
  final PageController pageController;
  final int examId;
  final int numberOfAllQuestions;

  @override
  State<PullContainerView> createState() => _PullContainerViewState();
}

class _PullContainerViewState extends State<PullContainerView> {
  final ExamViewModel _examViewModel = instance<ExamViewModel>();
  List<ContainerQuestionDetails> questionDetails = [];
  List<MainHeadQuestionData> mainAnswers = [];
  List<QContainerAnswerModel> firstSelectAnswers = [];
  List<QContainerAnswerModel> secondSelectAnswers = [];
  List<QContainerAnswerModel> tempContainerList = [];
  late int firstSentenceId;
  late int secondSentenceId;

  _insertMainAnswer() {
    // widget.questionModel.qContainer!.questionAnswer!.forEach(
    //   (element) {
    //     mainAnswers.add(
    //       MainHeadQuestionData(true, element),
    //     );
    //   },
    // );

    mainAnswers.forEach((element) {
      tempContainerList.add(element.questionAnswerModel);
    });
    addAnsweredContainers();
  }

  addAnsweredContainers() {
    if (widget.questionModel.questionDetails!.studentCompleteContainerChoice!
        .isNotEmpty) {
      tempContainerList.clear();
      // looping at student answers
      widget.questionModel.questionDetails!.studentCompleteContainerChoice!
          .forEach(
        (element) {
          //first sentence answers
          List<QContainerAnswerModel> questionAnswer =
              widget.questionModel.qContainer!.questionAnswer!.toSet().toList();
          // List<int>questionAnswerIds=questionAnswer.map((e) {
          //   return e.questionAnswerId;
          // }).toList();

          //  questionAnswer=questionAnswer.map((e) => e.questionAnswerId)
          //looping at q answers to compare student answers
          questionAnswer.forEach(
            (elementQ) {
              if (elementQ.questionAnswerId == element.answerId &&
                  element.scentenceId == firstSentenceId) {
                firstSelectAnswers.add(elementQ);
              }
            },
          );

          // second sentence answers

          //looping at q answers to compare student answers
          questionAnswer.forEach(
            (elementQ) {
              if (elementQ.questionAnswerId == element.answerId &&
                  element.scentenceId == secondSentenceId) {
                secondSelectAnswers.add(elementQ);
              }
            },
          );
        },
      );
    }
  }

  _insertSolvedData() {
    // widget.questionModel.questionDetailsResults!.studentCompleteChoice!
    widget.studentCompleteChoiceResultModel.forEach((element) {
      if (element.questionSentenceId == firstSentenceId) {
        widget.questionModel.qContainer!.questionAnswer!.forEach((elementQ) {
          if (elementQ.questionAnswerId == element.questionAnswerId) {
            firstSelectAnswers.add(
              QContainerAnswerModel(
                element.questionAnswerId,
                //  .qContainer!
                //         .questionAnswer!
                //         .forEach((element) {
                //       log(element.answer);
                //     })
                elementQ.answer,
                isCorrect: element.result,
              ),
            );
          }
        });
      } else {
        widget.questionModel.qContainer!.questionAnswer!.forEach((elementQ) {
          if (elementQ.questionAnswerId == element.questionAnswerId) {
            secondSelectAnswers.add(
              QContainerAnswerModel(
                  element.questionAnswerId,
                  //  .qContainer!
                  //         .questionAnswer!
                  //         .forEach((element) {
                  //       log(element.answer);
                  //     })
                  elementQ.answer,
                  isCorrect: element.result),
            );
          }
        });
      }
    });
  }

  @override
  void initState() {
    _examViewModel.getUserId();

    firstSentenceId = widget
        .questionModel.qContainer!.questionSequence![0].questionSentenceId;
    secondSentenceId = widget
        .questionModel.qContainer!.questionSequence![1].questionSentenceId;

    questionDetails.add(
      ContainerQuestionDetails(
        questionAnswerIds:
            firstSelectAnswers.map((e) => e.questionAnswerId).toSet().toList(),
        questionSentenceId: widget
            .questionModel.qContainer!.questionSequence![0].questionSentenceId,
      ),
    );
    questionDetails.add(
      ContainerQuestionDetails(
        questionAnswerIds:
            secondSelectAnswers.map((e) => e.questionAnswerId).toSet().toList(),
        questionSentenceId: widget
            .questionModel.qContainer!.questionSequence![1].questionSentenceId,
      ),
    );
    widget.questionModel.qContainer!.questionAnswer!.forEach(
      (element) {
        mainAnswers.add(
          MainHeadQuestionData(true, element),
        );
      },
    );
    if (widget.isSolved) {
      _insertSolvedData();
    } else {
      _insertMainAnswer();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
        backgroundColor: ColorManager.dark,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: AppPadding.p4.w,
              right: AppPadding.p4.w,
              // top: AppPadding.p2.h,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.s5.w,
                        //vertical: AppSize.s05.h,
                      ).copyWith(bottom: AppSize.s1.h),
                      child: Text(
                        LocaleKeys.deliverCorrectContainer.tr(),
                        style: getMediumDINNextStyle(
                            color: ColorManager.white, fontSize: AppSize.s20),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  widget.isSolved 
                  &&
                                                    widget
                                                        .questionModel
                                                        .questionDetailsResults!
                                                        .studentCompleteContainerChoice![0].questionAnswerId!=0
                      ?
                  Container(height: AppSize.s10.h)
                      :
                  DragTarget<QContainerAnswerModel>(
                    builder: (context, candidateData, rejectedData) =>
                        Container(
                            width: double.infinity,
                            height: AppSize.s21.h,
                            padding: EdgeInsets.symmetric(
                              //    vertical: AppSize.s1.h,
                              horizontal: AppSize.s4.w,
                            ),
                            decoration: BoxDecoration(
                              color: ColorManager.newWidget,
                              borderRadius: BorderRadius.circular(AppSize.s15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.isSolved
                                      ? widget.questionModel
                                          .questionDetailsResults!.questionText
                                      : widget.questionModel.questionDetails!
                                          .questionText,
                                  style: getMediumDINNextStyle(
                                      color: ColorManager.liliac,
                                      fontSize: AppSize.s20),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: AppSize.s0.h,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            widget.questionModel.qContainer!
                                                .basicContainerName,
                                            style: getMediumDINNextStyle(
                                                color:
                                                    ColorManager.periwinkle80,
                                                fontSize: AppSize.s20),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(
                                          height: AppSize.s1_7.h,
                                        ),
                                        Wrap(
                                          // alignment: WrapAlignment.center,
                                          children: List<Widget>.generate(
                                            widget.isSolved &&
                                                    widget
                                                        .questionModel
                                                        .questionDetailsResults!
                                                        .studentCompleteContainerChoice![0].questionAnswerId==0
                                                ?
                                                 mainAnswers.length
                                                : tempContainerList.length
                                             ,
                                            (index) => widget.isSolved 
                                                    
                                                ? EmptyTextContainer(
                                                    text: mainAnswers[index]
                                                        .questionAnswerModel
                                                        .answer,
                                                  )
                                                : widget
                                                        .questionModel
                                                        .questionDetails!
                                                        .studentCompleteContainerChoice!
                                                        .isEmpty
                                                    ? Draggable<
                                                        QContainerAnswerModel>(
                                                        data: mainAnswers[index]
                                                            .questionAnswerModel,
                                                        feedback:
                                                            CustomAnswerWidget(
                                                          color: ColorManager
                                                              .skyBlue
                                                              .withOpacity(.5),
                                                          text: mainAnswers[
                                                                  index]
                                                              .questionAnswerModel
                                                              .answer,
                                                        ),
                                                        childWhenDragging:
                                                            Container(),
                                                        child: widget
                                                                .questionModel
                                                                .questionDetails!
                                                                .studentCompleteContainerChoice!
                                                                .isEmpty
                                                            ? CustomContainerItem(
                                                                text: mainAnswers[
                                                                        index]
                                                                    .questionAnswerModel
                                                                    .answer,
                                                                isExist:
                                                                    mainAnswers[
                                                                            index]
                                                                        .isExist,
                                                              )
                                                            : Container(),
                                                      )
                                                    : DragTarget<
                                                        QContainerAnswerModel>(
                                                        builder: (context,
                                                                candidateData,
                                                                rejectedData) =>
                                                            Draggable<
                                                                QContainerAnswerModel>(
                                                          childWhenDragging:
                                                              Container(),
                                                          data:
                                                              tempContainerList[
                                                                  index],
                                                          onDragCompleted: () {
                                                            setState(
                                                              () {
                                                                tempContainerList
                                                                    .remove(
                                                                  tempContainerList[
                                                                      index],
                                                                );
                                                              },
                                                            );
                                                          },
                                                          feedback: Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    AppMargin
                                                                        .m2.w),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: ColorManager
                                                                  .blue
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    AppSize
                                                                        .s2.w),
                                                            child: Text(
                                                              tempContainerList[
                                                                      index]
                                                                  .answer,
                                                              style: getRegularDINNextStyle(
                                                                  color:
                                                                      ColorManager
                                                                          .white,
                                                                  fontSize:
                                                                      FontSize
                                                                          .s16
                                                                          .sp),
                                                            ),
                                                          ),
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    AppMargin
                                                                        .m2.w),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color:
                                                                    ColorManager
                                                                        .blue),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    AppSize
                                                                        .s2.w),
                                                            child: Text(
                                                              tempContainerList[
                                                                      index]
                                                                  .answer,
                                                              style: getRegularDINNextStyle(
                                                                  color:
                                                                      ColorManager
                                                                          .white,
                                                                  fontSize:
                                                                      FontSize
                                                                          .s16
                                                                          .sp),
                                                            ),
                                                          ),
                                                        ),
                                                        onWillAccept: (data) =>
                                                            true,
                                                        onAccept: (data) {
                                                          /// check if data exist exist in first list or not and remove from other list
                                                          setState(
                                                            () {
                                                              if (!tempContainerList
                                                                  .contains(
                                                                      data)) {
                                                                tempContainerList
                                                                    .add(data);

                                                                if (firstSelectAnswers
                                                                    .contains(
                                                                        data)) {
                                                                  firstSelectAnswers
                                                                      .remove(
                                                                          data);
                                                                }
                                                                if (secondSelectAnswers
                                                                    .contains(
                                                                        data)) {
                                                                  secondSelectAnswers
                                                                      .remove(
                                                                          data);
                                                                }
                                                              } else {}
                                                            },
                                                          );
                                                        },
                                                      ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                    onWillAccept: (data) => true,
                    onAccept: (data) {
                      setState(
                        () {
                          if (widget.questionModel.questionDetails!
                                  .studentCompleteContainerChoice!.isNotEmpty &&
                              !tempContainerList.contains(data)) {
                            tempContainerList.add(data);

                            if (firstSelectAnswers.contains(data)) {
                              firstSelectAnswers.remove(data);
                            }
                            if (secondSelectAnswers.contains(data)) {
                              secondSelectAnswers.remove(data);
                            }
                          }

                          /// check here if dragged item if exist or not if exist true not add
                          mainAnswers.forEach((element) {
                            if (element.questionAnswerModel.questionAnswerId ==
                                data.questionAnswerId) {
                              if (!element.isExist) {
                                firstSelectAnswers.remove(data);
                                secondSelectAnswers.remove(data);

                                element.isExist = true;
                              }
                            }
                          });
                        },
                      );
                    },
                  ),
                  if(widget.isSolved &&widget.questionModel.questionDetailsResults!.studentCompleteContainerChoice![0].questionAnswerId ==0)
                    Padding(
                      padding:  EdgeInsets.only(top:AppSize.s2.h ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          LocaleKeys.notAnswerYet.tr(),
                          style: getMediumDINNextStyle(
                              color: ColorManager.red,
                              fontSize: AppSize.s21.sp),
                        ),
                      ),
                    ),
                  SizedBox(height: AppSize.s2.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.isSolved) ...[
                        SlovedContainerItem(
                          selectAnswers: firstSelectAnswers,
                          title: widget.questionModel.qContainer!
                              .questionSequence![0].sentence,
                        ),
                        SlovedContainerItem(
                          selectAnswers: secondSelectAnswers,
                          title: widget.questionModel.qContainer!
                              .questionSequence![1].sentence,
                        ),

                      ],
                      if (!widget.isSolved) ...[
                        DragTarget<QContainerAnswerModel>(
                          builder: (context, candidateData, rejectedData) {
                            return CustomContainerChoices(
                              choicesAnswers:
                                  firstSelectAnswers.toSet().toList(),
                              titleAnswers: widget.questionModel.qContainer!
                                  .questionSequence![0].sentence,
                            );
                          },
                          onWillAccept: (data) => true,
                          onAccept: (data) {
                            /// check if data exist exist in first list or not and remove from other list
                            setState(() {
                              if (!firstSelectAnswers.contains(data) &&
                                  !widget.isSolved) {
                                firstSelectAnswers.add(data);
                                secondSelectAnswers.remove(data);

                                for (int n = 0; n < mainAnswers.length; n++) {
                                  if (mainAnswers[n].questionAnswerModel ==
                                      data) mainAnswers[n].isExist = false;
                                }
                                _examViewModel
                                    .submitSingleContainerQuestionHistory(
                                  widget.questionModel.qContainer!
                                      .questionSequence![0].questionId,
                                  widget.questionModel.qContainer!
                                      .questionSequence![0].questionSentenceId,
                                  data.questionAnswerId,
                                  widget.examId,
                                );
                              }
                              // if (tempContainerList.contains(data)) {
                              //   tempContainerList.remove(data);
                              // }
                            });
                          },
                        ),
                        DragTarget<QContainerAnswerModel>(
                          builder: (context, candidateData, rejectedData) =>
                              CustomContainerChoices(
                            choicesAnswers:
                                secondSelectAnswers.toSet().toList(),
                            titleAnswers: widget.questionModel.qContainer!
                                .questionSequence![1].sentence,
                          ),
                          onWillAccept: (data) => true,
                          onAccept: (data) {
                            /// check if data exist exist in second list or not and remove from other list

                            setState(() {
                              if (!secondSelectAnswers.contains(data) &&
                                  !widget.isSolved) {
                                firstSelectAnswers.remove(data);
                                secondSelectAnswers.add(data);
                                for (int n = 0; n < mainAnswers.length; n++) {
                                  if (mainAnswers[n].questionAnswerModel ==
                                      data) mainAnswers[n].isExist = false;
                                }
                                _examViewModel
                                    .submitSingleContainerQuestionHistory(
                                  widget.questionModel.qContainer!
                                      .questionSequence![0].questionId,
                                  widget.questionModel.qContainer!
                                      .questionSequence![1].questionSentenceId,
                                  data.questionAnswerId,
                                  widget.examId,
                                );
                              }
                              // if (tempContainerList.contains(data)) {
                              //   tempContainerList.remove(data);
                              // }
                            });
                          },
                        ),
                      ]
                    ],
                  ),
                  SizedBox(height: AppSize.s3.h),
                  if (widget.isSolved &&
                      widget.index != widget.numberOfAllQuestions - 1)
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppPadding.p10.w,
                        right: AppPadding.p3.h,
                        left: AppPadding.p3.h,
                      ),
                      child: CustomButtonWidget(
                        onTap: () {
                          widget.pageController.nextPage(
                              duration: Duration(microseconds: 300),
                              curve: Curves.bounceIn);
                        },
                        height: AppSize.s7.h,
                        shadowColor: ColorManager.terracota,
                        borderColor: ColorManager.terracota,
                        backGroundColor: ColorManager.terracota,
                        title: LocaleKeys.check.tr(),
                        style: getMediumDINNextStyle(
                          color: ColorManager.white,
                          fontSize: AppSize.s26,
                        ),
                        textColor: ColorManager.dark,
                      ),
                    ),
                  Visibility(
                    visible: !widget.isSolved,
                    child: CustomButtonWidget(
                      onTap: firstSelectAnswers.length +
                                      secondSelectAnswers.length !=
                                  widget.questionModel.qContainer!
                                      .questionAnswer!.length ||
                              widget.isSolved
                          ? null
                          : () {
                              if (!widget.isSolved) {
                                //  _examViewModel.allQuestAnswers[widget.index] = true;
                                /// set the question is solved
                                ExamView.allQuestAnswers[widget.index] = true;
                                print('${ExamView.allQuestAnswers}');

                                widget
                                    .questionModel.qContainer!.questionSequence;
                                firstSelectAnswers;
                                secondSelectAnswers;

                                List<int> firstAnswerIds = [];
                                firstSelectAnswers.forEach((element) {
                                  firstAnswerIds.add(element.questionAnswerId);
                                });
                                {
                                  questionDetails.clear();
                                  questionDetails.add(
                                    ContainerQuestionDetails(
                                      questionAnswerIds: firstSelectAnswers
                                          .map((e) => e.questionAnswerId)
                                          .toSet()
                                          .toList(),
                                      questionSentenceId: widget
                                          .questionModel
                                          .qContainer!
                                          .questionSequence![0]
                                          .questionSentenceId,
                                    ),
                                  );
                                  questionDetails.add(
                                    ContainerQuestionDetails(
                                      questionAnswerIds: secondSelectAnswers
                                          .map((e) => e.questionAnswerId)
                                          .toSet()
                                          .toList(),
                                      questionSentenceId: widget
                                          .questionModel
                                          .qContainer!
                                          .questionSequence![1]
                                          .questionSentenceId,
                                    ),
                                  );
                                }
                                // second container
                                List<int> secondAnswerIds = [];
                                secondSelectAnswers.forEach((element) {
                                  secondAnswerIds.add(element.questionAnswerId);
                                });

                                questionDetails =
                                    questionDetails.toSet().toList();
                                questionDetails.map(
                                  (e) => log(
                                    e.questionAnswerIds.toString() +
                                        e.questionSentenceId.toString(),
                                  ),
                                );
                                log(questionDetails.toString());
                                _examViewModel.submitSingleContainerQuestion(
                                    widget.questionModel.qContainer!
                                        .questionSequence![0].questionId,
                                    questionDetails,
                                    widget.examId);
                                widget.pageController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.bounceInOut);
                              }
                            },
                      shadowColor: ColorManager.terracota,
                      borderColor: ColorManager.terracota,
                      backGroundColor: ColorManager.terracota,
                      title: widget.index == widget.numberOfAllQuestions - 1
                          ? LocaleKeys.confirmAnswer.tr()
                          : LocaleKeys.check.tr(),
                      textColor: ColorManager.white,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s7.h,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class MainHeadQuestionData {
  bool isExist;

  QContainerAnswerModel questionAnswerModel;

  MainHeadQuestionData(this.isExist, this.questionAnswerModel);
}
