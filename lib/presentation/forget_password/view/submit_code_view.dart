import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/cutom_back_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class SubmitCodeView extends StatefulWidget {
  const SubmitCodeView({Key? key, required this.forgetPasswordPageController})
      : super(key: key);
  final PageController forgetPasswordPageController;

  @override
  State<SubmitCodeView> createState() => _SubmitCodeViewState();
}

class _SubmitCodeViewState extends State<SubmitCodeView> {
  final TextEditingController _emailController = TextEditingController();
  late TextEditingController pinController;
  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 20);

  bool isResendShowen = false;
  Artboard? riveArtboard;
  late RiveAnimationController controllerRobotForgetPassword;

  @override
  void initState() {
    super.initState();
    controllerRobotForgetPassword = SimpleAnimation('idle');
    rootBundle.load(RiveAssets.taslimaRobot).then((data) {
      try {
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        art.addController(controllerRobotForgetPassword);
        setState(() => riveArtboard = art);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    pinController = TextEditingController();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    controllerRobotForgetPassword.dispose();
    countdownTimer!.cancel();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(days: 5));
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return WillPopScope(
      onWillPop: () async {
        widget.forgetPasswordPageController.animateToPage(0,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorManager.dark,
        appBar: AppBar(
          leadingWidth: AppSize.s17.w,
          elevation: 0.0,
          backgroundColor: ColorManager.dark,
          leading: Padding(
            padding: EdgeInsets.only(right: AppPadding.p3.w),
            child: CustomBackButton(
              onTap: () => widget.forgetPasswordPageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p035.dp)
                  .copyWith(top: AppSize.s6.h),
              child: Column(
                children: [
                  SizedBox(
                    width: AppSize.s15.h,
                    height: AppSize.s20.h,
                    child: riveArtboard != null
                        ? Rive(
                            artboard: riveArtboard!,
                          )
                        : SizedBox.shrink(
                            child: Container(color: ColorManager.dark),
                          ),
                  ),
                  SizedBox(
                    height: AppSize.s2.h,
                  ),
                  Text(
                    LocaleKeys.forgotPassword.tr(),
                    textAlign: TextAlign.center,
                    style: getMediumDINNextStyle(
                      color: ColorManager.lightBlue,
                      fontSize: AppSize.s23.sp,
                    ),
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Text(
                    LocaleKeys.smsActivation.tr(),
                    textAlign: TextAlign.center,
                    style: getRegularInterStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s16.sp,
                    ).copyWith(height: 1.5),
                  ),
                  SizedBox(height: AppSize.s4.h),
                  SizedBox(
                    height: AppSize.s9.h,
                    child: PinCodeTextField(
                      appContext: context,
                      backgroundColor: ColorManager.dark,
                      textStyle: TextStyle(color: ColorManager.white),
                      beforeTextPaste: (v) => true,
                      pinTheme: PinTheme(
                          fieldWidth: AppSize.s15.w,
                          fieldHeight: AppSize.s8.h,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(AppSize.s15),
                          borderWidth: 1,
                          activeBorderWidth: 1,
                          inactiveBorderWidth: 1,
                          selectedColor: ColorManager.terracota,
                          inactiveColor: ColorManager.terracota,
                          activeColor: ColorManager.lightBlue),
                      length: 5,
                      autoFocus: true,
                      onChanged: (v) {},
                      controller: pinController,
                    ),
                  ),
                  SizedBox(height: AppSize.s3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${LocaleKeys.sendCode.tr()} ',
                        style: getSemiBoldInterStyle(
                            color: ColorManager.white,
                            fontSize: AppSize.s16.sp),
                      ),
                      if (countdownTimer == null || countdownTimer!.isActive)
                        Text(
                          '$minutes:$seconds',
                          style: getRegularInterStyle(
                              color: ColorManager.terracota,
                              fontSize: AppSize.s16.sp),
                        ),
                      if (!(countdownTimer == null || countdownTimer!.isActive))
                        TextButton(
                            onPressed: () {
                              /// TODO send and start timer
                              ///
                            },
                            child: Text(
                              LocaleKeys.sendCodeAgain.tr(),
                              style: getSemiBoldInterStyle(
                                  color: ColorManager.terracota,
                                  fontSize: AppSize.s16.sp),
                            ))
                    ],
                  ),
                  const SizedBox(height: AppSize.s60),
                  CustomButtonWidget(
                    onTap: () {
                      widget.forgetPasswordPageController.animateToPage(2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPasswordView(),));
                    },
                    shadowColor: ColorManager.terracota,
                    borderColor: ColorManager.terracota,
                    backGroundColor: ColorManager.terracota,
                    title: LocaleKeys.verify.tr(),
                    textColor: ColorManager.white,
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
