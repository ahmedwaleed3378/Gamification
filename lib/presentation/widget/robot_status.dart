import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class RobotStatusView extends StatefulWidget {
  final String title;
  final String subTitle;
  final String buttonTitle;

  const RobotStatusView({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.buttonTitle,
  }) : super(key: key);

  @override
  State<RobotStatusView> createState() => _RobotStatusViewState();
}

class _RobotStatusViewState extends State<RobotStatusView> {
  Artboard? riveArtBoard;
  late RiveAnimationController controllerCelebrateRobot;

  @override
  void initState() {
    super.initState();
    var controllerCelebrateRobot = SimpleAnimation('Timeline 1');

    rootBundle.load(RiveAssets.celebrateRobot).then((data) {
      final file = RiveFile.import(data);
      final art = file.mainArtboard;
      art.addController(controllerCelebrateRobot);
      setState(() => riveArtBoard = art);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controllerCelebrateRobot.dispose();
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
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSize.s15.h,
              ),
              child: SizedBox(
                child: SvgPicture.asset(
                  ImageAssets.backgroundCube,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p5.w,
                vertical: AppPadding.p2.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: AppSize.s17.h),
                  Center(
                    child: SizedBox(
                      height: AppSize.s30.h,
                      width: AppSize.s30.h,
                      child: riveArtBoard != null
                          ? Rive(
                        artboard: riveArtBoard!,
                      )
                          : SvgPicture.asset(
                        ImageAssets.robot,
                        height: AppSize.s25.h,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s7.h),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: getMediumDINNextStyle(
                      color: ColorManager.lightBlue,
                      fontSize: AppSize.s25.sp,
                    ),
                  ),
                  SizedBox(height: AppSize.s4.h),
                  Text(
                    widget.subTitle,
                    textAlign: TextAlign.center,
                    style: getMediumDINNextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s18.sp,
                    ),
                  ),
                  SizedBox(height: AppSize.s5.h),
                  CustomButtonWidget(
                    height: AppSize.s7.h,
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.homeRoute);
                    },
                    shadowColor: ColorManager.terracota,
                    borderColor: ColorManager.terracota,
                    backGroundColor: ColorManager.terracota,
                    title: widget.buttonTitle,
                    style: getMediumDINNextStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s20.sp,
                    ),
                    textColor: ColorManager.white,
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
