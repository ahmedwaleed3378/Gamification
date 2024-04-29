import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/functions.dart';
import 'package:gamification/presentation/exam/view/exam_view.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/empty_text_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class TranslateSentenceView extends StatefulWidget {
  const TranslateSentenceView({
    Key? key,
    required this.isSolved,
    required this.questionsModel,
    required this.pageController,
    required this.index,
    required this.examId, required this.numberOfAllQuestions,
  }) : super(key: key);

  final bool isSolved;
  final QuestionsModel questionsModel;
  final PageController pageController;
  final int index;
  final int examId;
  final int numberOfAllQuestions;
  @override
  State<TranslateSentenceView> createState() => _TranslateSentenceViewState();
}

class _TranslateSentenceViewState extends State<TranslateSentenceView> {
  int selectedAnswer = -1;

  final _unselectedListKey = GlobalKey<AnimatedGridState>();
  final _selectedListKey = GlobalKey<AnimatedGridState>();
  final ExamViewModel _examViewModel = instance<ExamViewModel>();

  List<String> selected = [];
  List<String> unSelected = [];
  List<String> studentChoice = [];
  bool correction = false;

  Artboard? riveArtBoard;
  late RiveAnimationController controllerRobot;
  bool voicePlay = false;
  int lettersIndex = -1;
  int selectedLettersIndex = -1;
  late AudioPlayer player;
  Color? solvedQuestionColor;
  List<String> correctAnswers = [];

  playAudio(String audioUrl, bool state) async {
    if (state) {
      await player.play(UrlSource(audioUrl));
    } else {
      await player.stop();
    }
  }

  @override
  void initState() {
    _examViewModel.getUserId();

    controllerRobot = SimpleAnimation('idle');
    rootBundle.load(RiveAssets.taslimaRobot).then((data) {
      try {
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        art.addController(controllerRobot);
        setState(() => riveArtBoard = art);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    player = AudioPlayer();
    player.onPlayerComplete.listen((event) {
      setState(() => voicePlay = false);
    });
    if (!widget.isSolved) {
      _studentAnswer();
    } else {
      selected = widget.questionsModel.questionDetailsResults!
          .studentTranslateChoice!.translateAnswerText
          .split(' ');

      /// not completed m
      widget.questionsModel.qTranslate!.questionTranslateAnswer!.answer!
          .forEach((element) {
        correctAnswers.add(element);
      });
      if (widget
          .questionsModel.questionDetailsResults!.studentTranslateChoice!.result
          .contains('f')) {
        correction = false;
        solvedQuestionColor = ColorManager.red;
      } else {
        correction = true;
        solvedQuestionColor = ColorManager.correctGreen;
      }
    }

    super.initState();
  }

  _studentAnswer() {
    print('----');
    widget.questionsModel.qTranslate!.questionTranslateAnswer!.answer!
        .forEach((element) {
      print(element);
      unSelected.add(element);
    });
    // if (widget.questionsModel.questionDetails!.studentTranslateChoice != '') {
    //   studentChoice = widget
    //       .questionsModel.questionDetails!.studentTranslateChoice
    //       .split(' ');
    //
    //   selected.addAll(studentChoice);
    //
    //   unSelected.removeWhere((element) => studentChoice.contains(element));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p4.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.translateThisSentence.tr(),
                style: getMediumDINNextStyle(
                  color: ColorManager.offWhite,
                  fontSize: AppSize.s22,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.s2_5.h),
              Container(
                height: AppSize.s28.h,
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
                    Row(
                      children: [
                        if(Functions.isRTL(context))...[
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: AppPadding.p2.h,
                                horizontal: AppPadding.p2.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppSize.s14,
                                ),
                                border: Border.all(
                                  color: ColorManager.steel,
                                  width: AppSize.s2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.questionsModel.qTranslate!
                                          .questionTranslate![0].questionText,
                                      style: getRegularDINNextStyle(
                                        color: ColorManager.offWhite,
                                        fontSize: AppSize.s17.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: AppSize.s1.w),
                                  InkWell(
                                    onTap: () {
                                      setState(() => voicePlay = !voicePlay);
                                      playAudio(
                                          Constants.baseUrl +
                                              widget
                                                  .questionsModel
                                                  .qTranslate!
                                                  .questionTranslate![0]
                                                  .questionVoice,
                                          voicePlay);
                                    },
                                    child: SvgPicture.asset(
                                      voicePlay
                                          ? ImageAssets.soundWaveThree
                                          : ImageAssets.soundWaveOne,
                                      width: AppSize.s3.h,
                                      height: AppSize.s3.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppSize.s12.h,
                            height: AppSize.s14.h,
                            child: riveArtBoard != null
                                ? Rive(
                              artboard: riveArtBoard!,
                            )
                                : SvgPicture.asset(
                              ImageAssets.robot,
                              height: AppSize.s14.h,
                              width: AppSize.s14.h,
                            ),
                          ),
                        ],
                        if(!Functions.isRTL(context))...[
                          SizedBox(
                            width: AppSize.s12.h,
                            height: AppSize.s14.h,
                            child: riveArtBoard != null
                                ? Rive(
                              artboard: riveArtBoard!,
                            )
                                : SvgPicture.asset(
                              ImageAssets.robot,
                              height: AppSize.s14.h,
                              width: AppSize.s14.h,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: AppPadding.p2.h,
                                horizontal: AppPadding.p2.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppSize.s14,
                                ),
                                border: Border.all(
                                  color: ColorManager.steel,
                                  width: AppSize.s2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.questionsModel.qTranslate!
                                          .questionTranslate![0].questionText,
                                      style: getRegularDINNextStyle(
                                        color: ColorManager.offWhite,
                                        fontSize: AppSize.s17.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: AppSize.s1.w),
                                  InkWell(
                                    onTap: () {
                                      setState(() => voicePlay = !voicePlay);
                                      playAudio(
                                          Constants.baseUrl +
                                              widget
                                                  .questionsModel
                                                  .qTranslate!
                                                  .questionTranslate![0]
                                                  .questionVoice,
                                          voicePlay);
                                    },
                                    child: SvgPicture.asset(
                                      voicePlay
                                          ? ImageAssets.soundWaveThree
                                          : ImageAssets.soundWaveOne,
                                      width: AppSize.s3.h,
                                      height: AppSize.s3.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s12.h,
                      child: (widget.isSolved ||
                              ((widget.questionsModel.questionDetailsResults !=
                                          null)
                                      ? widget
                                          .questionsModel
                                          .questionDetailsResults!
                                          .studentTranslateChoice!
                                          .translateAnswerText
                                      : widget.questionsModel.questionDetails!
                                          .studentTranslateChoice) !=
                                  '')
                          ? ((((widget.questionsModel.questionDetailsResults !=
                                          null)
                                      ? widget
                                          .questionsModel
                                          .questionDetailsResults!
                                          .studentTranslateChoice!
                                          .translateAnswerText
                                      : widget.questionsModel.questionDetails!
                                          .studentTranslateChoice) !=
                                  '')
                              ? AnimatedGrid(
                                  key: _selectedListKey,
                                  initialItemCount: selected.length,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index, animation) {
                                    return InkWell(
                                      onTap: () {
                                        if (!widget.isSolved) {
                                          _moveItem(
                                            fromIndex: index,
                                            fromList: selected,
                                            fromKey: _selectedListKey,
                                            toList: unSelected,
                                            toKey: _unselectedListKey,
                                          );
                                          setState(() {
                                            selectedAnswer = 0;
                                          });
                                        }
                                      },
                                      child: Center(
                                        child: Item(
                                          text: selected[index],
                                          color: solvedQuestionColor ??
                                              ColorManager.skyBlue,
                                        ),
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                  ),
                                )
                              :widget.questionsModel.questionDetailsResults!.studentTranslateChoice!.translateAnswerText.isEmpty? Container() :EmptyTextContainer(
                                  text: (widget.isSolved)
                                      ? widget
                                          .questionsModel
                                          .questionDetailsResults!
                                          .studentTranslateChoice!
                                          .result
                                      : '',
                                  backgroundColor: correction
                                      ? ColorManager.correctGreen
                                      : ColorManager.red,
                                  textColor: ColorManager.white,
                                ))
                          : AnimatedGrid(
                              key: _selectedListKey,
                              initialItemCount: selected.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index, animation) {
                                return InkWell(
                                  onTap: () {
                                    _moveItem(
                                      fromIndex: index,
                                      fromList: selected,
                                      fromKey: _selectedListKey,
                                      toList: unSelected,
                                      toKey: _unselectedListKey,
                                    );
                                    setState(() {
                                      selectedAnswer = 0;
                                    });
                                  },
                                  child: Center(
                                    child: Item(
                                      text: selected[index],
                                      color: ColorManager.skyBlue,
                                    ),
                                  ),
                                );
                              },
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.s2.h),
              Visibility(
                visible: !widget.isSolved,
                child: Container(
                  height: AppSize.s18.h,
                  decoration: BoxDecoration(
                    color: ColorManager.newWidget,
                    borderRadius: BorderRadius.circular(AppSize.s14),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: AppSize.s1.h),
                      SizedBox(
                        height: AppSize.s16.h,
                        child: AnimatedGrid(
                          physics: const BouncingScrollPhysics(),
                          key: _unselectedListKey,
                          initialItemCount: unSelected.length,
                          itemBuilder: (context, index, animation) {
                            return InkWell(
                              onTap: () {
                                _moveItem(
                                  fromIndex: index,
                                  fromList: unSelected,
                                  fromKey: _unselectedListKey,
                                  toList: selected,
                                  toKey: _selectedListKey,
                                );
                                setState(() {
                                  selectedAnswer = 0;
                                });
                              },
                              child: Center(
                                child: Item(
                                  text: unSelected[index],
                                  color: ColorManager.skyBlue,
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: AppSize.s1.h),
              if (widget.isSolved) ...[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.s0.w,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.s1.w,
                      vertical: AppSize.s2_5.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.lightGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSize.s14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          correction
                              ? LocaleKeys.correctAnswer.tr()
                              :widget.questionsModel.questionDetailsResults!.studentTranslateChoice!.translateAnswerText.isEmpty?LocaleKeys.notAnswerYet.tr() :  LocaleKeys.wrongAnswer.tr(),
                          style: getMediumDINNextStyle(
                            color: correction
                                ? ColorManager.correctGreen
                                : ColorManager.red,
                            fontSize: AppSize.s21.sp,
                          ),
                        ),
                        SizedBox(width: AppSize.s4.w),
                        CircleAvatar(
                          radius: AppSize.s3.w,
                          backgroundColor: correction
                              ? ColorManager.correctGreen
                              : ColorManager.red,
                          child: Icon(
                            correction ? Icons.done : Icons.close,
                            size: AppSize.s5.w,
                            color: ColorManager.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s1.h),
                correction
                    ? SizedBox(height: AppSize.s3.h)
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s8.w,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.s3.w,
                            vertical: AppSize.s2_5.h,
                          ),
                          decoration: BoxDecoration(
                            color: ColorManager.lightGreen.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(AppSize.s14),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Center(
                                child: Text(
                                  LocaleKeys.correctAnswer.tr(),
                                  style: getMediumDINNextStyle(
                                    color: ColorManager.correctGreen,
                                    fontSize: AppSize.s21.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: AppSize.s1.h),
                              Wrap(
                                children: List.generate(
                                    correctAnswers.length,
                                    (index) => SizedBox(
                                          width: AppSize.s20.w,
                                          child: Item(
                                            text: correctAnswers[index],
                                            color: ColorManager.correctGreen,
                                          ),
                                        )),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
              SizedBox(height: AppSize.s2.h),
              Visibility(
                visible: !widget.isSolved,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p6.w,
                  ),
                  child: CustomButtonWidget(
                    onTap: widget.isSolved
                        ? null
                        : () {
                            String answer = selected.join(' ');
                             print('mussssssssssssssss $answer');
                            if (!widget.isSolved) {
                              // _examViewModel.allQuestAnswers[widget.index] = true;
                              /// set the question is solved
                              ExamView.allQuestAnswers[widget.index] = true;
                              print('${ExamView.allQuestAnswers}');

                              _examViewModel.submitTranslateSingleQuestion(
                                widget.questionsModel.questionDetails!.questionId,
                                answer,
                                widget.examId,
                              );

                              widget.pageController.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.bounceInOut);
                            }
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _flyingCount = 0;

  _moveItem({
    required int fromIndex,
    required List fromList,
    required GlobalKey<AnimatedGridState> fromKey,
    required List toList,
    required GlobalKey<AnimatedGridState> toKey,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    final globalKey = GlobalKey();
    final item = fromList.removeAt(fromIndex);
    fromKey.currentState!.removeItem(
      fromIndex,
      (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Opacity(
            key: globalKey,
            opacity: 0.0,
            child: Item(
              text: item,
              color: ColorManager.skyBlue,

            ),
          ),
        );
      },
      duration: duration,
    );
    _flyingCount++;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Find the starting position of the moving item, which is exactly the
      // gap its leaving behind, in the original list.
      final box1 = globalKey.currentContext!.findRenderObject() as RenderBox;
      final pos1 = box1.localToGlobal(Offset.zero);
      // Find the destination position of the moving item, which is at the
      // end of the destination list.
      final box2 = toKey.currentContext!.findRenderObject() as RenderBox;
      final box2height = box1.size.height * (toList.length + _flyingCount - 1);
      final pos2 = box2.localToGlobal(Offset(0, box2height));
      // Insert an overlay to "fly over" the item between two lists.
      final entry = OverlayEntry(builder: (BuildContext context) {
        return TweenAnimationBuilder(
          tween: Tween<Offset>(begin: pos1, end: pos2),
          duration: duration,
          builder: (_, Offset value, child) {
            return Positioned(
              left: value.dx,
              top: value.dy,
              child: Item(
                text: item,
                color: ColorManager.skyBlue,
              ),
            );
          },
        );
      });

      Overlay.of(context).insert(entry);

      await Future.delayed(duration);

      entry.remove();
      toList.add(item);
      toKey.currentState!.insertItem(toList.length - 1);
      _flyingCount--;
    });
  }
}

class Item extends StatelessWidget {
  final String text;
  final Color color;

  const Item({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: AppSize.s05.h,
        horizontal: AppSize.s2.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppSize.s05.h,
        horizontal: AppSize.s1_5.w,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          AppSize.s15,
        ),
        boxShadow: [
          BoxShadow(
            color:color.withOpacity(.5) ,
            blurRadius: 1.0,
            offset: const Offset(0, 3), // Positive Y-offset for the bottom shadow
          ),
        const  BoxShadow(
            color: Colors.transparent, // Use a transparent color for the top shadow
            blurRadius: 1.0,
            offset:  Offset(0, 3), // Negative Y-offset for the top shadow
          ),
        ],
      ),
      child: Text(
        text,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: getRegularDINNextStyle(
          color: ColorManager.white,
          fontSize: AppSize.s19.sp,
        ),
      ),
    );
  }
}




