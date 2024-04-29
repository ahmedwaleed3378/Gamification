import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/basic_courses/view/basic_courses_view.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

//ignore: must_be_immutable
class LearningCardWidget extends StatelessWidget {
  LearningCardWidget({
    super.key,
    this.data,
    this.finished = false,
  });

  final dynamic data;
  bool finished;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: AppSize.s3.h),
          ListView.separated(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p6.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        PersistentNavBarNavigator.pushDynamicScreen(
                          context,
                          screen: MaterialPageRoute(
                            builder: (context) => const BasicCoursesView(),
                          ),
                        );
                      },
                      child: Container(
                        height: AppSize.s20.h,
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          border: Border.all(
                            color: ColorManager.orange,
                          ),
                        ),
                        child: SvgPicture.asset(
                          data[index]['image'],
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.s1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data[index]['title'],
                          style: getMediumSFProDisplayCStyle(
                            color: ColorManager.black,
                            fontSize: AppSize.s17.sp,
                          ),
                        ),
                        Text(
                          '${data[index]['lesson']} /25',
                          style: getRegularPoppinsStyle(
                            color: ColorManager.black,
                            fontSize: AppSize.s14.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.s1.h),
                    Padding(
                      padding: EdgeInsets.only(
                        right: AppPadding.p26.w,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        child: StepProgressIndicator(
                          totalSteps: 25,
                          currentStep: data[index]['lesson'],
                          size: AppSize.s10,
                          padding: AppSize.s0,
                          selectedColor: ColorManager.orange,
                          unselectedColor: ColorManager.blue400,
                          roundedEdges: const Radius.circular(AppSize.s10),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.s1.h),
                    Text(
                      'Instructor | ${data[index]['instructor']}',
                      style: getMediumInterStyle(
                        color: ColorManager.gray700,
                        fontSize: AppSize.s13_5.sp,
                      ),
                    ),
                    SizedBox(height: AppSize.s1.h),
                    MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppSize.s12,
                        ),
                      ),
                      color: ColorManager.orange,
                      child: !finished
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  LocaleKeys.continueLearning.tr(),
                                  style: getSemiBoldInterStyle(
                                    color: ColorManager.white,
                                    fontSize: AppSize.s15.sp,
                                  ),
                                ),
                                SizedBox(width: AppSize.s2.w),
                                Image(
                                  image: const AssetImage(
                                    ImageAssets.arrowIcon,
                                  ),
                                  width: AppSize.s6.w,
                                  height: AppSize.s5.h,
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  LocaleKeys.downloadCertificate.tr(),
                                  style: getSemiBoldInterStyle(
                                    color: ColorManager.white,
                                    fontSize: AppSize.s15.sp,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: AppSize.s3.h),
          ),
        ],
      ),
    );
  }
}
