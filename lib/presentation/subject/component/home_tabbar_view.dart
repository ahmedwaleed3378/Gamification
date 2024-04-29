import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/courses/subject_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/exam/view/exam_view.dart';
import 'package:gamification/presentation/exam/viewmodel/exam_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/subject/viewmodel/subject_viewmodel.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeTabBarView extends StatefulWidget {
  final int subjectId;
  final SubjectViewModel subjectViewModel;

  const HomeTabBarView({
    super.key,
    required this.subjectViewModel,
    required this.subjectId,
  });

  @override
  State<HomeTabBarView> createState() => _HomeTabBarViewState();
}

class _HomeTabBarViewState extends State<HomeTabBarView>
    with TickerProviderStateMixin {
  late TabController _resourcesTabController;
  final SubjectViewModel _subjectViewModel = instance<SubjectViewModel>();
  final ExamViewModel _examViewModel = instance<ExamViewModel>();

  _bind() {
    _subjectViewModel.start();
    _subjectViewModel.getSearchedUnit(widget.subjectId);
    _subjectViewModel.getSubjectUnits(widget.subjectId);
    _resourcesTabController = TabController(length: 0, vsync: this);
    _examViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _resourcesTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SubjectUnitModel>>(
      stream: _subjectViewModel.outputSubjectUnit,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _resourcesTabController =
              TabController(length: snapshot.data!.length, vsync: this);

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: AppSize.s5_5.h,
                  padding: EdgeInsets.all(AppPadding.p2.w),
                  child: TabBar(
                    controller: _resourcesTabController,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      color: ColorManager.orange,
                      borderRadius: BorderRadius.circular(AppSize.s13),
                    ),
                    labelStyle: getBoldOxygenStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s15.sp,
                    ),
                    labelColor: ColorManager.white,
                    unselectedLabelColor: ColorManager.gray33,
                    tabs: List<Widget>.generate(
                      snapshot.data!.length,
                      (int index) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.p2.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s13),
                          border: Border.all(
                            color: ColorManager.orange,
                            width: AppSize.s1_5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Tab(text: snapshot.data![index].unitArName),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s100.h,
                  child: TabBarView(
                    controller: _resourcesTabController,
                    children: List<Widget>.generate(
                      snapshot.data!.length,
                      (int index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p7.w,
                          vertical: AppPadding.p2.h,
                        ),
                        child: Column(
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     Text(
                            //       '20 mins',
                            //       style: getBoldOxygenStyle(
                            //         color: ColorManager.orange,
                            //         fontSize: AppSize.s15.sp,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            snapshot.data![index].content!.isNotEmpty
                                ? ListView.separated(
                                    shrinkWrap: true,
                                    itemCount:
                                        snapshot.data![index].content!.length,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, i) {
                                      return InkWell(
                                        onTap: () {
                                          if (snapshot.data![index].content![i]
                                                  .type ==
                                              Constants.exam) {

                                            if(i == 0 || snapshot.data![index].content![i-1].isMandatory == true) {
                                              int numberOfPages = 0;

                                              /// check if solved before

                                              if (snapshot.data?[index].content![i].isComplete == true) {

                                                //snapshot.data![index].content![i].id
                                                _examViewModel.examResults();

                                                _examViewModel.examResultController.stream
                                                    .listen((event) {

                                                  numberOfPages = event.item!.groups![0]
                                                      .heads![0].questions!.length;

                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                           ExamView(
                                                            examId: 2249,
                                                        subjectName: ' ', 

                                                      ),
                                                    ),
                                                  );
                                                });
                                              } else {
                                                Navigator.pushNamed(
                                                  context,
                                                  Routes.enterTestRoute,
                                                  arguments: {
                                                    'examId': snapshot.data![index]
                                                        .content![i].id,
                                                    'subjectId': widget.subjectId
                                                  },
                                                );
                                              }

                                            } else if(snapshot.data![index].content![i-1].isMandatory == true && snapshot.data![index].content![i-1].isComplete == false){
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                content: Text('You need to complete previous modules first'),
                                              ));
                                            }

                                          } else {
                                            if(i == 0) {
                                              Navigator.pushNamed(context,
                                                  Routes.lectureVideoRoute,
                                                  arguments: snapshot.data![index]
                                                      .content![i].id);

                                            } else if(snapshot.data![index].content![i-1].isMandatory == true && snapshot.data![index].content![i-1].isComplete == false){
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                content: Text('You need to complete previous modules first'),
                                              ));
                                            } else {

                                              Navigator.pushNamed(context,
                                                  Routes.lectureVideoRoute,
                                                  arguments: snapshot.data![index]
                                                      .content![i].id);
                                            }

                                          }
                                        },
                                        child: Card(
                                          color: ColorManager.white,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(AppSize.s15),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: AppPadding.p5.w,
                                              vertical: AppPadding.p2.h,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  snapshot
                                                              .data![index]
                                                              .content![i]
                                                              .type ==
                                                          Constants.exam
                                                      ? ImageAssets.testIcon
                                                      : ImageAssets.videoIcon,
                                                  height: AppSize.s4.h,
                                                ),
                                                SizedBox(width: AppSize.s5.w),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        snapshot.data![index]
                                                            .content![i].arName,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 3,
                                                        style:
                                                            getMediumInterStyle(
                                                          color: ColorManager
                                                              .black,
                                                          fontSize:
                                                              AppSize.s14.sp,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: AppSize.s1.h),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            snapshot
                                                                        .data![
                                                                            index]
                                                                        .content![
                                                                            i]
                                                                        .type ==
                                                                    Constants
                                                                        .exam
                                                                ? LocaleKeys
                                                                    .exam
                                                                    .tr()
                                                                : LocaleKeys
                                                                    .lecture
                                                                    .tr(),
                                                            style:
                                                                getRegularInterStyle(
                                                              color:
                                                                  ColorManager
                                                                      .gray22,
                                                              fontSize: AppSize
                                                                  .s13.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: AppSize.s1.h),
                                  )
                                : SizedBox(
                                    height: AppSize.s70.h,
                                    width: AppSize.s70.h,
                                    child: ListView(
                                      shrinkWrap: true,
                                      primary: Platform.isIOS ? false : true,
                                      physics: const BouncingScrollPhysics(),
                                      children: [
                                        Lottie.asset(JsonAssets.emptyContent),
                                        Text(
                                          LocaleKeys.emptyList.tr(),
                                          textAlign: TextAlign.center,
                                          style: getBoldOxygenStyle(
                                            color: ColorManager.warmGrey,
                                            fontSize: AppSize.s19.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
