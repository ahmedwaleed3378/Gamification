import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/cutom_back_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class FinalConfirmPasswordView extends StatefulWidget {
  const FinalConfirmPasswordView({Key? key, required this.forgetPasswordPageController}) : super(key: key);
  final PageController forgetPasswordPageController;

  @override
  State<FinalConfirmPasswordView> createState() => _FinalConfirmPasswordViewState();
}

class _FinalConfirmPasswordViewState extends State<FinalConfirmPasswordView> {
  Artboard? riveArtboard;
  late  RiveAnimationController controllerRobotForgetPassword;

  @override
  void initState() {
    super.initState();
    controllerRobotForgetPassword = SimpleAnimation('idle');
    rootBundle.load(RiveAssets.taslimaRobot).then((data) {
      try{
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        art.addController(controllerRobotForgetPassword);
        setState(() => riveArtboard = art);
      }catch(e){debugPrint(e.toString());}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _getContentWidget()
    );
  }

  Widget _getContentWidget() {
    return WillPopScope(
      onWillPop: () async{
        widget.forgetPasswordPageController.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.linear);

        return false;
      },
      child: Scaffold(
        backgroundColor: ColorManager.dark,
        appBar:  AppBar(
            elevation: 0.0,
            backgroundColor: ColorManager.dark,
            leading:  CustomBackButton(onTap: () => widget.forgetPasswordPageController.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.linear))
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              padding:  EdgeInsets.symmetric(horizontal: AppPadding.p035.dp).copyWith(
                top:  AppSize.s6.h
            ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(
                    width: AppSize.s15.h, height: AppSize.s20.h,
                    child: riveArtboard != null
                        ? Rive(
                      artboard: riveArtboard!,
                    )
                        : SizedBox.shrink(
                      child: Container(color: ColorManager.dark),
                    ),
                  ),
                  SizedBox(height: AppSize.s2.h,),

                  Text(
                    LocaleKeys.passwordChanged.tr(),
                    style: getMediumDINNextStyle(color:ColorManager.maize ,fontSize: AppSize.s24.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSize.s2.h),

                  Text(
                    LocaleKeys.changeSuccessfully.tr(),
                    style: getRegularInterStyle(color:ColorManager.white ,fontSize: AppSize.s18.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: AppSize.s15.h,
                  ),
                  CustomButtonWidget(
                    onTap:
                        () {
                      Navigator.pushNamedAndRemoveUntil(context, Routes.goStartView, (route) => false);
                        },
                    shadowColor: ColorManager.terracota,
                    borderColor: ColorManager.terracota,
                    backGroundColor: ColorManager.terracota,
                    title: LocaleKeys.backToLogin.tr(),
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

  @override
  void dispose() {
    super.dispose();
  }
}
