import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/domain/model/exam/exam_model.dart';
import 'package:gamification/presentation/exam/view/final_result_view.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExamTimer extends StatefulWidget {
  final String timerText;
  final String firstIcon;
  final String markText;
  final String secondIcon;
  final bool isResult;
  final ExamVModel? examModel;

  const ExamTimer({
    Key? key,
    required this.timerText,
    required this.firstIcon,
    required this.markText,
    required this.secondIcon,
    required this.isResult,
    required this.examModel,
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
      myDuration = parseDuration(widget.timerText);

      startTimer();
    }

    super.initState();
  }

  Duration parseDuration(String durationString) {
    List<String> components = durationString.split(':');

    int hours = int.parse(components[0]);
    int minutes = int.parse(components[1]);
    int seconds = int.parse(components[2]);

    return Duration(hours: hours, minutes: minutes, seconds: seconds);
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

        widget.examModel!.examViewModel.submitExam();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => FinalResultView(
              subjectId: widget.examModel!.subjectId,
              examViewModel: widget.examModel!.examViewModel,
              examId: widget.examModel!.examId,
              subjectName: widget.examModel!.subjectName,
            ),
          ),
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
    return Center(
      child: Card(
        color: ColorManager.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    widget.firstIcon,
                    height: AppSize.s28,
                    width: AppSize.s28,
                  ),
                  SizedBox(width: AppSize.s2.w),
                  Text(
                    widget.isResult
                        ? widget.timerText
                        : '$durationHours:$durationMinutes:$durationSeconds',
                    style: getSemiBoldInterStyle(
                      color: ColorManager.red100,
                      fontSize: AppSize.s18.sp,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    widget.secondIcon,
                    height: AppSize.s28,
                    width: AppSize.s28,
                  ),
                  SizedBox(width: AppSize.s2.w),
                  Text(
                    widget.markText,
                    style: getSemiBoldInterStyle(
                      color: ColorManager.black,
                      fontSize: AppSize.s16.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
