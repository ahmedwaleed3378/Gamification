import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/presentation/register/view/widgets/custom_register_stepper.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

import '../../../generated/locale_keys.g.dart';
import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import '../../widget/custom_button.dart';

class RegisterView6 extends StatefulWidget {
  const RegisterView6({super.key});

  @override
  State<RegisterView6> createState() => _RegisterView6State();
}

class _RegisterView6State extends State<RegisterView6> {
  Artboard? riveArtboard;
  late RiveAnimationController? controllerRobotLogin;

  @override
  void initState() {
    var controllerRobotLogin = SimpleAnimation('Timeline 1');

    rootBundle.load(RiveAssets.celebrateRobot).then((data) {
      try {
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        art.addController(controllerRobotLogin);
        setState(() => riveArtboard = art);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorManager.backGroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: AppSize.s0.h,
              left: AppSize.s5.w,
              right: AppSize.s2.w,
              bottom: AppSize.s2.h,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: AppSize.s94.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: AppSize.s10.h),
                    const RegisterStepper(score: 6),
                    SizedBox(height: AppSize.s15.h),
                    Container(
                      width: AppSize.s75.w,
                      decoration: BoxDecoration(
                        color: ColorManager.backGroundColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(AppSize.s10),
                        ),
                        border: Border.all(
                          color: ColorManager.secondaryText,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(AppPadding.p1_7.h),
                        child: Text(
                          LocaleKeys.wohoo.tr(),
                          textAlign: TextAlign.center,
                          style: getRegularDINNextStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s19.sp,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: AppSize.s75.w,
                    //   child: Bubble(
                    //     borderColor: ColorManager.secondaryText,
                    //     radius: const Radius.circular(AppSize.s10),
                    //     color: ColorManager.transparent,
                    //     // margin: const BubbleEdges.only(top: AppSize.s10),
                    //     // nipOffset: 50,
                    //     // showNip: true,
                    //     child: Padding(
                    //       padding: EdgeInsets.all(AppPadding.p1_5.h),
                    //       child: Text(
                    //         LocaleKeys.wohoo.tr(),
                    //         textAlign: TextAlign.center,
                    //         style: getRegularDINNextStyle(
                    //           color: ColorManager.white,
                    //           fontSize: FontSize.s19.sp,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: AppSize.s5.h),
                    SizedBox(
                      width: AppSize.s25.h,
                      height: AppSize.s25.h,
                      child: riveArtboard != null
                          ? Rive(
                              artboard: riveArtboard!,
                            )
                          : SizedBox.shrink(
                              child: Container(color: ColorManager.dark),
                            ),
                    ),
                    const Spacer(),
                    CustomButtonWidget(
                      onTap: () {
                        // Phoenix.rebirth(context);
                        Navigator.popAndPushNamed(context, Routes.homeRoute);
                      },
                      backGroundColor: ColorManager.primaryColor,
                      borderColor: ColorManager.transparent,
                      shadowColor: ColorManager.orange11,
                      textColor: ColorManager.white,
                      title: LocaleKeys.letsStartJounry.tr(),
                    ),
                    SizedBox(height: AppSize.s10.h)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
