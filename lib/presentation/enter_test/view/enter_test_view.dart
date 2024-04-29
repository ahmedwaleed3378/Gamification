import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/exam/exam_details_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/exam/view/exam_view.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EnterTestView extends StatefulWidget {
  final int examId;
  final int subjectId;

  const EnterTestView({
    Key? key,
    required this.examId,
    required this.subjectId,
  }) : super(key: key);

  @override
  State<EnterTestView> createState() => _EnterTestViewState();
}

class _EnterTestViewState extends State<EnterTestView> {
  final ExamViewModel _examViewModel = instance<ExamViewModel>();
  bool accept = false;

  _bind() {
    _examViewModel.start();
    _examViewModel.examDetails();
    _examViewModel.examResults();
    // startTimeout();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p4.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: SizedBox(
                    height: AppSize.s4.h,
                    width: AppSize.s4.h,
                    child: SvgPicture.asset(ImageAssets.arrowIc),
                  ),
                  onTap: () => Navigator.of(context).pop(),
                ),
                SizedBox(height: AppSize.s4.h),
                Card(
                  color: ColorManager.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSize.s50),
                    ),
                  ),
                  shadowColor: ColorManager.orange,
                  elevation: AppSize.s8,
                  child: Padding(
                    padding: EdgeInsets.all(AppPadding.p7.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'First lecture exam',
                            style: getBoldOxygenStyle(
                              color: ColorManager.orange,
                              fontSize: AppSize.s22.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.s4.h),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: instruction.length,
                          itemBuilder: (context, index) {
                            return Text(
                              instruction[index],
                              style: getRegularOxygenStyle(
                                color: ColorManager.gray43,
                                fontSize: AppSize.s16.sp,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: AppSize.s5.h),
                        ),
                        SizedBox(height: AppSize.s6.h),
                        Card(
                          color: ColorManager.white.withOpacity(AppSize.s07),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSize.s50),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p6.w,
                              vertical: AppPadding.p1.h,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  LocaleKeys.iAccept.tr(),
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.orange,
                                    fontSize: AppSize.s16.sp,
                                  ),
                                ),
                                Checkbox(
                                  activeColor: ColorManager.orange,
                                  value: accept,
                                  onChanged: (value) {
                                    setState(() {
                                      accept = value ?? false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.s4.h),
                        StreamBuilder<ExamDetailsModel>(
                          stream: _examViewModel.outputExamDetails,
                          builder: (context, snapshot) {
                            return Center(
                              child: MaterialButton(
                                onPressed: () {
                                  if (accept == true) {
                                    int numberOfPages = 0;

                                    /// check if solved before

                                    // if (snapshot.data?.returnValue == 200) {
                                    //   numberOfPages = snapshot
                                    //       .data!
                                    //       .exam!
                                    //       .groups![0]
                                    //       .heads![0]
                                    //       .questions!
                                    //       .length;
                                    //
                                    //   if (snapshot.data!.exam!.details!
                                    //       .availableDateFrom.isNotEmpty) {
                                    //     DateTime nowDate = DateTime.now();
                                    //     DateTime date = DateTime.parse(snapshot
                                    //         .data!
                                    //         .exam!
                                    //         .details!
                                    //         .availableDateFrom
                                    //         .replaceAll('T', ' '));
                                    //
                                    //     Duration dateDifference =
                                    //         nowDate.difference(date);
                                    //
                                    //     if (dateDifference.inMinutes > 0) {
                                    //       Navigator.pushReplacement(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //           builder: (BuildContext context) =>
                                    //               ExamView(
                                    //             // examModel: ExamVModel(
                                    //             //   head: snapshot.data!.exam!
                                    //             //       .groups![0].heads![0],
                                    //             //   examName: snapshot.data!.exam!
                                    //             //       .details!.examArName,
                                    //             //   examPeriodMinute: snapshot
                                    //             //       .data!
                                    //             //       .exam!
                                    //             //       .details!
                                    //             //       .examPeriodMinute,
                                    //             //   subjectName: snapshot
                                    //             //       .data!
                                    //             //       .mv!
                                    //             //       .subject!
                                    //             //       .subjectArName,
                                    //             //   examId: widget.examId,
                                    //             //   numberOfPages: numberOfPages,
                                    //             //   examViewModel: _examViewModel,
                                    //             //   isResult: false,
                                    //             //   totalPoints: 0,
                                    //             //   mark: snapshot
                                    //             //       .data!.mv!.examTotalMark
                                    //             //       .toString(),
                                    //             //   subjectId: widget.subjectId,
                                    //             // ),
                                    //           ),
                                    //         ),
                                    //       );
                                    //     } else {
                                    //       /// Show snack bar that you exceed time
                                    //       final snackBar = SnackBar(
                                    //         backgroundColor: ColorManager.red,
                                    //         content: Text(
                                    //           'You exceeded time',
                                    //           style: getBoldOxygenStyle(
                                    //             color: ColorManager.white,
                                    //             fontSize: AppSize.s14.sp,
                                    //           ),
                                    //         ),
                                    //         action: SnackBarAction(
                                    //           label: LocaleKeys.hide.tr(),
                                    //           onPressed: () {},
                                    //         ),
                                    //       );
                                    //
                                    //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    //     }
                                    //   } else {
                                    //     if(numberOfPages == 0) {
                                    //       /// Show snack bar that empty questions
                                    //       final snackBar = SnackBar(
                                    //         backgroundColor: ColorManager.red,
                                    //         content: Text(
                                    //           'Empty questions used for test',
                                    //           style: getBoldOxygenStyle(
                                    //             color: ColorManager.white,
                                    //             fontSize: AppSize.s14.sp,
                                    //           ),
                                    //         ),
                                    //         action: SnackBarAction(
                                    //           label: LocaleKeys.hide.tr(),
                                    //           onPressed: () {},
                                    //         ),
                                    //       );
                                    //
                                    //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    //     }
                                    //
                                    //   }
                                    // } else {
                                    //   _examViewModel.examResultController.stream
                                    //       .listen(
                                    //     (event) {
                                    //       numberOfPages = event.item!.groups![0]
                                    //           .heads![0].questions!.length;
                                    //
                                    //       Navigator.pushReplacement(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //           builder: (BuildContext context) =>
                                    //               ExamView(
                                    //             // examModel: ExamVModel(
                                    //             //     head: event.item!.groups![0]
                                    //             //         .heads![0],
                                    //             //     examName: event.item!
                                    //             //         .details!.examArName,
                                    //             //     examPeriodMinute: 0,
                                    //             //     subjectName:
                                    //             //         event.subjectName,
                                    //             //     examId: widget.examId,
                                    //             //     numberOfPages:
                                    //             //         numberOfPages,
                                    //             //     examViewModel:
                                    //             //         _examViewModel,
                                    //             //     isResult: true,
                                    //             //     totalPoints:
                                    //             //         event.ex.pointsGained,
                                    //             //     mark:
                                    //             //         '${event.ex.examResult.toInt()} / ${event.ex.totalMark}',
                                    //             //     subjectId:
                                    //             //         widget.subjectId),
                                    //           ),
                                    //         ),
                                    //       );
                                    //
                                    //     },
                                    //   );
                                    // }
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppSize.s20,
                                  ),
                                ),
                                color: accept
                                    ? ColorManager.orange
                                    : ColorManager.orange
                                        .withOpacity(AppSize.s05),
                                child: Text(
                                  LocaleKeys.start.tr(),
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.white,
                                    fontSize: AppSize.s17.sp,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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

List<String> instruction = [
  '1- The exam duration is 2 hours.',
  '2- Must press save after finishing each point in the question.',
  '3- Must press Submit after finishing the Question for transfer to the next Question.',
  '4- To pass the exam you must have a ( 60% or 6 out of 10 answers are correct).',
  '5- you get 10 points reward for each Question you answer good to use in.'
];
