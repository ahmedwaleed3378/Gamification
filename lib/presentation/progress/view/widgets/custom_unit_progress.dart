import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../domain/model/subject_progress/subject_progress_details.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'custom_quiz_detailed_widget.dart';

class UnitProgressWidget extends StatefulWidget {
  const UnitProgressWidget({
    super.key,
    required this.unitName,
    required this.unitAvrege,
    required this.totalPointsOfUnit,
    required this.totalExperienceOfUnit,
    required this.exams, required this.subjectName,
  });
  final String unitName;
  final String subjectName;
  final double unitAvrege;
  final double totalPointsOfUnit;
  final double totalExperienceOfUnit;
  final List<UnitExamModel> exams;
  @override
  State<UnitProgressWidget> createState() => _UnitProgressWidgetState();
}

class _UnitProgressWidgetState extends State<UnitProgressWidget> {
  bool showUnitDetail = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showUnitDetail = !showUnitDetail;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: AppPadding.p1.h),
        padding: EdgeInsets.only(
          top: AppPadding.p2.h,
          bottom: AppPadding.p2.h,
          left: AppPadding.p1.w,
          right: AppPadding.p1.w,
        ),
        width: AppSize.s87.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s15),
          border: Border.all(color: ColorManager.secondaryText),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: AppSize.s1_5.w,
                ),
                SizedBox(
                  width: AppSize.s35.w,
                  child: Text(
                    '${widget.unitName}',
                    style: getMediumDINNextStyle(
                      color: ColorManager.orange,
                      fontSize: AppSize.s16.sp,
                    ),
                    maxLines: 3,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
               const Spacer(),
                // SizedBox(
                //   width: AppSize.s8.w,
                // ),
                Text(
                  widget.unitAvrege.toInt().toString(),
                  style: getRegularDINNextStyle(
                    color: ColorManager.green,
                    fontSize: AppSize.s17.sp,
                  ),
                ),
                SizedBox(
                  width: AppSize.s4.w,
                ),
                SvgPicture.asset(
                  ImageAssets.gemBlue,
                  width: AppSize.s4.w,
                  height: AppSize.s6.w,
                  fit: BoxFit.fitHeight,
                ),
                Text(
                  widget.totalPointsOfUnit.toInt().toString(),
                  style: getRegularDINNextStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s17.sp,
                  ),
                ),
                SizedBox(
                  width: AppSize.s4.w,
                ),
                SvgPicture.asset(
                  ImageAssets.smileIcon,
                  width: AppSize.s4.w,
                  height: AppSize.s6.w,
                  fit: BoxFit.fitHeight,
                ),
                Text(
                  widget.totalExperienceOfUnit.toString(),
                  style: getRegularDINNextStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s17.sp,
                  ),
                ),
                SizedBox(
                  width: AppSize.s2.w,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: AppSize.s6.w,
                  color: ColorManager.white,
                ),
                 SizedBox(
                  width: AppSize.s2.w,
                ),
              ],
            ),
            showUnitDetail
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: AppMargin.m2.h,
                            bottom: AppMargin.m05.h,
                            right: AppMargin.m2.w,
                            left: AppMargin.m2.w),
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: widget.exams.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomQuizDetailedWidget(
                                  examName: widget.exams[index].examArName,
                                  averagePoints: widget
                                      .exams[index].examStudentAverageDegree,
                                  experience: widget.exams[index]
                                      .studentTotalExperienceOfExam,
                                  totalPoints: widget
                                      .exams[index].studentTotalPointsOfExam, examID:widget
                                      .exams[index].examId , subjectName:widget.subjectName,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
