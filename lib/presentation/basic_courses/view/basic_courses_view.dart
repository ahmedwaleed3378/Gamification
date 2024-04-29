import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/subject/view/subject_view.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BasicCoursesView extends StatelessWidget {
  const BasicCoursesView({Key? key}) : super(key: key);
   Future loadList() async {
    //_viewModel.start();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: loadList,
      widgetChild:  Scaffold(
        backgroundColor: ColorManager.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppPadding.p2.h,
              horizontal: AppPadding.p5.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppPadding.p2.w,
                          right: AppPadding.p14.w,
                        ),
                        child: InkWell(
                          child: SizedBox(
                            height: AppSize.s4.h,
                            width: AppSize.s4.h,
                            child: SvgPicture.asset(ImageAssets.arrowIc),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Text(
                        LocaleKeys.basicCourses.tr(),
                        style: getBoldOxygenStyle(
                          color: ColorManager.gray300,
                          fontSize: AppSize.s21.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s4.h),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: basicCourses.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          PersistentNavBarNavigator.pushDynamicScreen(
                            context,
                            screen: MaterialPageRoute(
                              builder: (context) =>  const SubjectView(subjectId: 295,),
                            ),
                            // withNavBar: false,
                          );
                        },
                        child: Card(
                          color: ColorManager.white200,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: AppSize.s9.h,
                                    decoration: BoxDecoration(
                                      color: ColorManager.white,
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s12),
                                      border: Border.all(
                                        color: ColorManager.orange,
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      basicCourses[index]['image'],
                                    ),
                                  ),
                                ),
                                SizedBox(width: AppSize.s4.w),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      SizedBox(height: AppSize.s1_5.h),
                                      Text(
                                        basicCourses[index]['title'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: getMediumSFProDisplayCStyle(
                                          color: ColorManager.black,
                                          fontSize: AppSize.s18.sp,
                                        ),
                                      ),
                                      SizedBox(height: AppSize.s1_5.h),
                                      Row(
                                        children: [
                                          RatingBar(
                                            initialRating: basicCourses[index]
                                                ['rating'] as double,
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
                                            '|  ${basicCourses[index]['student']} students',
                                            style: getRegularPoppinsStyle(
                                              color: ColorManager.gray22,
                                              fontSize: AppSize.s14.sp,
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
                        SizedBox(height: AppSize.s2.h),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List basicCourses = [
  {
    'title': 'HR Management',
    'rating': 4.0,
    'student': 1347,
    'image': 'assets/images/basic_course01.svg',
  },
  {
    'title': 'Project Management',
    'rating': 2.0,
    'student': 1347,
    'image': 'assets/images/basic_course02.svg',
  },
  {
    'title': 'HR Management',
    'rating': 1.0,
    'student': 1347,
    'image': 'assets/images/basic_course01.svg',
  },
  {
    'title': 'Project Management',
    'rating': 5.0,
    'student': 1347,
    'image': 'assets/images/basic_course02.svg',
  },
  {
    'title': 'HR Management',
    'rating': 3.0,
    'student': 1347,
    'image': 'assets/images/basic_course01.svg',
  },
  {
    'title': 'Project Management',
    'rating': 1.0,
    'student': 1347,
    'image': 'assets/images/basic_course02.svg',
  },
];
