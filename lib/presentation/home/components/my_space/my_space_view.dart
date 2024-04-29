import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/courses/courses_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/functions.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/course/view/course_view.dart';
import 'package:gamification/presentation/home/components/my_space/myspace_shimmer.dart';
import 'package:gamification/presentation/home/viewmodel/home_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/subject/view/subject_view.dart';
import 'package:gamification/presentation/widget/network_image_widget.dart';
import 'package:gamification/presentation/widget/profile_photo_widget.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sticky_headers/sticky_headers.dart';

class MySpaceScreen extends StatefulWidget {
  const MySpaceScreen({super.key});

  @override
  State<MySpaceScreen> createState() => _MySpaceScreenState();
}

class _MySpaceScreenState extends State<MySpaceScreen> {
  final HomeViewModel _homeViewModel = instance<HomeViewModel>();

  _bind() {
    _homeViewModel.start();
    _homeViewModel.getCourses();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _homeViewModel.outputState,
      builder: (context, snapshot) {
        return snapshot.data
                ?.getScreenWidget(context, _getContentWidget(), () {}) ??
            _getContentWidget();
      },
    );
  }

  Future loadList() async {
    _homeViewModel.getCourses();
  }

  Widget _getContentWidget() {
    return Padding(
      padding: EdgeInsets.all(AppSize.s4.h),
      child: RefreshWidget(
        onRefresh: loadList,
        widgetChild: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(AppSize.s80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileWidget(
                  photoSize: AppSize.s8.h,
                  networkImage: _homeViewModel.userImage,
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.profileRoute);
                  },
                ),
                SizedBox(width: AppSize.s3.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LocaleKeys.welcome.tr(),
                      style: getRegularOxygenStyle(
                        color: ColorManager.greyIshBrown,
                        fontSize: AppSize.s15.sp,
                      ),
                    ),
                    Text(
                      _homeViewModel.userName,
                      style: getBoldOxygenStyle(
                        color: ColorManager.black,
                        fontSize: AppSize.s18.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(top: AppMargin.m2.h),
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: StickyHeader(
                header: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: AppPadding.p1.h),
                  child: Text(
                    LocaleKeys.courses.tr(),
                    style: getBoldOxygenStyle(
                      color: ColorManager.black,
                      fontSize: AppSize.s19.sp,
                    ),
                  ),
                ),
                // const SizedBox(height: AppSize.s8),
                content: StreamBuilder<CoursesModel>(
                  stream: _homeViewModel.outputCourses,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.basicCoursesList!.isEmpty &&
                              snapshot.data!.recommendedCoursesList!.isEmpty
                          ? SizedBox(
                              height: AppSize.s100.h,
                              width: AppSize.s100.h,
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
                            )
                          : AnimationLimiter(
                              child: GridView.count(
                                padding: EdgeInsets.only(top: AppPadding.p2.h),
                                shrinkWrap: true,
                                primary: Platform.isIOS ? false : true,
                                physics: const BouncingScrollPhysics(),
                                childAspectRatio: 1.0 / 1.70,
                                crossAxisCount: AppSize.s2.toInt(),
                                mainAxisSpacing: AppSize.s22,
                                crossAxisSpacing: AppSize.s16,
                                children: List.generate(
                                  snapshot.data!.basicCoursesList!.length,
                                  (int index) {
                                    return AnimationConfiguration.staggeredGrid(
                                      columnCount: AppSize.s2.toInt(),
                                      position: index,
                                      duration: Duration(
                                          milliseconds: AppSize.s500.toInt()),
                                      child: ScaleAnimation(
                                        scale: AppSize.s05,
                                        child: FadeInAnimation(
                                          child: InkWell(
                                            onTap: () {
                                              PersistentNavBarNavigator
                                                  .pushDynamicScreen(
                                                context,
                                                screen: MaterialPageRoute(
                                                  builder: (context) =>
                                                      CourseView(
                                                    courseContentModel: snapshot
                                                            .data!
                                                            .basicCoursesList![
                                                        index],
                                                  ),
                                                ),
                                                withNavBar: false,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSize.s12),
                                                color: ColorManager.paleGrey,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: AppPadding.p12,
                                              ).copyWith(top: AppPadding.p2.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: AppSize.s10.h,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: ColorManager.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              AppSize.s12),
                                                      border: Border.all(
                                                        color:
                                                            ColorManager.orange,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    AppSize
                                                                        .s12),
                                                        child:
                                                            NetworkImageWidget(
                                                          url: snapshot
                                                              .data!
                                                              .basicCoursesList![
                                                                  index]
                                                              .attachPath,
                                                          height: AppSize.s14.h,
                                                          width: AppSize.s14.h,
                                                          errorChild:
                                                              SvgPicture.asset(
                                                            ImageAssets
                                                                .noImageCourse,
                                                            width:
                                                                AppSize.s14.h,
                                                            height:
                                                                AppSize.s14.h,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )),
                                                  ),
                                                  SizedBox(
                                                      height: AppSize.s1.h),
                                                  Text(
                                                    Functions.isRTL(context)
                                                        ? snapshot
                                                            .data!
                                                            .basicCoursesList![
                                                                index]
                                                            .subjectArName
                                                        : snapshot
                                                            .data!
                                                            .basicCoursesList![
                                                                index]
                                                            .subjectEnName,
                                                    maxLines:
                                                        AppSize.s2.toInt(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: getBoldOxygenStyle(
                                                      color: ColorManager
                                                          .greyIshBrown,
                                                      fontSize: AppSize.s14.sp,
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: snapshot
                                                            .data!
                                                            .basicCoursesList![
                                                                index]
                                                            .diplomaArName
                                                            .isNotEmpty ||
                                                        snapshot
                                                            .data!
                                                            .basicCoursesList![
                                                                index]
                                                            .diplomaEnName
                                                            .isNotEmpty,
                                                    child: Text(
                                                      Functions.isRTL(context)
                                                          ? snapshot
                                                              .data!
                                                              .basicCoursesList![
                                                                  index]
                                                              .diplomaArName
                                                          : snapshot
                                                              .data!
                                                              .basicCoursesList![
                                                                  index]
                                                              .diplomaEnName,
                                                      maxLines:
                                                          AppSize.s2.toInt(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          getRegularOxygenStyle(
                                                        color: ColorManager
                                                            .greyIshBrown,
                                                        fontSize:
                                                            AppSize.s14.sp,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '${snapshot.data!.basicCoursesList![index].isArabic ? LocaleKeys.arabic.tr() : ''}'
                                                    '${(snapshot.data!.basicCoursesList![index].isEnglish && snapshot.data!.basicCoursesList![index].isArabic) ? ' - ' : ''}'
                                                    '${snapshot.data!.basicCoursesList![index].isEnglish ? LocaleKeys.english.tr() : ''}',
                                                    style: getBoldOxygenStyle(
                                                      color: ColorManager.black,
                                                      fontSize: AppSize.s14.sp,
                                                    ),
                                                  ),
                                                  Text.rich(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                '${snapshot.data!.basicCoursesList![index].isBasic ? LocaleKeys.basic.tr() : LocaleKeys.recommended.tr()} ',
                                                            style: getRegularOxygenStyle(
                                                                color: snapshot
                                                                        .data!
                                                                        .basicCoursesList![
                                                                            index]
                                                                        .isBasic
                                                                    ? ColorManager
                                                                        .green
                                                                    : ColorManager
                                                                        .blue,
                                                                fontSize:
                                                                    AppSize.s14
                                                                        .sp)),
                                                        TextSpan(
                                                            text: snapshot
                                                                    .data!
                                                                    .basicCoursesList![
                                                                        index]
                                                                    .isCurrent
                                                                ? ' - ${LocaleKeys.current.tr()}'
                                                                : '',
                                                            style: getRegularOxygenStyle(
                                                                color:
                                                                    ColorManager
                                                                        .orange,
                                                                fontSize:
                                                                    AppSize.s14
                                                                        .sp)),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        child: ElevatedButton(
                                                          onPressed: snapshot
                                                                  .data!
                                                                  .basicCoursesList![
                                                                      index]
                                                                  .isCurrent
                                                              ? () {
                                                                  // Navigator.of(
                                                                  //         context)
                                                                  //     .pushNamed(
                                                                  //         Routes
                                                                  //             .subjectRoute,arguments: snapshot
                                                                  //     .data!
                                                                  //     .basicCoursesList![
                                                                  // index]
                                                                  //     .subjectId);
                                                                  PersistentNavBarNavigator
                                                                      .pushDynamicScreen(
                                                                    context,
                                                                    screen:
                                                                        MaterialPageRoute(
                                                                      builder: (context) => SubjectView(
                                                                          subjectId: snapshot
                                                                              .data!
                                                                              .basicCoursesList![index]
                                                                              .subjectId),
                                                                    ),
                                                                    withNavBar:
                                                                        false,
                                                                  );
                                                                }
                                                              : null,
                                                          child: Text(
                                                            LocaleKeys.enter
                                                                .tr(),
                                                            style:
                                                                getSemiBoldInterStyle(
                                                              color:
                                                                  ColorManager
                                                                      .whiteTwo,
                                                              fontSize: AppSize
                                                                  .s16.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                    } else {
                      return const MySpaceShimmer();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }
}
