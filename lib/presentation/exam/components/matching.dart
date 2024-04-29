import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/data/network/requests.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/domain/model/exam/gobal_matching_question.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/exam/view/exam_view.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/custom_mathcing_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MatchingView extends StatefulWidget {
  const MatchingView({
    super.key,
    required this.matcingQuestionModel,
    required this.isSolved,
    required this.studentMatchingChoice,
    required this.questionsModel,
    required this.pageController,
    required this.isSumbittedBefore,
    required this.examId,
    required this.index,
    required this.numberOfAllQuestions,
  });

  final MatchingQuestionModel matcingQuestionModel;
  final List<StudentMatchingChoiceModel>? studentMatchingChoice;
  final bool isSolved;
  final QuestionsModel questionsModel;
  final PageController pageController;
  final bool isSumbittedBefore;
  final int examId;
  final int index;
  final int numberOfAllQuestions;

  @override
  State<MatchingView> createState() => _MatchingViewState();
}

class _MatchingViewState extends State<MatchingView>
    with TickerProviderStateMixin {
  final ExamViewModel _examViewModel = instance<ExamViewModel>();
  List<QuestionData> leftSelectQuestion = [];
  List<AnswerData> rightSelectAnswers = [];

  List<Color> colorResult = [];
  late final TabController _tabController;
  int selectedTabViewIndex = 0;
  bool isAllResultTrue = false;

  /// insertion left and right list
  insertList() {
    /// Questions
    widget.matcingQuestionModel.rightSideMatching!
        .forEach((rightSideModelElement) {
      leftSelectQuestion.add(QuestionData(
          null,
          GlobalLeftAndRightSideMatchingModel(
            rightSideModelElement.id,
            rightSideModelElement.questionId,
            rightSideModelElement.rightSideText,
          )));
    });

    /// Answers
    widget.matcingQuestionModel.leftSideMatching!
        .forEach((leftSideModelElement) {
      rightSelectAnswers.add(AnswerData(
          true,
          GlobalLeftAndRightSideMatchingModel(
            leftSideModelElement.id,
            leftSideModelElement.questionId,
            leftSideModelElement.leftSideText,
          )));
    });
  }

  // match questions and answers in case result
  _connectRightAndLeftSide() {
    List<QuestionData> leftSelectQuestionTemp = [];
    colorResult = [];

    widget.questionsModel.questionDetailsResults!.studentMatchingChoice!
        .forEach((element) {
      QuestionData? question;
      AnswerData? answer;
      element.result
          ? colorResult.add(ColorManager.correctGreen)
          : colorResult.add(ColorManager.orangeyRed);
      question = leftSelectQuestion.firstWhere(
          (q) => q.questionModel.id == element.questionDetLeftSideId);
      answer = rightSelectAnswers
          .firstWhere((q) => q.answerData.id == element.questionDetRightSideId);
      leftSelectQuestionTemp
          .add(QuestionData(answer.answerData, question.questionModel));
    });
    setState(() => leftSelectQuestion = leftSelectQuestionTemp);
    rightSelectAnswers.forEach((element) => element.isExist = false);

    for (int n = 0; n < colorResult.length; n++) {
      if (colorResult[n] == ColorManager.orangeyRed) {
        isAllResultTrue = false;
        break;
      } else {
        isAllResultTrue = true;
      }
    }
  }

  // match correct answers to correct questions
  _connectCorrectAnswers() {
    List<QuestionData> leftSelectQuestionTemp = [];
    colorResult = [];
    for (int n = 0;
        n <
            widget.questionsModel.questionDetailsResults!.studentMatchingChoice!
                .length;
        n++) {
      colorResult.add(ColorManager.correctGreen);
      QuestionData? question;
      AnswerData? answer;
      question = leftSelectQuestion[n];
      answer = rightSelectAnswers[n];
      leftSelectQuestionTemp
          .add(QuestionData(answer.answerData, question.questionModel));
    }

    setState(() => leftSelectQuestion = leftSelectQuestionTemp);
    rightSelectAnswers.forEach((element) => element.isExist = false);
  }

  _submittedData() {
    List<QuestionData> leftSelectQuestionTemp = [];
    widget.questionsModel.questionDetails!.studentMatchingChoice!
        .forEach((element) {
      QuestionData? question;
      AnswerData? answer;
      colorResult.add(ColorManager.green);
      question = leftSelectQuestion
          .firstWhere((q) => q.questionModel.id == element.leftSideId);
      answer = rightSelectAnswers
          .firstWhere((q) => q.answerData.id == element.rightSideId);
      leftSelectQuestionTemp
          .add(QuestionData(answer.answerData, question.questionModel));
    });

    setState(() => leftSelectQuestion = leftSelectQuestionTemp);
    rightSelectAnswers.forEach((element) => element.isExist = false);
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);

    _examViewModel.getUserId();
    insertList();
    if (widget.isSolved &&
        widget.questionsModel.questionDetailsResults!.studentMatchingChoice![0]
                .questionDetLeftSideId !=
            0 &&
        widget.questionsModel.questionDetailsResults!.studentMatchingChoice![0]
                .questionDetRightSideId !=
            0) {
      if (widget.isSolved) {
        _connectRightAndLeftSide();
      }
    }
    if (!widget.isSolved && widget.isSumbittedBefore) {
      _submittedData();
    }

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
            padding: EdgeInsets.only(
              left: AppPadding.p7.w,
              right: AppPadding.p7.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s5.w)
                      .copyWith(bottom: AppSize.s3.h),
                  child: Text(
                    LocaleKeys.matchRightColumn.tr(),
                    style: getMediumDINNextStyle(
                        color: ColorManager.white, fontSize: AppSize.s20),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (widget.isSolved)
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s20),
                        color: ColorManager.newWidget,
                      ),
                      height: AppSize.s7.h,
                      width: double.infinity,
                      child: TabBar(
                        controller: _tabController,
                        padding: const EdgeInsets.all(0.0),
                        onTap: (value) {
                          setState(() => selectedTabViewIndex = value);
                          print(value);
                          if (value == 0) {
                            print('Your answerrr');
                            _connectRightAndLeftSide();
                          } else {
                            print('Correct Answer ');
                            _connectCorrectAnswers();
                          }
                        },
                        tabs: [
                          if (!isAllResultTrue &&
                              widget
                                      .questionsModel
                                      .questionDetailsResults!
                                      .studentMatchingChoice![0]
                                      .questionDetLeftSideId !=
                                  0 &&
                              widget
                                      .questionsModel
                                      .questionDetailsResults!
                                      .studentMatchingChoice![0]
                                      .questionDetRightSideId !=
                                  0)
                            Tab(
                                child: selectedTabViewIndex == 0
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: ColorManager.dark,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            //  vertical: AppSize.s05.h,
                                            horizontal: AppSize.s1_5.h),
                                        child: Text(LocaleKeys.yourAnswer.tr()),
                                      )
                                    : Text(LocaleKeys.yourAnswer.tr())),
                          if (!isAllResultTrue &&
                              widget
                                      .questionsModel
                                      .questionDetailsResults!
                                      .studentMatchingChoice![0]
                                      .questionDetLeftSideId ==
                                  0 &&
                              widget
                                      .questionsModel
                                      .questionDetailsResults!
                                      .studentMatchingChoice![0]
                                      .questionDetRightSideId ==
                                  0)
                            Tab(
                                child: Container(
                              decoration: BoxDecoration(
                                color: ColorManager.dark,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  //  vertical: AppSize.s05.h,
                                  horizontal: AppSize.s1_5.h),
                              child: Text(
                                LocaleKeys.notAnswerYet.tr(),
                                style: TextStyle(color: ColorManager.red),
                              ),
                            )),
                          if (!isAllResultTrue &&
                              widget
                                      .questionsModel
                                      .questionDetailsResults!
                                      .studentMatchingChoice![0]
                                      .questionDetLeftSideId !=
                                  0 &&
                              widget
                                      .questionsModel
                                      .questionDetailsResults!
                                      .studentMatchingChoice![0]
                                      .questionDetRightSideId !=
                                  0)
                            Tab(
                              child: selectedTabViewIndex == 1
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: ColorManager.dark,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          // vertical: AppSize.s0.h,
                                          horizontal: AppSize.s1_5.h),
                                      child:
                                          Text(LocaleKeys.correctAnswer.tr()),
                                    )
                                  : Text(LocaleKeys.correctAnswer.tr()),
                            ),
                        ],
                        labelColor: ColorManager.maize,
                        labelStyle: getRegularDINNextStyle(
                            color: ColorManager.maize,
                            fontSize: AppSize.s16.sp),
                        unselectedLabelColor: ColorManager.green,
                        unselectedLabelStyle: getRegularDINNextStyle(
                            color: ColorManager.green,
                            fontSize: AppSize.s16.sp),
                        indicator: const BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.transparent, width: 0),
                          ),
                        ),
                      )),
                if (widget.isSolved)
                  SizedBox(
                    height: AppSize.s2.h,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: MatchingWidget(
                        setStateRemove: () => setState(() {}),
                        answersData: rightSelectAnswers,
                        questionData: leftSelectQuestion,
                        titleAnswers:
                            !widget.isSolved && selectedTabViewIndex == 0
                                ? LocaleKeys.leftM.tr()
                                : (widget.isSolved &&
                                        widget.isSolved &&
                                        widget
                                                .questionsModel
                                                .questionDetailsResults!
                                                .studentMatchingChoice![0]
                                                .questionDetLeftSideId ==
                                            0 &&
                                        widget
                                                .questionsModel
                                                .questionDetailsResults!
                                                .studentMatchingChoice![0]
                                                .questionDetRightSideId ==
                                            0)
                                    ? LocaleKeys.leftM.tr()
                                    : '',
                        titleColor: ColorManager.solarEnergyDark,
                        height:widget.isSolved? AppSize.s40.h :  AppSize.s45.h,
                        result: colorResult,
                        isRight: false,
                        isSolved: widget.isSolved,
                        onAccept: (GlobalLeftAndRightSideMatchingModel question,
                            GlobalLeftAndRightSideMatchingModel? answer) {
                          // submit history when drag answer
                          _examViewModel.submitSingleQuestionMatchingHistory(
                              question.questionId,
                              question.id,
                              answer!.id,
                              widget.examId);

                          /// refresh adding and removing items from widget
                          setState(() {});
                        },
                        solvedExamButNotSubmitted: widget.isSolved && widget.isSolved && widget.questionsModel.questionDetailsResults!.studentMatchingChoice![0].questionDetLeftSideId ==0 && widget.questionsModel.questionDetailsResults!.studentMatchingChoice![0].questionDetRightSideId == 0?ColorManager.gray : null,
                      ),
                    ),
                    if (!widget.isSolved && selectedTabViewIndex == 0)
                      SizedBox(
                        width: AppSize.s2.w,
                      ),
                    if (!widget.isSolved && selectedTabViewIndex == 0)
                      Expanded(
                        flex: 2,
                        child: DragTarget<RightSideMatchingModel>(
                          builder: (context, candidateData, rejectedData) =>
                              MatchingWidget(
                            answersData: rightSelectAnswers,
                            titleAnswers: LocaleKeys.right.tr(),
                                height:widget.isSolved? AppSize.s40.h :  AppSize.s45.h,
                            isSolved: widget.isSolved,
                            titleColor: ColorManager.liliac,
                            isRight: true,
                            onAccept: (GlobalLeftAndRightSideMatchingModel
                                    question,
                                GlobalLeftAndRightSideMatchingModel? answer) {
                              /// refresh adding and removing items from widget
                              setState(() {});
                            },
                          ),
                          onWillAccept: (data) =>
                              widget.isSolved ? false : true,
                          onAccept: (data) {
                            setState(() {
                              for (int n = 0;
                                  n < rightSelectAnswers.length;
                                  n++) {
                                if (rightSelectAnswers[n].answerData.id ==
                                        data.id &&
                                    rightSelectAnswers[n].isExist == false) {
                                  rightSelectAnswers[n].isExist = true;

                                  // remove answer from question
                                  leftSelectQuestion[n].answer = null;
                                }
                              }
                            });
                          },
                        ),
                      ),
                    if (widget.isSolved &&
                        widget
                                .questionsModel
                                .questionDetailsResults!
                                .studentMatchingChoice![0]
                                .questionDetLeftSideId ==
                            0 &&
                        widget
                                .questionsModel
                                .questionDetailsResults!
                                .studentMatchingChoice![0]
                                .questionDetRightSideId ==
                            0)
                      SizedBox(
                        width: AppSize.s2.w,
                      ),
                    if (widget.isSolved && widget.isSolved && widget.questionsModel.questionDetailsResults!.studentMatchingChoice![0].questionDetLeftSideId ==0 && widget.questionsModel.questionDetailsResults!.studentMatchingChoice![0].questionDetRightSideId == 0)
                      Expanded(
                        flex: 3,
                        child:MatchingWidget(
                          solvedExamButNotSubmitted: ColorManager.gray,
                          answersData: rightSelectAnswers,
                          titleAnswers: LocaleKeys.right.tr(),
                          height: AppSize.s40.h,
                          isSolved: widget.isSolved,
                          titleColor: ColorManager.liliac,
                          isRight: true,
                          onAccept: (GlobalLeftAndRightSideMatchingModel
                          question,
                              GlobalLeftAndRightSideMatchingModel? answer) {
                            /// refresh adding and removing items from widget
                            setState(() {});
                          },
                        )
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: (widget.isSolved &&
              widget.index != widget.numberOfAllQuestions - 1)
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p6.w,
                vertical: AppPadding.p3.h,
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
            )
          : Container(
              color: ColorManager.dark,
              padding: EdgeInsets.only(
                left: AppSize.s10.w,
                right: AppSize.s10.w,
                bottom: AppSize.s5.h,
              ),
              child: Visibility(
                visible: !widget.isSolved,
                child: CustomButtonWidget(
                  onTap: !widget.isSolved
                      ? () {
                          if (!widget.isSolved) {
                            //  _examViewModel.allQuestAnswers[widget.index] = true;
                            // print('tesssssssssssst ${_examViewModel.allQuestAnswers.toString()}');

                            /// collect answer and question
                            List<MatchingAnswers> matchingAnswers = [];

                            /// set the question is solved
                            ExamView.allQuestAnswers[widget.index] = true;
                            print('${ExamView.allQuestAnswers}');

                            leftSelectQuestion.forEach((element) {
                              matchingAnswers.add(MatchingAnswers(
                                  leftSideId: element.questionModel.id,
                                  rightSideId: element.answer!.id));
                            });

                            _examViewModel.submitSingleQuestionMatching(
                                leftSelectQuestion[0].questionModel.questionId,
                                matchingAnswers,
                                widget.examId);
                            widget.pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.bounceInOut);
                          }
                        }
                      : null,
                  shadowColor: ColorManager.terracota,
                  borderColor: ColorManager.terracota,
                  backGroundColor: ColorManager.terracota,
                  title: widget.index == widget.numberOfAllQuestions - 1
                      ? LocaleKeys.confirmAnswer.tr()
                      : LocaleKeys.check.tr(),
                  textColor: ColorManager.white,
                ),
              ),
            ),
    );
  }
}

class QuestionData {
  GlobalLeftAndRightSideMatchingModel? answer;
  GlobalLeftAndRightSideMatchingModel questionModel;

  QuestionData(this.answer, this.questionModel);
}

class AnswerData {
  bool isExist;
  GlobalLeftAndRightSideMatchingModel answerData;

  AnswerData(this.isExist, this.answerData);
}
