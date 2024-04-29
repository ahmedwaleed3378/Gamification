import 'dart:async';

import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/timeout_dialogue.dart';

class ExamTimer extends StatefulWidget {
  final String timerText;
  final bool isResult;
  final ExamViewModel examViewModel;

  const ExamTimer({
    Key? key,
    required this.timerText,
    required this.isResult,
    required this.examViewModel,
  }) : super(key: key);

  @override
  State<ExamTimer> createState() => _ExamTimerState();
}

class _ExamTimerState extends State<ExamTimer> {
  Timer? countdownTimer;
  Duration? myDuration;

  String durationHours = '';
  String durationMinutes = '';
  String durationSeconds = '';

  @override
  void initState() {
    if (!widget.isResult) {
      myDuration = parseTime(
        Duration(minutes: int.parse(widget.timerText)).toString(),
      );

      startTimer();
    }

    super.initState();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(),
    );
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration!.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ExamTimeOutDialogue(
              examViewModel: widget.examViewModel,
            );
            // CustomDialog(
            //   examViewModel: widget.examViewModel,
            //   timesUp: true,
            //   leftQuestions: false,
            // );
          },
        );
      } else {
        myDuration = Duration(seconds: seconds);
        String strDigits(int n) => n.toString().padLeft(2, '0');
        durationHours = strDigits(myDuration!.inHours.remainder(24));
        durationMinutes = strDigits(myDuration!.inMinutes.remainder(60));
        durationSeconds = strDigits(myDuration!.inSeconds.remainder(60));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isResult
        ? const SizedBox()
        : Card(
            color: ColorManager.lightGreen.withOpacity(0.15),
            elevation: AppSize.s2,
            shadowColor: ColorManager.dark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s15),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppPadding.p1_5.h,
                horizontal: AppPadding.p4.w,
              ),
              child: Text(
                '$durationHours:$durationMinutes:$durationSeconds',
                style: getSemiBoldInterStyle(
                  color: ColorManager.goldenRod,
                  fontSize: AppSize.s17.sp,
                ),
              ),
            ),
          );
  }
}
