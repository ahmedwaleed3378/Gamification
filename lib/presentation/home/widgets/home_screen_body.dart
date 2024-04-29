
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:gamification/domain/model/subjects_of_year/student_subjects.dart';
import 'package:gamification/presentation/home/components/gift_gallery/gift_gallery_view.dart';
import 'package:gamification/presentation/home/widgets/custom_home_section_header.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../viewmodel/home_viewmodel.dart';
import 'custom_home_button.dart';
import '../../widget/custom_home_header.dart';
import 'custom_home_subject_gridview.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({
    super.key,
    required this.subjectImages,
    required this.subjectNames,
    required this.subjectIds,
    required this.userGimNum,
    required this.userFlashNum,
    required this.connected,
    required this.onTapSubjects,
    required this.onTapChallenges,
    required this.reloadFunction,
    required this.userImage,
    required this.recentSubjects,
    required this.seeAllChallenges,
    required this.isOpen,
    // required this.counter,
    required this.totalStreak,
    required this.viewModel,
  });

  final Future Function() reloadFunction;
  final List<String> subjectImages;
  final List<String> subjectNames;
  final List<int> subjectIds;
  final bool connected;
  final int userGimNum;
  final int userFlashNum;
  final String userImage;
  final void Function()? onTapSubjects;
  final void Function()? onTapChallenges;
  final List<RecentSubjectsModel> recentSubjects;
  final bool seeAllChallenges;
  final bool isOpen;
  final HomeViewModel viewModel;

  // final int counter;
  final int totalStreak;

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  // final AppPreferences _appPreferences = instance<AppPreferences>();
  bool seeAllSubjects = false;
  bool seeAllChallenges = false;
  @override
  void initState() {
    widget.viewModel.getUserStreak(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int partOfLength = widget.recentSubjects.length > 3
        ? 3
        : widget.recentSubjects.length > 2
            ? 2
            : 1;

    return RefreshWidget(
      onRefresh: widget.reloadFunction,
      widgetChild: Scaffold(
        backgroundColor: ColorManager.dark,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p5.w),
            child: Column(
              children: [
                CustomHomeHeaderWidget(
                    userFlashNum: widget.userFlashNum,
                    userGimNum: widget.userGimNum,
                    userImage: widget.userImage),
                SizedBox(
                  height: AppSize.s2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.terracota.withOpacity(0.2),
                        spreadRadius: 8,
                        blurRadius: 8,
                        offset: const Offset(3, -3),
                      ),
                    ],
                  ),
                  child: CustomPaint(
                    size: Size(AppSize.s100.w, AppSize.s07.h),
                    painter: CurvePainter(),
                  ),
                ),
                SizedBox(
                  height: AppSize.s2.h,
                ),
                SectionHeader(
                  mainTitle: LocaleKeys.subjects.tr(),
                  subTitle:seeAllSubjects?  LocaleKeys.hideAll.tr() : LocaleKeys.seeAll.tr(), onTap: (){
                 setState(() =>seeAllSubjects = !seeAllSubjects );
                  widget.onTapSubjects!();
                },
                  //  LocaleKeys.seeAll,
                ),
                SizedBox(
                  height: AppSize.s1.h,
                ),
                if (widget.subjectImages.isNotEmpty &&
                    widget.subjectNames.isNotEmpty &&
                    widget.subjectIds.isNotEmpty)
                  CustomSubjectsGridView(
                    subjectImages: widget.subjectImages,
                    subjectNames: widget.subjectNames,
                    subjectIds: widget.subjectIds,
                    connected: widget.connected,
                    isOpen :widget.isOpen
                  ),
                if (widget.subjectImages.isEmpty &&
                    widget.subjectNames.isEmpty &&
                    widget.subjectIds.isEmpty)
                  Text(
                    LocaleKeys.emptySubjects.tr(),
                    style: getRegularDINNextStyle(
                        color: ColorManager.terracota, fontSize: AppSize.s20),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                SizedBox(
                  height: AppSize.s1.h,
                ),
                SectionHeader(
                    mainTitle: LocaleKeys.newExams.tr(),
                    subTitle:widget.recentSubjects.length == 1? '':  seeAllChallenges? LocaleKeys.hideAll.tr() : LocaleKeys.seeAll.tr(),
                    onTap: (){
                      setState(() => seeAllChallenges = !seeAllChallenges);
                      widget.onTapChallenges!();
                    },),
                SizedBox(
                  height: AppSize.s2.h,
                ),
                if (widget.recentSubjects.isNotEmpty)
                  SizedBox(
                    height: AppSize.s30.h,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.mapView,
                                  arguments: {
                                    "subjectId":
                                        widget.recentSubjects[index].subjectId,
                                    "subjectName": widget
                                        .recentSubjects[index].subjectArName
                                  },
                                );
                              },
                              child: HomeCustomChallengeButton(
                                  score: 3,
                                  scoreOfTen: 2,
                                  image: widget.recentSubjects[index]
                                          .subjectImage.isNotEmpty
                                      ? widget
                                          .recentSubjects[index].subjectImage
                                      : ImageAssets.fireIcon,
                                  challengeName: widget
                                      .recentSubjects[index].subjectArName,
                                  examsNumber: widget.recentSubjects[index]
                                      .userExamNotSolvedCount,),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: AppSize.s3.h,
                            ),
                        itemCount: widget.seeAllChallenges
                            ? widget.recentSubjects.length
                            : partOfLength),
                  ),
                if (widget.recentSubjects.isEmpty)
                  Text(
                    LocaleKeys.emptyChallenges.tr(),
                    style: getRegularDINNextStyle(
                        color: ColorManager.terracota, fontSize: AppSize.s20),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

              ],
            ),
          ),
        ),

      ),
    );
  }

  // void homeStreak(BuildContext context) {
  //   Future.delayed(const Duration(seconds: 1), () {

  //  });
  // }
}
