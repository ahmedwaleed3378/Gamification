import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/domain/model/exam/exam_result_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/exam/components/complete_view.dart';
import 'package:gamification/presentation/exam/components/empty_exam_dialog.dart';
import 'package:gamification/presentation/exam/components/letters_collections.dart';
import 'package:gamification/presentation/exam/components/matching.dart';
import 'package:gamification/presentation/exam/components/mcq.dart';
import 'package:gamification/presentation/exam/components/pull_container.dart';
import 'package:gamification/presentation/exam/components/translate_sentence.dart';
import 'package:gamification/presentation/exam/view/exam_timer.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/pass_test/view/pass_test_view.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../app/functions.dart';
import '../../resources/routes_manager.dart';

class ExamView extends StatefulWidget {
  static double solvedLinearPercent = 0;
  final int examId;
  final String subjectName;
  static List<bool> allQuestAnswers = [];
 // final MapViewModel mapViewModel;
  const ExamView({
    Key? key,
    required this.examId,
    required this.subjectName,
    // required this.mapViewModel,
  }) : super(key: key);

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  final ExamViewModel _examViewModel = instance<ExamViewModel>();
  final scrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  int numberOfPages = 0;
  int currentPageIndex = 0;
  int currentQuestionIndex = 1;
  var pageController = PageController(initialPage: 0);
  List<int> leftQuestions = [];

  _bind() {
    log(widget.examId.toString());

    _examViewModel.setExamId(widget.examId);
    _examViewModel.start();
  }

  int subjectId = 0;

  @override
  void initState() {
    _bind();
    _examViewModel.submitQuestionController.stream.listen((isSubmitted) {
      if (isSubmitted) {
        SchedulerBinding.instance.addPostFrameCallback((_) async {
          // navigate to main screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => PassTestView(
                subjectId: subjectId,
                examViewModel: _examViewModel,
                examId: widget.examId,
                subjectName: widget.subjectName,
                passed: true,
                // mapViewModel: widget.mapViewModel,
              ),
            ),
          );
        });
      }
    });
    // ExamView.allQuestAnswers = List<bool>.generate(2, (i) => false);

    super.initState();
  }

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
  void dispose() {
    ExamView.solvedLinearPercent = 0;
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async{
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorManager.dark,
        body: StreamBuilder<FlowState>(
          stream: _examViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                    context, _getContentWidget(size, context), () {
                  _examViewModel.start();
                }) ??
                _getContentWidget(size, context);
          },
        ),
      ),
    );
  }

  _getContentWidget(Size size, BuildContext context) {
    return StreamBuilder<ExamDetailsModel>(
      stream: _examViewModel.outputExamDetails,
      builder: (context, snapshot) {
        /// solved before
        if (snapshot.data == null) {
          return _progressLoading();
        } else if (snapshot.data?.returnValue == -5) {
          return StreamBuilder<ExamResultModel>(
            stream: _examViewModel.outputExamResult,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return _progressLoading();
              } else {
                var heads = snapshot.data!.item!.groups![0].heads!;

                return _examBody(heads, true, size,
                    snapshot.data!.item!.details!.examArName, '', context);
              }
            },
          );
        } else {
          numberOfPages =
              snapshot.data!.exam!.groups![0].heads![0].questions!.length;
          subjectId = snapshot.data!.mv!.studentId;

          /// check if exam haven't questions
          if (numberOfPages == 0) {
            return const EmptyExamDialog();
          } else {
            var heads = snapshot.data!.exam!.groups![0].heads!;
            String duration =
                snapshot.data!.exam!.details!.examPeriodMinute.toString();

            for (int i = 0; i < numberOfPages; i++) {
              ExamView.allQuestAnswers.add(false);
            }

            if (ExamView.allQuestAnswers.length > numberOfPages) {
              ExamView.allQuestAnswers.length -= numberOfPages;
            }

            print(ExamView.allQuestAnswers);

            return _examBody(
                heads,
                false,
                size,
                isCurrentLanguageEn(context)
                    ? snapshot.data!.exam!.details!.examArName
                    : snapshot.data!.exam!.details!.examArName,
                duration,
                context);
          }
        }
      },
    );
  }

  _refreshExamDetailsIfQuestionSolved(
      List<HeadsModel> headsModelList, int index) {
    var questionModel = headsModelList[0].questions![index].questionDetails!;
    if (questionModel.studentChoice != 0 ||
        questionModel.studentMatchingChoice!.isNotEmpty ||
        questionModel.studentCompleteChoice!.isNotEmpty ||
        questionModel.studentCompleteContainerChoice!.isNotEmpty ||
        questionModel.studentVoiceChoice.isNotEmpty ||
        questionModel.studentTranslateChoice.isNotEmpty) {
      _examViewModel.examDetails(id: widget.examId);
    }
  }

  _examBody(List<HeadsModel> headsModelList, bool isSolved, Size size,
      String examName, String duration, BuildContext context) {
    numberOfPages = headsModelList[0].questions!.length;

    return WillPopScope(
      onWillPop: () async {
        _dialog(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorManager.dark,
        appBar: AppBar(
          toolbarHeight: size.height * 0.17,
          flexibleSpace: _topBar(
            examName,
            '',
            // headsModelList[0].headName,
            isSolved,
            duration,
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: SafeArea(
          child: PageView(
            controller: pageController,
            allowImplicitScrolling: false,
            pageSnapping: false,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              _examViewModel.examDetails(id: widget.examId);
              if (!isSolved) {
                _examViewModel.examDetails(id: widget.examId);
                _refreshExamDetailsIfQuestionSolved(headsModelList, index);
              }
              setState(() {
                currentQuestionIndex = index + 1;
              });
            },
            children: List<Widget>.generate(
              numberOfPages,
              (index) {
                int indexType = isSolved
                    ? headsModelList[0]
                        .questions![index]
                        .questionDetailsResults!
                        .questionTypeId
                    : headsModelList[0]
                        .questions![index]
                        .questionDetails!
                        .questionTypeId;

                switch (indexType) {
                  case 2:
                    int studentChoice = isSolved
                        ? headsModelList[0]
                            .questions![index]
                            .questionDetailsResults!
                            .studentChoice!
                            .studentChoiceId
                        : headsModelList[0]
                            .questions![index]
                            .questionDetails!
                            .studentChoice;
                    return McqView(
                      numberOfAllQuestions: numberOfPages,
                        index: index,
                        examId: widget.examId,
                        pageController: pageController,
                        questionsModel: headsModelList[0].questions![index],
                        examName: examName,
                        isSolved: isSolved,
                        studentChoice: studentChoice,
                        rightAnswer:
                            headsModelList[0].questions![index].mcq!.indexWhere(
                          (element) {
                            return element.isCorrect;
                          },
                        ),
                        studentAnswer: isSolved
                            ? headsModelList[0]
                                .questions![index]
                                .questionDetailsResults!
                                .studentChoice!
                                .id
                            : headsModelList[0]
                                .questions![index]
                                .questionDetails
                                ?.studentChoice);
                  case 3:
                    List<StudentMatchingChoiceModel>? studentMatchingChoice =
                        [];
                    if (isSolved) {
                      for (var element in headsModelList[0]
                          .questions![index]
                          .questionDetailsResults!
                          .studentMatchingChoice!) {
                        studentMatchingChoice.add(
                          StudentMatchingChoiceModel(
                              element.questionDetRightSideId,
                              element.questionDetLeftSideId),
                        );
                      }
                    } else {
                      if (headsModelList[0]
                          .questions![index]
                          .questionDetails!
                          .studentMatchingChoice!
                          .isNotEmpty) {
                        headsModelList[0]
                            .questions![index]
                            .questionDetails!
                            .studentMatchingChoice!
                            .forEach((element) {
                          studentMatchingChoice.add(
                            StudentMatchingChoiceModel(
                                element.rightSideId, element.leftSideId),
                          );
                        });
                      }
                    }
                    return MatchingView(
                      index: index,
                      studentMatchingChoice: studentMatchingChoice,
                      matcingQuestionModel:
                          headsModelList[0].questions![index].matchingQuestion!,
                      isSolved: isSolved,
                      questionsModel: headsModelList[0].questions![index],
                      pageController: pageController,
                      isSumbittedBefore:
                          studentMatchingChoice.isEmpty ? false : true,
                      examId: widget.examId,
                      numberOfAllQuestions: numberOfPages,
                    );
                  case 4:
                    return CompleteView(
                      isSolved: isSolved,
                      index: index,
                      questionsModel: headsModelList[0].questions![index],
                      pageController: pageController,
                      examId: widget.examId,
                      numberOfAllQuestions: numberOfPages,
                    );
                  case 5:
                    return PullContainerView(
                      index,
                      isSolved,
                      headsModelList[0].questions![index],
                      headsModelList[0]
                              .questions![index]
                              .questionDetailsResults
                              ?.studentCompleteContainerChoice ??
                          [],
                      pageController,
                      widget.examId,
                      numberOfPages,
                    );
                  case 6:
                    bool isSubmittedBefore = false;
                    if (!isSolved) {
                      isSubmittedBefore = true;
                    }
                    return LettersCollectionsView(
                      index: index,
                      examId: widget.examId,
                      isSolved: isSolved,
                      questionsModel: headsModelList[0].questions![index],
                      pageController: pageController,
                      isSubmittedBefore: isSubmittedBefore,
                      numberOfAllQuestions: numberOfPages,
                    );
                  case 7:
                    return TranslateSentenceView(
                      index: index,
                      isSolved: isSolved,
                      questionsModel: headsModelList[0].questions![index],
                      pageController: pageController,
                      examId: widget.examId,
                      numberOfAllQuestions: numberOfPages,
                    );
                  default:
                    return Center(
                      child: Text(LocaleKeys.defaultWord.tr()),
                    );
                }
              },
            ),
          ),
        ),
        bottomNavigationBar: Visibility(
          visible: currentQuestionIndex == numberOfPages,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p16.w,
              vertical: AppPadding.p3.h,
            ),
            child: CustomButtonWidget(
              onTap: () async {
                if(isSolved){
                  _dialog(context);
                }else{
                  print('=======00');
                  for(bool b in _examViewModel.allQuestAnswers){
                    print(b);
                  }

                  submitExam(isSolved, context, () {
                    _dialog(context);
                  }, leftQuestions, true, _examViewModel, pageController);
                }
              },
              height: AppSize.s7.h,
              shadowColor: ColorManager.terracota,
              borderColor: ColorManager.terracota,
              backGroundColor: ColorManager.terracota,
              title:
                  isSolved ? LocaleKeys.back.tr() : LocaleKeys.submitAll.tr(),
              style: getMediumDINNextStyle(
                color: ColorManager.white,
                fontSize: AppSize.s26,
              ),
              textColor: ColorManager.dark,
            ),
          ),
        ),
      ),
    );
  }

  _topBar(String examName, String headName, bool isSolved, String duration) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.s1.h),
        child: Column(
          children: [
            SizedBox(height: AppSize.s2.h),
            Row(
              children: [
                SvgPicture.asset(
                  ImageAssets.arabicSubject,
                ),
                SizedBox(width: AppSize.s3.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppSize.s45.w,
                      child: Text(
                        examName,
                        style: getSemiBoldSFProDisplayCStyle(
                          color: ColorManager.terracota,
                          fontSize: AppSize.s19.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: AppSize.s1.h),
                    Text(
                      widget.subjectName,
                      style: getSemiBoldSFProDisplayCStyle(
                        color: ColorManager.greenishTeal,
                        fontSize: AppSize.s18.sp,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ExamTimer(
                  timerText: duration,
                  isResult: isSolved,
                  examViewModel: _examViewModel,
                )
              ],
            ),
            SizedBox(height: AppSize.s0.h),
            SizedBox(
              // height: AppSize.s1.h,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color:currentQuestionIndex == 1? ColorManager.terracota.withOpacity(.5): ColorManager.terracota,
                    ),
                    onPressed: () {
                      if (currentQuestionIndex == 1) {
                      } else {
                        setState(() {
                          currentQuestionIndex -= 1;
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.bounceInOut,
                          );
                        });
                      }
                    },
                  ),
                  SizedBox(width: AppSize.s6.w),
                  Expanded(
                    child: SizedBox(
                      height: AppSize.s1.h,
                      child: ListView.builder(
                        itemCount: numberOfPages,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: AppMargin.m1.w),
                            width: AppSize.s10.w,
                            height: AppSize.s4.h,
                            decoration: BoxDecoration(
                              color: index < currentQuestionIndex
                                  ? ColorManager.terracota
                                  : ColorManager.terracota.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(AppSize.s14),
                              boxShadow: [
                                index + 1 == currentQuestionIndex
                                    ? BoxShadow(
                                        color: ColorManager.terracota,
                                        blurRadius: 30,
                                        spreadRadius: 0.5,
                                        blurStyle: BlurStyle.outer,
                                      )
                                    : const BoxShadow(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.s6.w),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color:currentQuestionIndex == numberOfPages?ColorManager.terracota.withOpacity(.5): ColorManager.terracota,
                    ),
                    onPressed: () {
                      if (currentQuestionIndex == numberOfPages) {
                      } else {
                        setState(() {
                          currentQuestionIndex += 1;
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.bounceInOut,
                          );
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            // SizedBox(height: AppSize.s1.h),
            // Text(
            //   headName,
            //   maxLines: 1,
            //   overflow: TextOverflow.ellipsis,
            //   style: getMediumDINNextStyle(
            //     color: ColorManager.white,
            //     fontSize: FontSize.s18.sp,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  _dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s20),
          ),
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p4.w,
                      // vertical: AppPadding.p2.h,
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
                        SizedBox(height: AppSize.s2.h),
                        Card(
                          color: ColorManager.offWhite.withOpacity(0.15),
                          elevation: AppSize.s5,
                          shadowColor: ColorManager.dark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: AppPadding.p2_5.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImageAssets.flashPurpleIcon,
                                ),
                                SizedBox(width: AppSize.s4.w),
                                Expanded(
                                  child: Text(
                                    LocaleKeys.areYouSureLeaveExam.tr(),
                                    style: getMediumMPLUSRounded1CStyle(
                                      color: ColorManager.lightBlue,
                                      fontSize: AppSize.s18.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.s7.h),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.s17.h),
                ],
              ),
              Positioned(
                top: AppPadding.p20.h,
                right: AppPadding.p10.w,
                left: AppPadding.p10.w,
                child: Column(
                  children: [
                    CustomButtonWidget(
                      onTap: () {
                        // Navigator.of(context)
                        //     .pushReplacementNamed(Routes.homeRoute);
                        Navigator.of(context)
                          ..pop()
                          ..pop()
                          ..pop();
                      },
                      shadowColor: ColorManager.terracota,
                      borderColor: ColorManager.terracota,
                      backGroundColor: ColorManager.terracota,
                      title: LocaleKeys.yes.tr(),
                      height: AppSize.s7.h,
                      textColor: ColorManager.dark,
                      style: getMediumDINNextStyle(
                        color: ColorManager.white,
                        fontSize: AppSize.s21.sp,
                      ),
                    ),
                    SizedBox(height: AppSize.s2.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p7.w,
                      ),
                      child: CustomButtonWidget(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        shadowColor: ColorManager.charcoalGrey1,
                        borderColor: ColorManager.charcoalGrey1,
                        backGroundColor: ColorManager.charcoalGrey1,
                        title: LocaleKeys.no.tr(),
                        height: AppSize.s7.h,
                        textColor: ColorManager.white,
                        style: getMediumDINNextStyle(
                          color: ColorManager.white,
                          fontSize: AppSize.s21.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.s3.h),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
