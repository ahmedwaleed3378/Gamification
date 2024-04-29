import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/language/view/language_view.dart';

import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';

import 'package:gamification/presentation/widget/global_logo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  Timer? _timer;
  Artboard? riveArtboard;
  late RiveAnimationController controllerSplash;
  bool rocketLoaded = false;
  bool fistSplashViewed = false;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 6), _goNext);
  }

  _goNext() {
    _appPreferences.isUserLoggedIn().then((isUserLogin) => {
          if (isUserLogin)
            {
              //   Navigator.pushReplacementNamed(context, Routes.homeRoute)
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.homeRoute, (route) => false)
            }
          else
            {
              _appPreferences.getOnBoardingViewed().then((isViewed) {
                isViewed
                    ? Navigator.pushNamedAndRemoveUntil(
                        context, Routes.goStartView, (route) => false)
                    : Navigator.pushNamedAndRemoveUntil(
                        context, Routes.languageRoute, (route) => false);
              })
            }
        });
  }

  @override
  void initState() {
    super.initState();
    controllerSplash = SimpleAnimation('starting splash');
    rootBundle.load('assets/rive/taslim.riv').then((data) {
      final file = RiveFile.import(data);
      final art = file.mainArtboard;
      art.addController(controllerSplash);
      riveArtboard = art;
      Future.delayed(const Duration(seconds: 4)).then((value) {
        setState(() => rocketLoaded = true);
      });
    });
    Future.delayed(const Duration(seconds: 1)).then((value) {
      _startDelay();
    });

    _getUserFirstSplash();
    _appPreferences.setUserFirstSplashViewed();
  }

  _getUserFirstSplash() async {
    bool b = false;
    b = await _appPreferences.getFirstSplashViewed();
    setState(()=> fistSplashViewed = b);
  }

  @override
  void dispose() {
    _timer?.cancel();
    controllerSplash.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: riveArtboard != null
                ? Rive(
                    artboard: riveArtboard!,
                  )
                : SizedBox.shrink(
                    child: Container(color: ColorManager.dark),
                  ),
          ),
          if (rocketLoaded)
            Padding(
              padding: EdgeInsets.only(
                top: AppSize.s3.h,
                bottom: AppSize.s30.h,
                left: AppSize.s6.w,
                right: AppSize.s6.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppSize.s4.h,
                  ),
                  LogoText(
                    height: AppSize.s12.h,
                    width: AppSize.s60.w,
                  ),

                  // SizedBox(
                  //   height: AppSize.s3.h,
                  // ),
                  Text(
                    fistSplashViewed
                        ?  LocaleKeys.letsLearnWithGamification.tr() :  LocaleKeys.splashDescription.tr() ,
                    style: getRegularDINNextStyle(
                        color: ColorManager.white, fontSize: AppSize.s19.sp),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}