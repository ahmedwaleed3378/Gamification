import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/domain/model/sub_course/sub_course_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/subject/viewmodel/subject_viewmodel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InfoTabBarView extends StatefulWidget {
  final int subjectId;
  final SubjectViewModel subjectViewModel;

  const InfoTabBarView(
      {super.key, required this.subjectViewModel, required this.subjectId});

  @override
  State<InfoTabBarView> createState() => _InfoTabBarViewState();
}

class _InfoTabBarViewState extends State<InfoTabBarView> {
  _bind() {
    widget.subjectViewModel.start();
    widget.subjectViewModel.getSubCourses(widget.subjectId);
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.gray900,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s15),
          topRight: Radius.circular(AppSize.s15),
        ),
      ),
      child: Card(
        color: ColorManager.white,
        margin: EdgeInsets.all(AppPadding.p3.h),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSize.s15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p2.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: AppSize.s1.h),
                Text(
                  LocaleKeys.aboutCourse.tr(),
                  style: getBoldOxygenStyle(
                    color: ColorManager.black,
                    fontSize: AppSize.s16.sp,
                  ),
                ),
                SizedBox(height: AppSize.s1.h),
                StreamBuilder<SubCourseModel>(
                    stream: widget.subjectViewModel.outputSubCourses,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: AppSize.s1_5.h,
                              width: AppSize.s1_5.w,
                              decoration: BoxDecoration(
                                color: ColorManager.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: AppSize.s2.w),
                            Flexible(
                              child: Text(
                                snapshot.data!.subjectDescription,
                                style: getRegularInterStyle(
                                  color: ColorManager.gray23,
                                  fontSize: AppSize.s15.sp,
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }),
                SizedBox(height: AppSize.s2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
