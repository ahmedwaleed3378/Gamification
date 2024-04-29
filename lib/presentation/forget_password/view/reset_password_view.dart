import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/custom_text_field.dart';
import 'package:gamification/presentation/widget/cutom_back_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView(
      {Key? key, required this.forgetPasswordPageController})
      : super(key: key);
  final PageController forgetPasswordPageController;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = true;

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
  }

  @override
  void dispose() {
    super.dispose();
    controllerRobotForgetPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _getContentWidget());
  }

  Widget _getContentWidget() {
    return WillPopScope(
      onWillPop: () async {
        widget.forgetPasswordPageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );

        return false;
      },
      child: Scaffold(
        backgroundColor: ColorManager.dark,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: ColorManager.dark,
          leading: CustomBackButton(
            onTap: () => widget.forgetPasswordPageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            ),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p035.dp)
                  .copyWith(top: AppSize.s6.h),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
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
                    LocaleKeys.resetPassword.tr(),
                    style: getMediumDINNextStyle(
                        color: ColorManager.lightBlue,
                        fontSize: AppSize.s23.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Text(
                    LocaleKeys.pleaseTypeSomething.tr(),
                    style: getRegularInterStyle(
                        color: ColorManager.white, fontSize: AppSize.s18.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: AppSize.s3.h,
                  ),
                  CustomAuthFormFiled(
                    controller: _newPasswordController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: ColorManager.orange,
                    textInputAction: TextInputAction.next,
                    hintText: LocaleKeys.newPassword.tr(),
                    labelText: LocaleKeys.newPassword.tr(),
                    suffixIcon: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: IconTheme(
                        data: IconThemeData(color: ColorManager.coolGrey),
                        child: showPassword
                            ? Icon(
                                MdiIcons.eyeOffOutline,
                                size: AppSize.s19.sp,
                              )
                            : Icon(MdiIcons.eyeOutline, size: AppSize.s19.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s3.h),
                  CustomAuthFormFiled(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    cursorColor: ColorManager.orange,
                    obscureText: showPassword,
                    textInputAction: TextInputAction.done,
                    hintText: LocaleKeys.confirmNewPassword.tr(),
                    labelText: LocaleKeys.confirmNewPassword.tr(),
                    suffixIcon: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: IconTheme(
                        data: IconThemeData(color: ColorManager.coolGrey),
                        child: showPassword
                            ? Icon(
                                MdiIcons.eyeOffOutline,
                                size: AppSize.s19.sp,
                              )
                            : Icon(MdiIcons.eyeOutline, size: AppSize.s19.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s7.h),
                  CustomButtonWidget(
                    onTap: () {
                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => const FinalConfirmPasswordView(),));
                      widget.forgetPasswordPageController.animateToPage(3,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    shadowColor: ColorManager.terracota,
                    borderColor: ColorManager.terracota,
                    backGroundColor: ColorManager.terracota,
                    title: LocaleKeys.resetPassword.tr(),
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
