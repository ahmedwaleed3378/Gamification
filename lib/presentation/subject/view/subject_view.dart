import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/sub_course/sub_course_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/functions.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/subject/component/home_tabbar_view.dart';
import 'package:gamification/presentation/subject/component/info_tabbar_view.dart';
import 'package:gamification/presentation/subject/component/resources_tabbar_view.dart';
import 'package:gamification/presentation/subject/viewmodel/subject_viewmodel.dart';
import 'package:gamification/presentation/widget/network_image_widget.dart';
import 'package:gamification/presentation/widget/transform_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widget/refresh_indicator_widget.dart';

class SubjectView extends StatefulWidget {
  final int subjectId;

  const SubjectView({Key? key, required this.subjectId}) : super(key: key);

  @override
  State<SubjectView> createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final SubjectViewModel _subjectViewModel = instance<SubjectViewModel>();

  _bind() {
    _subjectViewModel.start();
    _subjectViewModel.getSubCourses(widget.subjectId);
  }

  @override
  void initState() {
    _bind();
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _subjectViewModel.outputState,
      builder: (context, snapshot) {
        return snapshot.data
                ?.getScreenWidget(context, _getContentWidget(), () {}) ??
            _getContentWidget();
      },
    );
  }

  Future loadList() async {
    _subjectViewModel.start();
     _subjectViewModel.getSubCourses(widget.subjectId);
  }
  Widget _getContentWidget() {
    return  RefreshWidget(
      onRefresh: loadList,
      widgetChild: Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: Stack(
                children: [
                  DefaultTabController(
                    length: 3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: AppSize.s4.h),
                          StreamBuilder<SubCourseModel>(
                              stream: _subjectViewModel.outputSubCourses,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s12),
                                        child: NetworkImageWidget(
                                          url: snapshot.data!.attachPath,
                                          height: AppSize.s18.h,
                                          width: AppSize.s70.w,
                                          errorChild: SvgPicture.asset(
                                            ImageAssets.noImageCourse,
                                            width: AppSize.s14.h,
                                            height: AppSize.s14.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: AppSize.s1.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: AppPadding.p3.w,
                                        ),
                                        child: Text(
                                          Functions.isRTL(context)
                                              ? snapshot.data!.subCourseArName
                                              : snapshot.data!.subCourseEnName,
                                          textAlign: TextAlign.center,
                                          style: getBoldOxygenStyle(
                                            color: ColorManager.black,
                                            fontSize: AppSize.s18.sp,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: AppPadding.p3.w,
                                        ),
                                        child: Text(
                                          Functions.isRTL(context)
                                              ? snapshot.data!.mainCourseArName
                                              : snapshot.data!.mainCourseEnName,
                                          textAlign: TextAlign.center,
                                          style: getRegularInterStyle(
                                            color: ColorManager.gray22,
                                            fontSize: AppSize.s16.sp,
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                          SizedBox(height: AppSize.s1.h),
                          SizedBox(
                            child: TabBar(
                              indicatorColor: ColorManager.orange,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: AppSize.s3,
                              labelPadding: EdgeInsets.zero,
                              labelStyle: getBoldOxygenStyle(
                                color: ColorManager.orange,
                                fontSize: AppSize.s17.sp,
                              ),
                              labelColor: ColorManager.orange,
                              unselectedLabelColor: ColorManager.gray22,
                              tabs: [
                                Tab(text: LocaleKeys.home.tr()),
                                // Tab(text: LocaleKeys.grades.tr()),
                                Tab(text: LocaleKeys.resources.tr()),
                                Tab(text: LocaleKeys.info.tr()),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSize.s07.h),
                          SizedBox(
                            height: AppSize.s100.h,
                            child: TabBarView(
                              children: [
                                HomeTabBarView(
                                  subjectViewModel: _subjectViewModel,
                                  subjectId: widget.subjectId,
                                ),
                                // GradesTabBarView(),
                                ResourcesTabBarView(
                                  subjectViewModel: _subjectViewModel,
                                  subjectId: widget.subjectId,
                                ),
                                InfoTabBarView(
                                  subjectId: widget.subjectId,
                                  subjectViewModel: _subjectViewModel,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppPadding.p4.w),
                    child: InkWell(
                      child: SizedBox(
                        height: AppSize.s4.h,
                        width: AppSize.s4.h,
                        child: TransformWidget(
                            buildContext: context,
                            child: SvgPicture.asset(ImageAssets.arrowIc)),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
