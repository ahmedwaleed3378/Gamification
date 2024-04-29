import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/presentation/exam/view/exam_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:gamification/app/constants.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';

import '../../../app/di.dart';
import '../../../app/functions.dart';
import '../../../generated/locale_keys.g.dart';
import '../../widget/custom_button.dart';
import '../viewmodel/exam_viewmodel.dart';

class McqView extends StatefulWidget {
  const McqView({
    Key? key,
    required this.questionsModel,
    required this.index,
    required this.examId,
    required this.examName,
    required this.pageController,
    required this.isSolved,
    required this.studentChoice,
    required this.rightAnswer,
    this.studentAnswer,
    required this.numberOfAllQuestions,
  }) : super(key: key);
  final PageController pageController;
  final QuestionsModel questionsModel;
  final int rightAnswer;
  final int studentChoice;
  final int? studentAnswer;
  final String examName;
  final bool isSolved;
  final int examId;
  final int index;
  final int numberOfAllQuestions;

  @override
  State<McqView> createState() => _McqViewState();
}

class _McqViewState extends State<McqView> {
  int selectedAnswer = -1;
  int studentAnswer = 0;
  int rightChoice = -1;
  final ExamViewModel _examViewModel = instance<ExamViewModel>();

  int currentIndexQuestion = 0;
  int numberOfQuestions = 0;

  int? selectedQuestionId;
  int? selectedAnswerId;
  String startTime = "";

  void getStudentChoice() {
    studentAnswer = widget.questionsModel.mcq!.indexWhere(
      (element) {
        return widget.studentChoice == element.id;
      },
    );
  }

  void getRightChoice() {
    if (widget.isSolved) {
      rightChoice = widget.questionsModel.mcq!.indexWhere(
        (element) {
          return widget.rightAnswer == element.id;
        },
      );
    }
  }

  @override
  void initState() {
    _examViewModel.setIsMarke(widget.isSolved);
    getStudentChoice();

    log(widget.rightAnswer.toString());
    log(studentAnswer.toString());
    getRightChoice();
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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p4.w,
                vertical: AppPadding.p1.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.s5.w)
                        .copyWith(bottom: AppSize.s1.h),
                    child: Text(
                      LocaleKeys.chooseTheCorrectAnswer.tr(),
                      style: getMediumDINNextStyle(
                          color: ColorManager.white, fontSize: AppSize.s20),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: AppSize.s1.h, horizontal: AppSize.s2.w),
                    child: Column(
                      children: [
                        Container(
                          // height: AppSize.s21.h,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p4.w,
                              vertical: AppPadding.p2.h),
                          decoration: BoxDecoration(
                            color: ColorManager.newWidget,
                            borderRadius: BorderRadius.circular(AppSize.s14),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.isSolved
                                  ? widget
                                      .questionsModel
                                      .questionDetailsResults!
                                      .questionText
                                      .isNotEmpty
                                  : widget.questionsModel.questionDetails!
                                      .questionText.isNotEmpty)
                                Align(
                                  alignment: containsArabicLetter(
                                          widget.isSolved
                                              ? widget
                                                  .questionsModel
                                                  .questionDetailsResults!
                                                  .questionText
                                                  .split('')
                                              : widget.questionsModel
                                                  .questionDetails!.questionText
                                                  .split(''))
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Text(
                                    widget.isSolved
                                        ? widget
                                            .questionsModel
                                            .questionDetailsResults!
                                            .questionText
                                        : widget.questionsModel.questionDetails!
                                            .questionText,
                                    style: getMediumDINNextStyle(
                                      color: ColorManager.lightBlue,
                                      fontSize: AppSize.s20,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              SizedBox(height: AppSize.s2.h),
                              if (widget.isSolved
                                  ? widget
                                      .questionsModel
                                      .questionDetailsResults!
                                      .questionText
                                      .isNotEmpty
                                  : widget.questionsModel.questionDetails!
                                      .questionText.isNotEmpty)
                                CachedNetworkImage(
                                    imageUrl:
                                        '${Constants.baseUrl.substring(0, Constants.baseUrl.length - 1)}${widget.isSolved ? widget.questionsModel.questionDetailsResults!.questionAttach : widget.questionsModel.questionDetails!.questionAttach}',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s5),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                    errorWidget: (context, url, error) =>
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              AppSize.s15),
                                          child: Image.asset(
                                            ImageAssets.errorImage,
                                            width: double.infinity,
                                            height: AppSize.s12.h,
                                            fit: BoxFit.fill,
                                          ),
                                        )),
                              // Container(
                              //   width: AppSize.s30.h,
                              //   height: AppSize.s12.h,
                              //   decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //       onError: (exception, stackTrace) =>
                              //           Image.asset(
                              //         ImageAssets.errorImage,
                              //         width: AppSize.s30.h,
                              //         height: AppSize.s12.h,
                              //         fit: BoxFit.cover,
                              //       ),
                              //       fit: BoxFit.fitWidth,
                              //       image: NetworkImage(
                              //           '${Constants.baseUrl.substring(0, Constants.baseUrl.length - 1)}${widget.isSolved ? widget.questionsModel.questionDetailsResults!.questionAttach : widget.questionsModel.questionDetails!.questionAttach}'),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        if(widget.isSolved &&widget.questionsModel.questionDetailsResults!.studentChoice!.studentChoiceId == 0)
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
                        SizedBox(height: AppSize.s1.h),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: widget.questionsModel.mcq!.length,
                          itemBuilder: (context, index) {
                            Color? errorColor;
                            if (widget.isSolved) {
                              if (widget.questionsModel.questionDetailsResults!
                                          .studentChoice!.studentChoiceId ==
                                      widget.questionsModel.mcq![index].id &&
                                  widget.questionsModel.mcq![index].isCorrect ==
                                      false) {
                                errorColor = ColorManager.red;
                              }
                            }
                            Color color = ColorManager.secondaryText;
                            Color textColor = ColorManager.white;

                            if (_examViewModel.isMarked) {
                              //student answer

                              if (index == studentAnswer) {
                                //student answer in unsubmitted exam

                                color = ColorManager.red;
                                textColor = ColorManager.red;

                                //student answer in submitted exam
                                if (rightChoice == index && widget.isSolved) {
                                  color = ColorManager.correctGreen;
                                  textColor = ColorManager.correctGreen;
                                }
                              }

                              //    right answer in submitted exam
                              if (index == (widget.rightAnswer)) {
                                color = ColorManager.correctGreen;
                                textColor = ColorManager.correctGreen;
                              }
                            } else {
                              if (widget.studentChoice != 0 &&
                                  index == studentAnswer) {
                                color = ColorManager.blue;
                                textColor = ColorManager.blue;
                              }
                            }

                            return InkWell(
                              onTap: _examViewModel.isMarked == false
                                  ? () {
                                      setState(() {
                                        selectedAnswer = index;
                                        selectedQuestionId = widget
                                            .questionsModel
                                            .mcq![index]
                                            .questionId;
                                        selectedAnswerId = widget
                                            .questionsModel.mcq![index].id;
                                        //textColor=ColorManager.white30;
                                      });
                                    }
                                  : null,
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: AppMargin.m05.h),
                                    decoration: BoxDecoration(
                                       color: errorColor != null
                                        ? errorColor
                                        : _examViewModel.isMarked
                                            ? textColor ==
                                                    ColorManager.correctGreen
                                                ? ColorManager.correctGreen
                                                : color
                                            : selectedAnswer == index
                                                ? ColorManager.blue
                                                : ColorManager.white30,
                            
                                      borderRadius: BorderRadius.circular(
                                        AppSize.s14,
                                      ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorManager.steel50, 
                                        offset: Offset(0, AppSize.s03.h),
                                        spreadRadius: AppSize.s1
                                      )
                                    ]
                                    ),
                                   
                                   
                                    child: Card(
                                      margin: EdgeInsets.only(
                                        top: AppPadding.p02.h,
                                        bottom: AppPadding.p04.h,
                                        right: AppPadding.p05.w,
                                        left: AppPadding.p05.w,
                                      ),
                                      color: ColorManager.dark.withOpacity(0.8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s14,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: AppPadding.p1_7.h,
                                          horizontal: AppPadding.p2.w,
                                        ),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            widget.questionsModel.mcq![index]
                                                .mcqText,
                                            style: getRegularDINNextStyle(
                                              color: errorColor != null
                                                  ? errorColor
                                                  : textColor,
                                              fontSize: AppSize.s18.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  (_examViewModel.isMarked)
                                      ? color == ColorManager.correctGreen ||
                                              textColor ==
                                                  ColorManager.correctGreen
                                          ? Positioned(
                                              right: AppSize.s02.w,
                                              bottom: 0,
                                              child: Container(
                                                padding: EdgeInsets.all(
                                                    AppPadding.p1.w),
                                                decoration: BoxDecoration(
                                                    color: ColorManager
                                                        .correctGreen,
                                                    shape: BoxShape.circle),
                                                child: Icon(
                                                  Icons.done,
                                                  size: AppSize.s4.w,
                                                  color: ColorManager.white,
                                                ),
                                              ),
                                            )
                                          : (color == ColorManager.red
                                              ? Positioned(
                                                  right: AppSize.s02.w,
                                                  bottom: 0,
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                        AppPadding.p1.w),
                                                    decoration: BoxDecoration(
                                                        color: ColorManager.red,
                                                        shape: BoxShape.circle),
                                                    child: Icon(
                                                      Icons.close,
                                                      size: AppSize.s4.w,
                                                      color: ColorManager.white,
                                                    ),
                                                  ),
                                                )
                                              : Container())
                                      : Container()
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: AppSize.s07.h);
                          },
                        ),
                      ],
                    ),
                  ),
            if(widget.isSolved && widget.index != widget.numberOfAllQuestions - 1)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p6.w,
                  vertical: AppPadding.p3.h,
                ),
                child: CustomButtonWidget(
                  onTap: (){
                    widget.pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.bounceIn);
                  },
                  height: AppSize.s7.h,
                  shadowColor:  ColorManager.terracota,
                  borderColor:  ColorManager.terracota,
                  backGroundColor:  ColorManager.terracota,
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p6.w,
                        vertical: AppPadding.p3.h,
                      ),
                      child: CustomButtonWidget(
                        onTap: !widget.isSolved
                            ? () async {
                                if (selectedAnswer != -1) {
                                  //  _examViewModel.allQuestAnswers[widget.index] = true;
                                  // log(widget.examId.toString() + ' in mcq view');

                                  /// set the question is solved
                                  ExamView.allQuestAnswers[widget.index] = true;
                                  print('${ExamView.allQuestAnswers}');

                                  await _examViewModel.submitMCQSingleQuestion(
                                      widget.examId,
                                      selectedAnswerId!,
                                      selectedQuestionId!,
                                      currentIndexQuestion,
                                      widget.pageController,
                                      selectedAnswer);
                                  studentAnswer = selectedAnswer;
                                  await _examViewModel
                                      .submitMCQSingleQuestionHistory(
                                          widget.examId,
                                          selectedAnswerId!,
                                          selectedQuestionId!);
                                  widget.pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.bounceInOut);

                                  setState(() => selectedAnswer = -1);
                                }
                              }
                            : null,
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
                        title: widget.index == widget.numberOfAllQuestions - 1
                            ? LocaleKeys.confirmAnswer.tr()
                            : LocaleKeys.check.tr(),
                        style: getMediumDINNextStyle(
                          color: selectedAnswer != -1
                              ? ColorManager.white
                              : ColorManager.dark,
                          fontSize: AppSize.s26,
                        ),
                        textColor: ColorManager.dark,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
