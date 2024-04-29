import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class FailTestView extends StatefulWidget {
  const FailTestView({Key? key}) : super(key: key);

  @override
  State<FailTestView> createState() => _FailTestViewState();
}

class _FailTestViewState extends State<FailTestView> {
  Artboard? riveArtBoard;
  late RiveAnimationController controllerRobot;

  @override
  void initState() {
    super.initState();
    var controllerRobot = SimpleAnimation('');

    rootBundle.load(RiveAssets.taslimaRobot).then((data) {
      final file = RiveFile.import(data);
      final art = file.mainArtboard;

      art.addController(controllerRobot);
      setState(() => riveArtBoard = art);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controllerRobot.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.resultBackground),
          ),
        ),
        child: _getContentWidget(),
      ),
    );
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Stack(
          children: [
            riveArtBoard != null
                ? Container(
                  margin: EdgeInsets.only(right: AppSize.s35.w),
                    transform: Matrix4.translationValues(
                      AppSize.s8.h,
                      AppSize.s12.h,
                      AppSize.s0,
                    ),
                    height: AppSize.s30.h,
                    width: AppSize.s30.h,
                    child: Rive(artboard: riveArtBoard!),
                  )
                : SvgPicture.asset(
                    ImageAssets.robot,
                    height: AppSize.s20.h,
                  ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p5.w,
                vertical: AppPadding.p2.h,
              ),
              child: Column(
                children: [
                  SizedBox(height: AppSize.s30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p24.w,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p4.w,
                      ),
                      margin: EdgeInsets.only(top: AppMargin.m1.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: ColorManager.transparent,
                        border: Border.all(
                          width: AppSize.s2.w,
                          color: ColorManager.orangeyRed,
                        ),
                        borderRadius: BorderRadius.circular(AppSize.s50),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: AppSize.s07.h),
                          Text(
                            'Grade',
                            style: getBoldOxygenStyle(
                              color: ColorManager.orangeyRed,
                              fontSize: AppSize.s18.sp,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '05 ',
                                style: getBoldOxygenStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s23.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '/20',
                                style: getBoldOxygenStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s17.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.s07.h),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s6.h),
                  Text(
                    'Oops! You did n\'t pass',
                    style: getMediumDINNextStyle(
                      color: ColorManager.lightBlue,
                      fontSize: AppSize.s22.sp,
                    ),
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Text(
                    'keep practicing to achieve better results!',
                    style: getRegularDINNextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s16.sp,
                    ),
                  ),
                  SizedBox(height: AppSize.s11.h),
                  CustomButtonWidget(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.homeRoute,
                      );
                    },
                    shadowColor: ColorManager.terracota,
                    borderColor: ColorManager.terracota,
                    backGroundColor: ColorManager.terracota,
                    title: LocaleKeys.continu.tr(),
                    height: AppSize.s7.h,
                    textColor: ColorManager.dark,
                    style: getMediumDINNextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s21.sp,
                    ),
                  ),
                  SizedBox(height: AppSize.s3.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p12.w,
                    ),
                    child: CustomButtonWidget(
                      onTap: () {

                      },
                      shadowColor: ColorManager.maize.withOpacity(0.9),
                      borderColor: ColorManager.maize.withOpacity(0.9),
                      backGroundColor: ColorManager.maize.withOpacity(0.9),
                      title: 'Review',
                      height: AppSize.s6_5.h,
                      textColor: ColorManager.dark,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sync,
                            color: ColorManager.dark,
                          ),
                          SizedBox(width: AppSize.s3.w),
                          Text(
                            'Review',
                            style: getRegularDINNextStyle(
                              color: ColorManager.dark,
                              fontSize: AppSize.s21.sp,
                            ),
                          ),
                        ],
                      ),
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
}
