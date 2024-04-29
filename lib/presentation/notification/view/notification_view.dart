import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  Artboard? riveArtBoard;

  @override
  void initState() {
    super.initState();
    var controllerRobot = SimpleAnimation('notifications');

    rootBundle.load(RiveAssets.notificationsRobot).then(
      (data) {
        try {
          final file = RiveFile.import(data);
          final art = file.mainArtboard;

          art.addController(controllerRobot);
          setState(() => riveArtBoard = art);
        } catch (e) {
          debugPrint(e.toString());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack(
        children: [
          riveArtBoard != null
              ? Container(
                  transform: Matrix4.translationValues(
                    AppSize.s30.w,
                    AppSize.s16.h,
                    AppSize.s0,
                  ),
                  height: AppSize.s20.h,
                  width: AppSize.s20.h,
                  child: Rive(
                    artboard: riveArtBoard!,
                  ),
                )
              : SvgPicture.asset(
                  ImageAssets.robot,
                  height: AppSize.s20.h,
                  width: AppSize.s20.h,
                ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p5.w,
              vertical: AppPadding.p2.h,
            ),
            child: Column(
              children: [
                SizedBox(height: AppSize.s6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: AppSize.s4.h,
                        color: ColorManager.terracota,
                      ),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      LocaleKeys.notifications.tr(),
                      textAlign: TextAlign.center,
                      style: getMediumDINNextStyle(
                        color: ColorManager.terracota,
                        fontSize: AppSize.s23.sp,
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
                SizedBox(height: AppSize.s18.h),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: notificationsData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: ColorManager.dark,
                      elevation: AppSize.s5,
                      shadowColor: ColorManager.dark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p5.w,
                          vertical: AppPadding.p3.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(notificationsData[index]['icon']),
                            SizedBox(width: AppSize.s4.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notificationsData[index]['title'],
                                    style: getSemiBoldInterStyle(
                                      color: ColorManager.lightBlue,
                                      fontSize: AppSize.s17.sp,
                                    ),
                                  ),
                                  SizedBox(height: AppSize.s1.h),
                                  Text(
                                    notificationsData[index]['subTitle'],
                                    style: getRegularInterStyle(
                                      color: ColorManager.steel50,
                                      fontSize: AppSize.s13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              notificationsData[index]['duration'],
                              style: getRegularInterStyle(
                                color: ColorManager.maize,
                                fontSize: AppSize.s15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: AppSize.s2.h);
                  },
                ),
                SizedBox(height: AppSize.s5.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

List notificationsData = [
  {
    'icon': ImageAssets.timerFillIcon,
    'title': 'Math Quiz',
    'subTitle': 'Lorem ipsum dolor sit amet consectetur',
    'duration': '5 min',
  },
  {
    'icon': ImageAssets.cupGoldIcon,
    'title': 'New Challenge available',
    'subTitle': 'Lorem ipsum dolor sit amet consectetur',
    'duration': '3 h',
  },
  {
    'icon': ImageAssets.messagePurpleIcon,
    'title': 'Task assigned to you',
    'subTitle': 'Lorem ipsum dolor sit amet consectetur',
    'duration': '16 h',
  },
  {
    'icon': ImageAssets.starGreenIcon,
    'title': 'Level up',
    'subTitle': 'Lorem ipsum dolor sit amet consectetur',
    'duration': '3 w',
  },
];
