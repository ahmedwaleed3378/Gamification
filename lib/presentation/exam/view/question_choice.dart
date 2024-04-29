import 'package:flutter/material.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:group_button/group_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class QuestionChoices extends StatefulWidget {
  final List<String> choicesText;
  final ExamViewModel examViewModel;
  final QuestionsModel question;
  final NumberPaginatorController paginatorController;
  final int numberOfPages;
  final int index;
  final ItemScrollController scrollController;
  final bool showButtonGroup;

  const QuestionChoices(
      {Key? key,
      required this.choicesText,
      required this.examViewModel,
      required this.question,
      required this.paginatorController,
      required this.numberOfPages,
      required this.index,
      required this.scrollController,
      required this.showButtonGroup})
      : super(key: key);

  @override
  State<QuestionChoices> createState() => _QuestionChoicesState();
}

class _QuestionChoicesState extends State<QuestionChoices> {
  late GroupButtonController _radioController;
  int currentChoiceIndex = -1;
  bool isSingleQuestionSubmit = false;
  String selectedAnswer = '';

  @override
  void initState() {
    _radioController = GroupButtonController(
      onDisablePressed: (index) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose answer')),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: widget.examViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                Navigator.of(context).pushNamed(Routes.examRoute);
              }) ??
              _getContentWidget();
        });
  }

  _getContentWidget() {
    return Column(
      children: [
       widget.showButtonGroup ? Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s4.h),
          child: Center(
            child: GroupButton(
              controller: _radioController,
              options: GroupButtonOptions(
                selectedShadow: const [],
                selectedTextStyle: TextStyle(
                  fontSize: 20,
                  color: ColorManager.white,
                ),
                selectedColor: ColorManager.black02,
                unselectedShadow: const [],
                unselectedColor: ColorManager.lightBlue,
                unselectedTextStyle: TextStyle(
                  fontSize: 20,
                  color: ColorManager.black,
                ),
                selectedBorderColor: ColorManager.cobalt,
                unselectedBorderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(AppSize.s16),
                spacing: AppSize.s1.h,
                runSpacing: 10,
                groupingType: GroupingType.column,
                direction: Axis.horizontal,
                // buttonHeight: 60,
                buttonWidth: double.infinity,
                mainGroupAlignment: MainGroupAlignment.center,
                crossGroupAlignment: CrossGroupAlignment.center,
                groupRunAlignment: GroupRunAlignment.start,
                textAlign: TextAlign.center,
                textPadding: const EdgeInsets.all(AppSize.s10),
                alignment: Alignment.center,
                elevation: AppSize.s2,
              ),
              buttons: widget.choicesText,
              onSelected: (val, i, selected) {
                _radioController.selectIndex(i);
                setState(() {
                  currentChoiceIndex = i;
                });
              },
            ),
          ),
        ): Container(),
        SizedBox(
          height: AppSize.s1.h,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppSize.s3.h),
          decoration: BoxDecoration(
              color: isSingleQuestionSubmit
                  ? ColorManager.dark
                  : Colors.transparent,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(AppSize.s30),
                  topLeft: Radius.circular(AppSize.s30))),
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isSingleQuestionSubmit
                  ? SizedBox(
                      key: const Key("Next"),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: RichText(
                                  text: TextSpan(children: [
                                    WidgetSpan(
                                        child: Text(
                                      "The Selected Answer is ",
                                      style: getSemiBoldOpenSansStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s16.sp),
                                    )),
                                    WidgetSpan(
                                        child: Text(
                                      selectedAnswer,
                                      style: getSemiBoldOpenSansStyle(
                                          color: Colors.green,
                                          fontSize: AppSize.s16.sp),
                                    )),
                                    WidgetSpan(
                                      child: SizedBox(width: AppSize.s3.h),
                                    ),
                                  ]),
                                ),
                              ),
                              SizedBox(
                                height: AppSize.s3_5.h,
                                child: FloatingActionButton.small(
                                    tooltip: 'update Answer',
                                    onPressed: () {
                                      setState(() {
                                        /// update answer of question
                                        isSingleQuestionSubmit =
                                            !isSingleQuestionSubmit;
                                        selectedAnswer = '';
                                        _radioController.unselectAll();
                                        currentChoiceIndex = -1;

                                        /// set the question is not solved
                                        // ExamView.allQuestAnswers[widget.index] =
                                        //     false;
                                        // ExamView.solvedLinearPercent -= 1;
                                        //
                                        // print(
                                        //     'update ${ExamView.allQuestAnswers}');
                                        // print(
                                        //     'update ${ExamView.solvedLinearPercent}');
                                      });
                                    },
                                    child: Icon(
                                      MdiIcons.refresh,
                                      color: ColorManager.white,
                                      size: AppSize.s3.h,
                                      opticalSize: AppSize.s2.h,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(height: AppSize.s2.h),
                          SizedBox(
                            height: AppSize.s6.h,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isSingleQuestionSubmit
                                    ? ColorManager.dark
                                    : ColorManager.whiteTwo,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s12),
                                ),
                              ),
                              onPressed: currentChoiceIndex == -1
                                  ? null
                                  : () async {
                                      /// check if this is last question
                                      // if (widget.index !=
                                      //     (widget.numberOfPages - 1)) {
                                      //   widget.scrollController.scrollTo(
                                      //       index: widget.index + 1,
                                      //       duration:
                                      //           const Duration(seconds: 1),
                                      //       curve: Curves.easeIn,
                                      //       alignment: 0);
                                      // } else {
                                      //   if (ExamView.allQuestAnswers
                                      //       .contains(false)) {
                                      //     print('${ExamView.allQuestAnswers}');
                                      //     ScaffoldMessenger.of(context)
                                      //         .showSnackBar(const SnackBar(
                                      //             content: Text(
                                      //                 'There is q not solved')));
                                      //   } else {
                                      //     DateTime now = DateTime.now();
                                      //     String formattedTime =
                                      //         DateFormat('kk:mm:ss')
                                      //             .format(now);
                                      //     widget.examViewModel
                                      //         .submitExam(formattedTime);
                                      //     Navigator.pushReplacementNamed(
                                      //         context, Routes.examResultRoute,
                                      //         arguments: widget.examViewModel);
                                      //   }
                                      // }
                                    },
                              child: Text(
                                // widget.paginatorController.currentPage !=
                                //         (widget.numberOfPages - 1)
                                widget.index != (widget.numberOfPages - 1)
                                    ? 'Next'
                                    : 'Submit All Answers',
                                style: getSemiBoldOpenSansStyle(
                                    color: isSingleQuestionSubmit
                                        ? ColorManager.white
                                        : ColorManager.dark,
                                    fontSize: AppSize.s18.sp),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      height: AppSize.s6.h,
                      width: double.infinity,
                      key: const Key("Check"),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.whiteTwo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s12),
                          ),
                        ),
                        onPressed: currentChoiceIndex == -1
                            ? null
                            : () {
                                setState(() {
                                  /// show next button
                                  isSingleQuestionSubmit =
                                      !isSingleQuestionSubmit;
                                  selectedAnswer = widget.question
                                      .mcq![currentChoiceIndex].mcqText;

                                  /// set the question is solved
                                  // ExamView.allQuestAnswers[widget.index] = true;
                                  // print('${ExamView.allQuestAnswers}');
                                  //
                                  // ExamView.solvedLinearPercent += 1;
                                  // print(' ${ExamView.solvedLinearPercent}');
                                // });
                                // widget.examViewModel.submitSingleQuestion(
                                //     widget.question.mcq![currentChoiceIndex].id,
                                //     widget
                                //         .question.questionDetails!.questionId);
                              });},
                        child: Text(
                          'Check',
                          style: getSemiBoldOpenSansStyle(
                              color: ColorManager.dark,
                              fontSize: AppSize.s18.sp),
                        ),
                      ),
                    )),
        ),
      ],
    );
  }
}
