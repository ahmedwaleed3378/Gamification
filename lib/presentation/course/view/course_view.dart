import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/domain/model/courses/courses_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/functions.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/subject/view/subject_view.dart';
import 'package:gamification/presentation/widget/network_image_widget.dart';
import 'package:gamification/presentation/widget/transform_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widget/refresh_indicator_widget.dart';

//ignore: must_be_immutable
class CourseView extends StatelessWidget {
  CourseContentModel? courseContentModel;

  CourseView({
    Key? key,
    this.courseContentModel,
  }) : super(key: key);
   Future loadList() async {
   // _viewModel.start();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh:loadList ,
      widgetChild: Scaffold(
        backgroundColor: ColorManager.white,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p7.w,
                    vertical: AppPadding.p4.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          child: NetworkImageWidget(
                            url: courseContentModel!.attachPath,
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
                      ),
                      SizedBox(height: AppSize.s2.h),
                      Text(
                        Functions.isRTL(context)
                            ? courseContentModel!.subjectArName
                            : courseContentModel!.subjectEnName,
                        style: getBoldOxygenStyle(
                          color: ColorManager.black,
                          fontSize: AppSize.s20.sp,
                        ),
                      ),
                      SizedBox(height: AppSize.s1_5.h),
                      Text(
                        courseContentModel!.subjectDescreption,
                        style: getRegularOxygenStyle(
                          color: ColorManager.blue600,
                          fontSize: AppSize.s14.sp,
                        ),
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: courseContentModel!.isCurrent
                              ? () {
                                  PersistentNavBarNavigator.pushDynamicScreen(
                                    context,
                                    screen: MaterialPageRoute(
                                      builder: (context) => SubjectView(
                                          subjectId:
                                              courseContentModel!.subjectId),
                                    ),
                                    withNavBar: false,
                                  );
                                }
                              : null,
                          child: Text(
                            courseContentModel!.isCurrent ?LocaleKeys.currentCourse.tr():LocaleKeys.notCurrentCourse.tr(),
                            style: getSemiBoldInterStyle(
                              color: ColorManager.whiteTwo,
                              fontSize: AppSize.s16.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: AppSize.s1.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p2.w,
                          vertical: AppPadding.p1.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          border: Border.all(
                            color: ColorManager.orange,
                            width: AppSize.s05.w,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '4.0',
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.black,
                                    fontSize: AppSize.s15.sp,
                                  ),
                                ),
                                SizedBox(width: AppSize.s1.w),
                                RatingBar(
                                  initialRating: 4.0,
                                  ignoreGestures: true,
                                  itemSize: AppSize.s15,
                                  unratedColor: ColorManager.orange,
                                  onRatingUpdate: (rating) {},
                                  ratingWidget: RatingWidget(
                                    full: Icon(
                                      Icons.star_rounded,
                                      color: ColorManager.orange,
                                    ),
                                    half: Icon(
                                      Icons.star_border_rounded,
                                      color: ColorManager.orange,
                                    ),
                                    empty: Icon(
                                      Icons.star_border,
                                      color: ColorManager.orange,
                                    ),
                                  ),
                                ),
                                SizedBox(width: AppSize.s1_5.w),
                                Text(
                                  '(4,546 ratings)',
                                  style: getRegularOxygenStyle(
                                    color: ColorManager.blue600,
                                    fontSize: AppSize.s13_5.sp,
                                  ),
                                ),
                                SizedBox(width: AppSize.s5.w),
                                Text(
                                  '${courseContentModel!.subjectUserNumbers} ${LocaleKeys.student.tr()}',
                                  style: getRegularOxygenStyle(
                                    color: ColorManager.blue600,
                                    fontSize: AppSize.s13_5.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSize.s1_5.h),
                            Row(
                              children: [
                                Text(
                                  LocaleKeys.createdBy.tr(),
                                  style: getRegularOxygenStyle(
                                    color: ColorManager.blue600,
                                    fontSize: AppSize.s15.sp,
                                  ),
                                ),
                                SizedBox(width: AppSize.s1.w),
                                Text(
                                  courseContentModel!.teacherArName,
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.orange,
                                    fontSize: AppSize.s15.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSize.s1_5.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.language_outlined,
                                  color: ColorManager.orange,
                                ),
                                SizedBox(width: AppSize.s1.w),
                                Text(
                                  '${courseContentModel!.isEnglish ? LocaleKeys.english.tr() : ''} '
                                  '${courseContentModel!.isArabic ? ', ${LocaleKeys.arabic.tr()}' : ''}',
                                  style: getRegularOxygenStyle(
                                    color: ColorManager.blue600,
                                    fontSize: AppSize.s15.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSize.s1_5.h),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSize.s1.h),
                      Visibility(
                        visible: courseContentModel!.whatYouLearn!.isNotEmpty,
                        child: Card(
                          color: ColorManager.gray900,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSize.s12),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(AppPadding.p1.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(height: AppSize.s1.h),
                                Text(
                                  LocaleKeys.whatYouLearn.tr(),
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.black100,
                                    fontSize: AppSize.s18.sp,
                                  ),
                                ),
                                SizedBox(height: AppSize.s1.h),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      courseContentModel!.whatYouLearn!.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          ImageAssets.check,
                                          color: ColorManager.orange,
                                          width: AppSize.s6.w,
                                        ),
                                        SizedBox(width: AppSize.s2.w),
                                        Flexible(
                                          child: Text(
                                            courseContentModel!
                                                .whatYouLearn![index],
                                            style: getRegularDMSansStyle(
                                              color: ColorManager.blue600,
                                              fontSize: AppSize.s14.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: AppSize.s2.h),
                                ),
                                SizedBox(height: AppSize.s1.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: AppSize.s1.h),
                      Text(
                        LocaleKeys.courseInclude.tr(),
                        style: getBoldOxygenStyle(
                          color: ColorManager.black100,
                          fontSize: AppSize.s18.sp,
                        ),
                      ),
                      SizedBox(height: AppSize.s1.h),
                      Row(
                        children: [
                          Icon(
                            Icons.ondemand_video,
                            color: ColorManager.orange,
                          ),
                          SizedBox(width: AppSize.s2.w),
                          Text(
                            '${courseContentModel!.courseMinutes / 60} ${LocaleKeys.hrsOnDemand.tr()}',
                            style: getRegularInterStyle(
                              color: ColorManager.black200,
                              fontSize: AppSize.s14.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.s1.h),
                      Row(
                        children: [
                          Icon(
                            Icons.featured_play_list,
                            color: ColorManager.orange,
                          ),
                          SizedBox(width: AppSize.s2.w),
                          Text(
                            '${courseContentModel!.exams} ${LocaleKeys.quiz.tr()}',
                            style: getRegularInterStyle(
                              color: ColorManager.black200,
                              fontSize: AppSize.s14.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.s1.h),
                      Row(
                        children: [
                          Icon(
                            Icons.cloud_download_rounded,
                            color: ColorManager.orange,
                          ),
                          SizedBox(width: AppSize.s2.w),
                          Text(
                            '${courseContentModel!.files} ${LocaleKeys.downloadable.tr()}',
                            style: getRegularInterStyle(
                              color: ColorManager.black200,
                              fontSize: AppSize.s14.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.s1.h),
                      Visibility(
                        visible: courseContentModel!.courseCertificate,
                        child: Row(
                          children: [
                            Icon(
                              Icons.file_copy,
                              color: ColorManager.orange,
                            ),
                            SizedBox(width: AppSize.s2.w),
                            Text(
                              LocaleKeys.certificateCompletion.tr(),
                              style: getRegularInterStyle(
                                color: ColorManager.black200,
                                fontSize: AppSize.s14.sp,
                              ),
                            ),
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
        bottomNavigationBar: Card(
          margin: EdgeInsets.zero,
          color: ColorManager.orange,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.s12),
              topRight: Radius.circular(AppSize.s12),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppPadding.p1.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.enrollNow.tr(),
                  style: getMediumSFProDisplayCStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s20.sp,
                  ),
                ),
                Text(
                  'Start by April 15',
                  style: getMediumSFProDisplayCStyle(
                    color: ColorManager.black300,
                    fontSize: AppSize.s15.sp,
                  ),
                ),
                SizedBox(height: AppSize.s1.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
