import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GradesTabBarView extends StatelessWidget {
  const GradesTabBarView({super.key});

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
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p2.h),
        child: SingleChildScrollView(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: grades.length,
            itemBuilder: (context, index) {
              return Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: Card(
                  color: ColorManager.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppSize.s15),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppPadding.p2.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              grades[index]['part'],
                              style: getBoldOxygenStyle(
                                color: ColorManager.orange,
                                fontSize: AppSize.s16.sp,
                              ),
                            ),
                            Text(
                              'Assignment',
                              style: getBoldOxygenStyle(
                                color: ColorManager.gray34,
                                fontSize: AppSize.s17.sp,
                              ),
                            ),
                            Text(
                              'Grade',
                              style: getBoldOxygenStyle(
                                color: ColorManager.gray34,
                                fontSize: AppSize.s17.sp,
                              ),
                            ),
                          ],
                        ),
                        ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          iconColor: ColorManager.orange,
                          collapsedIconColor: ColorManager.orange,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                grades[index]['assignment'],
                                style: getSemiBoldInterStyle(
                                  color: ColorManager.gray44,
                                  fontSize: AppSize.s13_5.sp,
                                ),
                              ),
                              SizedBox(width: AppSize.s28.w),
                              Text(
                                grades[index]['grade'],
                                style: getBoldOxygenStyle(
                                  color: ColorManager.green,
                                  fontSize: AppSize.s17.sp,
                                ),
                              ),
                            ],
                          ),
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: grades[index]['detail'].length,
                              itemBuilder: (context, ind) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    Text(
                                      grades[index]['detail'][ind]['lecture'],
                                      style: getSemiBoldInterStyle(
                                        color: ColorManager.orange11,
                                        fontSize: AppSize.s14.sp,
                                      ),
                                    ),
                                    Text(
                                      grades[index]['detail'][ind]['score'],
                                      style: getBoldOxygenStyle(
                                        color: ColorManager.green,
                                        fontSize: AppSize.s17.sp,
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, ind) =>
                                  SizedBox(height: AppSize.s1.h),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: AppSize.s2.h),
          ),
        ),
      ),
    );
  }
}

List grades = [
  {
    'part': 'Part 1',
    'assignment': '3 Tests',
    'grade': '93 %',
    'open': false,
    'detail': [
      {'lecture': 'Lecture 1', 'score': '93 %'},
      {'lecture': 'Lecture 2', 'score': '50 %'},
      {'lecture': 'Lecture 3', 'score': '60 %'},
    ],
  },
  {
    'part': 'Part 2',
    'assignment': '2 Tests',
    'grade': '74 %',
    'open': false,
    'detail': [
      {'lecture': 'Lecture 1', 'score': '74 %'},
      {'lecture': 'Lecture 2', 'score': '50 %'},
    ],
  },
  {
    'part': 'Part 3',
    'assignment': '4 Tests',
    'grade': '97 %',
    'open': false,
    'detail': [
      {'lecture': 'Lecture 1', 'score': '997 %'},
      {'lecture': 'Lecture 2', 'score': '50 %'},
      {'lecture': 'Lecture 3', 'score': '60 %'},
      {'lecture': 'Lecture 3', 'score': '93 %'},
    ],
  },
  {
    'part': 'Part 4',
    'assignment': '6 Tests',
    'grade': '66 %',
    'open': false,
    'detail': [
      {'lecture': 'Lecture 1', 'score': '93 %'},
      {'lecture': 'Lecture 2', 'score': '50 %'},
      {'lecture': 'Lecture 3', 'score': '66 %'},
      {'lecture': 'Lecture 4', 'score': '60 %'},
      {'lecture': 'Lecture 5', 'score': '97 %'},
      {'lecture': 'Lecture 6', 'score': '55 %'},
    ],
  },
];
