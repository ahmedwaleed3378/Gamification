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

class LoginClaimGiftView extends StatefulWidget {
  final String title;
  final String subTitle;
  final String buttonTitle;

  const LoginClaimGiftView({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.buttonTitle,
  }) : super(key: key);

  @override
  State<LoginClaimGiftView> createState() => _LoginClaimGiftViewState();
}

class _LoginClaimGiftViewState extends State<LoginClaimGiftView> {
  Artboard? riveArtBoard;
  late RiveAnimationController controllerRobot;

  @override
  void initState() {
    super.initState();
    var controllerRobot = SimpleAnimation('robot welcome user');

    rootBundle.load(RiveAssets.taslimaRobot2).then((data) {
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
      body: _getContentWidget(),
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
                    transform: Matrix4.translationValues(
                      AppSize.s0,
                      -AppSize.s5.h,
                      AppSize.s0,
                    ),
                    height: AppSize.s100.h,
                    width: AppSize.s100.w,
                    child: Rive(
                      artboard: riveArtBoard!,
                      // fit: BoxFit.contain,
                    ),
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
                  SizedBox(height: AppSize.s60.h),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: getMediumDINNextStyle(
                      color: ColorManager.maize,
                      fontSize: AppSize.s28.sp,
                    ),
                  ),
                  SizedBox(height: AppSize.s4.h),
                  Text(
                    widget.subTitle,
                    textAlign: TextAlign.center,
                    style: getMediumDINNextStyle(
                      color: ColorManager.lightBlue,
                      fontSize: AppSize.s20.sp,
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
                    textColor: ColorManager.white,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Claim the gift',
                          style: getMediumDINNextStyle(
                            color: ColorManager.white,
                            fontSize: AppSize.s21.sp,
                          ),
                        ),
                        SizedBox(width: AppSize.s2.w),
                        SvgPicture.asset(
                          ImageAssets.gemBlueIcon,
                          width: AppSize.s9.w,
                        ),
                      ],
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
