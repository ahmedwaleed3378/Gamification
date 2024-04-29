import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/learning_custom_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyLearningScreen extends StatefulWidget {
  const MyLearningScreen({super.key});

  @override
  State<MyLearningScreen> createState() => _MyLearningScreenState();
}

class _MyLearningScreenState extends State<MyLearningScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p5.w,
          vertical: AppPadding.p3.h,
        ),
        child: Column(
          children: [
            Text(
              LocaleKeys.myLearning.tr(),
              style: getBoldOxygenStyle(
                color: ColorManager.gray300,
                fontSize: AppSize.s21.sp,
              ),
            ),
            SizedBox(height: AppSize.s3.h),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: AppSize.s6.h,
                    decoration: BoxDecoration(
                      color: ColorManager.gray600.withOpacity(AppSize.s01),
                      borderRadius: BorderRadius.circular(AppSize.s15),
                    ),
                    padding: EdgeInsets.all(AppPadding.p2.w),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: ColorManager.orange,
                        borderRadius: BorderRadius.circular(AppSize.s15),
                      ),
                      labelStyle: getBoldOxygenStyle(
                        color: ColorManager.white,
                        fontSize: AppSize.s15.sp,
                      ),
                      labelColor: ColorManager.white,
                      unselectedLabelColor: ColorManager.gray500,
                      tabs: [
                        Tab(text: LocaleKeys.seeAll.tr()),
                        Tab(text: LocaleKeys.inProgress.tr()),
                        Tab(text: LocaleKeys.finished.tr()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        LearningCardWidget(
                          data: allLearning,
                        ),
                        LearningCardWidget(
                          data: inProgressLearning,
                        ),
                        LearningCardWidget(
                          data: finishedLearning,
                          finished: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}

List allLearning = [
  {
    'title': 'HR Management',
    'instructor': 'Nour Eldeen',
    'lesson': 18,
    'image': 'assets/images/basic_course01.svg',
  },
  {
    'title': 'Project Management',
    'instructor': 'Nour Eldeen',
    'lesson': 8,
    'image': 'assets/images/basic_course02.svg',
  },
];

List inProgressLearning = [
  {
    'title': 'HR Management',
    'instructor': 'Nour Eldeen',
    'lesson': 18,
    'image': 'assets/images/basic_course01.svg',
  },
  {
    'title': 'Project Management',
    'instructor': 'Nour Eldeen',
    'lesson': 8,
    'image': 'assets/images/basic_course02.svg',
  },
];

List finishedLearning = [
  {
    'title': 'HR Management',
    'instructor': 'Nour Eldeen',
    'lesson': 25,
    'image': 'assets/images/basic_course01.svg',
  },
];
