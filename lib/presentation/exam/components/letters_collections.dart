import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/app/functions.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/exam/view/exam_view.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_answer_widget.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/custom_letter_collection_item.dart';
import 'package:gamification/presentation/widget/empty_text_container.dart';
import 'package:gamification/presentation/widget/letter_collection_head.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' as s;

class LettersCollectionsView extends StatefulWidget {
  const LettersCollectionsView({
    Key? key,
    required this.isSolved,
    required this.questionsModel,
    required this.pageController,
    required this.examId,
    required this.index,
    required this.isSubmittedBefore,
    required this.numberOfAllQuestions,
  }) : super(key: key);

  final bool isSolved;
  final QuestionsModel questionsModel;
  final PageController pageController;
  final int examId;
  final int index;
  final bool isSubmittedBefore;
  final int numberOfAllQuestions;

  @override
  State<LettersCollectionsView> createState() => _LettersCollectionsViewState();
}

class _LettersCollectionsViewState extends State<LettersCollectionsView> {
  final ExamViewModel _examViewModel = instance<ExamViewModel>();
  List<String> letters = [];
  List<String> selectedLetters = [];

  // details letters
  List<LettersCollectionDragModel> lettersDetails = [];
  List<LettersCollectionDragModel> selectedLettersDetails = [];

  bool correction = false;
  Artboard? riveArtboard;
  late RiveAnimationController controllerRobot;
  bool voicePlay = false;
  late AudioPlayer player;
  int selectedLettersIndex = -1;
  int lettersIndex = -1;
  List<String> correctSolved = [];
  Color? resultColor;

  /// insert All Letters in main container
  _insertAllLetter() {
    widget.questionsModel.qVoice!.questionAnswer![0].answer!.forEach((element) {
      letters.add(element);
    });

    for (int n = 0;
        n < widget.questionsModel.qVoice!.questionAnswer![0].answerLength;
        n++) {
      selectedLetters.add('');
    }
    print('length = ${selectedLetters.length}');
  }

  /// solved data
  _insertData() {
    for (int n = 0;
        n <
            widget.questionsModel.questionDetailsResults!.studentVoiceChoice!
                .voiceQuestionAnswer.length;
        n++) {
      selectedLetters.add(widget.questionsModel.questionDetailsResults!
          .studentVoiceChoice!.voiceQuestionAnswer[n]);
      letters.remove(widget.questionsModel.questionDetailsResults!
          .studentVoiceChoice!.voiceQuestionAnswer[n]);
    }
    correction = widget
        .questionsModel.questionDetailsResults!.studentVoiceChoice!.result;
    correctSolved =
        widget.questionsModel.qVoice!.questionAnswer![0].trueAnswer.split('');
    resultColor = correction ? ColorManager.correctGreen : ColorManager.red;
  }

  /// is submitted before can solve again

  _insertSubmittedData() {
    selectedLetters = [];
    for (int n = 0;
        n < widget.questionsModel.questionDetails!.studentVoiceChoice.length;
        n++) {
      selectedLetters
          .add(widget.questionsModel.questionDetails!.studentVoiceChoice[n]);
      letters
          .remove(widget.questionsModel.questionDetails!.studentVoiceChoice[n]);
    }
  }

  @override
  void initState() {
    _examViewModel.getUserId();
    letters = List<String>.generate(5, (item) => 'T');

    if (widget.isSolved) {
      _insertData();
    } else {
      _insertAllLetter();
    }

    if (!widget.isSolved && widget.isSubmittedBefore) {
      _insertSubmittedData();
    }
    _examViewModel.getUserId();
    controllerRobot = SimpleAnimation('idle');
    rootBundle.load(RiveAssets.taslimaRobot).then((data) {
      try {
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        art.addController(controllerRobot);
        setState(() => riveArtboard = art);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    player = AudioPlayer();
    player.onPlayerComplete.listen((event) {
      setState(() => voicePlay = false);
    });

    super.initState();
  }

  playAudio(String audioUrl, bool state) async {
    if (state) {
      await player.play(UrlSource(audioUrl));
    } else {
      await player.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
        backgroundColor: ColorManager.dark,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: AppPadding.p7.w,
                right: AppPadding.p7.w,
                // top: AppPadding.p6.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.s1.w)
                        .copyWith(bottom: AppSize.s2.h),
                    child: Text(
                      LocaleKeys.listenAndWrite.tr(),
                      style: getMediumDINNextStyle(
                          color: ColorManager.white, fontSize: AppSize.s18),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  DragTarget<String>(
                    builder: (context, candidateData, rejectedData) =>
                        Container(
                            width: double.infinity,
                            //height: AppSize.s27.h,
                            padding: EdgeInsets.symmetric(
                                vertical: AppPadding.p1.h,
                                horizontal: AppPadding.p2.w),
                            decoration: BoxDecoration(
                              color: ColorManager.newWidget,
                              borderRadius: BorderRadius.circular(AppSize.s14),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                LetterCollectionHead(
                                  onTap: () {
                                    // play audio
                                    setState(() => voicePlay = !voicePlay);
                                    playAudio(
                                        Constants.baseUrl +
                                            widget
                                                .questionsModel
                                                .qVoice!
                                                .questionAudio![0]
                                                .voiceQuestion,
                                        voicePlay);
                                  },
                                  imageUrl: Constants.baseUrl +
                                      widget.questionsModel.qVoice!
                                          .questionAudio![0].imageQuestion,
                                  voicePlay: voicePlay,
                                  riveArtboard: riveArtboard,
                                ),
                                SizedBox(
                                  height: AppSize.s1.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppSize.s1.w),
                                  child: SizedBox(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        textDirection:
                                            containsArabic(selectedLetters)
                                                ? s.TextDirection.rtl
                                                : s.TextDirection.ltr,
                                        children: List<Widget>.generate(
                                          selectedLetters.length,
                                          (index) => (widget.isSolved)
                                              ? widget
                                                          .questionsModel
                                                          .questionDetailsResults!
                                                          .studentVoiceChoice!
                                                          .voiceQuestionAnswer !=
                                                      ''
                                                  ? draggable(
                                                      selectedLetters[index])
                                                  : EmptyTextContainer(
                                                      text: selectedLetters[
                                                          index],
                                                      backgroundColor:
                                                          selectedLetters[index]
                                                                  .isEmpty
                                                              ? ColorManager
                                                                  .dark
                                                              : correction
                                                                  ? ColorManager
                                                                      .correctGreen
                                                                  : ColorManager
                                                                      .red,
                                                      textColor:
                                                          ColorManager.white,
                                                    )
                                              : draggable(
                                                  selectedLetters[index]),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                    onWillAccept: (data) {
                      if (widget.isSolved) {
                        return false;
                      }
                      selectedLettersIndex = selectedLetters.indexOf(data!);
                      return true;
                    },
                  ),
                  SizedBox(height: AppSize.s2.h),
                  if (!widget.isSolved)
                    DragTarget<String>(
                      builder: (context, candidateData, rejectedData) =>
                          Container(
                              width: double.infinity,
                              height: AppSize.s27.h,
                              padding: EdgeInsets.symmetric(
                                  vertical: AppPadding.p1.h,
                                  horizontal: AppPadding.p3.w),
                              decoration: BoxDecoration(
                                color: ColorManager.newWidget,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Wrap(
                                        children: List<Widget>.generate(
                                            letters.length,
                                            (index) => GestureDetector(
                                                  onTap: () {
                                                    // get index
                                                    lettersIndex =
                                                        letters.indexOf(
                                                            letters[index]);
                                                    setState(() {
                                                      // if (!selectedLetters
                                                      //     .contains(
                                                      //         letters[index])) {
                                                      //   selectedLetters.add(
                                                      //       letters[index]);
                                                      //   letters.removeAt(
                                                      //       lettersIndex);
                                                      // }

                                                      selectedLetters
                                                          .add(letters[index]);
                                                      letters.removeAt(
                                                          lettersIndex);
                                                    });
                                                    selectedLettersIndex =
                                                        selectedLetters.indexOf(
                                                            letters[index]);
                                                  },
                                                  child:
                                                      CustomLetterCollectionItem(
                                                    text: letters[index],
                                                    color:
                                                        ColorManager.lightNavy,
                                                  ),
                                                )),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                      onWillAccept: (data) {
                        lettersIndex = letters.indexOf(data!);
                        return true;
                      },
                      onAccept: (data) {
                        setState(() {
                          selectedLetters.removeAt(selectedLettersIndex);
                          letters.add(data);
                          // if (!letters.contains(data)) {
                          //   selectedLetters.removeAt(selectedLettersIndex);
                          //   letters.add(data);
                          // }
                        });
                      },
                    ),
                  SizedBox(
                    height: AppSize.s05.h,
                  ),
                  if (widget.isSolved) ...[
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorManager.newWidget),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p2.w,
                        vertical: AppPadding.p1.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            correction
                                ? LocaleKeys.correctAnswer.tr()
                                :(widget.questionsModel.questionDetailsResults!.studentVoiceChoice!.voiceQuestionAnswer.isEmpty)?
                                LocaleKeys.notAnswerYet.tr(): LocaleKeys.wrongAnswer.tr(),
                            style: getMediumDINNextStyle(
                                color: correction
                                    ? ColorManager.correctGreen
                                    : ColorManager.red,
                                fontSize: AppSize.s21.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s1.h,
                    ),
                    correction
                        ? SizedBox(height: AppSize.s3.h)
                        : Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSize.s1.w,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSize.s1.w,
                                vertical: AppSize.s2_5.h,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.lightGreen.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.circular(AppSize.s14),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Center(
                                    child: Text(
                                      LocaleKeys.theCorrectAnswer.tr(),
                                      style: getMediumDINNextStyle(
                                        color: ColorManager.correctGreen,
                                        fontSize: AppSize.s21.sp,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  if (!correction)
                                    SizedBox(height: AppSize.s1.h),
                                  if (!correction)
                                    Center(
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        textDirection: containsArabic(letters)
                                            ? s.TextDirection.rtl
                                            : s.TextDirection.ltr,
                                        children: List.generate(
                                            correctSolved.length,
                                            (index) => Item(
                                                  text: correctSolved[index],
                                                  color:
                                                      ColorManager.correctGreen,
                                                )),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                  ],
                  //   SizedBox(height: AppSize.s2.h),
                  if (widget.index != widget.numberOfAllQuestions - 1)
                    SizedBox(height: AppSize.s13.h),
                  if (widget.isSolved &&
                      widget.index != widget.numberOfAllQuestions - 1)
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppPadding.p0.w,
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
                  if (!widget.isSolved)
                    CustomButtonWidget(
                      onTap: !widget.isSolved && selectedLetters.length >= 2
                          ? () {
                              String answer = selectedLetters.join();

                              // _examViewModel.allQuestAnswers[widget.index] = true;

                              if (!widget.isSolved) {
                                // _examViewModel.allQuestAnswers[widget.index] = true;
                                ExamView.allQuestAnswers[widget.index] = true;
                                print('${ExamView.allQuestAnswers}');
                                _examViewModel
                                    .submitSingleCVoiceQuestionHistory(
                                        widget.questionsModel.qVoice!
                                            .questionAudio![0].questionId,
                                        answer,
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
                  SizedBox(height: AppSize.s6.h),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
    controllerRobot.dispose();
  }

  Widget draggable(String character) {
    return Draggable<String>(
      data: character,
      feedback: CustomAnswerWidget(
          color: ColorManager.skyBlue.withOpacity(.1), text: character),
      childWhenDragging: Container(),
      child: CustomLetterCollectionItem(
        text: character,
        color: ColorManager.skyBlue,
      ),
    );
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
      width: AppSize.s12.w,
      margin: EdgeInsets.symmetric(
        vertical: AppSize.s1_2.h,
        horizontal: AppSize.s07.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppSize.s1_2.h,
        horizontal: AppSize.s2.w,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          AppSize.s15,
        ),
      ),
      child: Text(
        text,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: getRegularDINNextStyle(
          color: ColorManager.white,
          fontSize: AppSize.s18.sp,
        ),
      ),
    );
  }
}

class LettersCollectionDragModel {
  String letter;
  bool isExist;

  LettersCollectionDragModel(this.letter, this.isExist);
}
