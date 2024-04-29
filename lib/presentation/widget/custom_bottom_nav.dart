import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/home/viewmodel/home_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomBottomNav extends StatelessWidget {
  final HomeViewModel homeViewModel;

  const CustomBottomNav({Key? key, required this.homeViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: homeViewModel.outputBottomNavIndex,
        builder: (context, snapshot) {
          return Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s6.h),
                  topRight: Radius.circular(AppSize.s6.h)),
              child: SizedBox(
                height: AppSize.s10.h,
                child: BottomNavigationBar(
                  selectedLabelStyle: getMediumInterStyle(
                      color: ColorManager.deepSkyBlue,
                      fontSize: AppSize.s14.sp),
                  unselectedLabelStyle: getMediumInterStyle(
                      color: ColorManager.greyDark, fontSize: AppSize.s14.sp),
                  currentIndex: snapshot.data ?? 0,
                  onTap: (value) {
                    homeViewModel.changeBottomNav(value);
                  },
                  backgroundColor: ColorManager.babyBlu2,
                  items: [
                    BottomNavigationBarItem(
                      icon: (snapshot.data ?? 0) == 0
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSize.s1.h,
                                  horizontal: AppSize.s4.w),
                              decoration: BoxDecoration(
                                  color: ColorManager.babyBluLight,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s2.h)),
                              child: SvgPicture.asset(
                                ImageAssets.filledHome,
                                width: AppSize.s3.h,
                                height: AppSize.s3.h,
                              ),
                            )
                          : SvgPicture.asset(
                              ImageAssets.unFilledHome,
                              width: AppSize.s2_5.h,
                              height: AppSize.s2_5.h,
                            ),
                      label: LocaleKeys.mySpace,
                    ),
                    BottomNavigationBarItem(
                        icon: (snapshot.data ?? 0) == 1
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppSize.s1.h,
                                    horizontal: AppSize.s4.w),
                                decoration: BoxDecoration(
                                    color: ColorManager.babyBluLight,
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s2.h)),
                                child: SvgPicture.asset(
                                  ImageAssets.filledTeachRequest,
                                  width: AppSize.s3.h,
                                  height: AppSize.s3.h,
                                ),
                              )
                            : SvgPicture.asset(
                                ImageAssets.unFilledTeachRequest,
                                width: AppSize.s2_5.h,
                                height: AppSize.s2_5.h,
                              ),
                        label: LocaleKeys.teachingRequests),
                    BottomNavigationBarItem(
                      icon: (snapshot.data ?? 0) == 2
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSize.s1.h,
                                  horizontal: AppSize.s4.w),
                              decoration: BoxDecoration(
                                  color: ColorManager.babyBluLight,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s2.h)),
                              child: SvgPicture.asset(
                                ImageAssets.filledGift,
                                width: AppSize.s3.h,
                                height: AppSize.s3.h,
                              ),
                            )
                          : SvgPicture.asset(
                              ImageAssets.unFilledGift,
                              width: AppSize.s2_5.h,
                              height: AppSize.s2_5.h,
                            ),
                      label: LocaleKeys.gifts,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

List<PersistentBottomNavBarItem> navBarsItems() => [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          ImageAssets.homeIcon,
          color: ColorManager.orange,
        ),
        inactiveIcon: SvgPicture.asset(ImageAssets.homeIcon),
        title: LocaleKeys.mySpace.tr(),
        activeColorPrimary: ColorManager.orange,
        inactiveColorPrimary: ColorManager.gray200,
      ),
      // PersistentBottomNavBarItem(
      //   icon: SvgPicture.asset(
      //     ImageAssets.learningIcon,
      //     color: ColorManager.orange,
      //   ),
      //   inactiveIcon: SvgPicture.asset(ImageAssets.learningIcon),
      //   title: LocaleKeys.myLearning.tr(),
      //   activeColorPrimary: ColorManager.orange,
      //   inactiveColorPrimary: ColorManager.gray200,
      // ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          ImageAssets.requestIcon,
          color: ColorManager.orange,
        ),
        inactiveIcon: SvgPicture.asset(ImageAssets.requestIcon),
        title: LocaleKeys.request.tr(),
        activeColorPrimary: ColorManager.orange,
        inactiveColorPrimary: ColorManager.gray200,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          ImageAssets.giftIcon,
          color: ColorManager.orange,
        ),
        inactiveIcon: SvgPicture.asset(ImageAssets.giftIcon),
        title: LocaleKeys.giftGallery.tr(),
        activeColorPrimary: ColorManager.orange,
        inactiveColorPrimary: ColorManager.gray200,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          ImageAssets.profileIcon,
          color: ColorManager.orange,
        ),
        inactiveIcon: SvgPicture.asset(ImageAssets.profileIcon),
        title: LocaleKeys.profile.tr(),
        activeColorPrimary: ColorManager.orange,
        inactiveColorPrimary: ColorManager.gray200,
      ),
    ];
