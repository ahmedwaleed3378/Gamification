import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/forget_password/view/final_confirm_password.dart';
import 'package:gamification/presentation/forget_password/view/reset_password_view.dart';
import 'package:gamification/presentation/forget_password/view/submit_code_view.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/custom_text_field.dart';
import 'package:gamification/presentation/widget/cutom_back_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _emailController = TextEditingController();
  late PageController _forgetPasswordPageView;
  Artboard? riveArtboard;
  late RiveAnimationController controllerRobotForgetPassword;

  @override
  void initState() {
    // TODO: implement initState
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
    _forgetPasswordPageView = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    controllerRobotForgetPassword!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _forgetPasswordPageView,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _contentWidget(),
        SubmitCodeView(forgetPasswordPageController: _forgetPasswordPageView),
        ResetPasswordView(
            forgetPasswordPageController: _forgetPasswordPageView),
        FinalConfirmPasswordView(
            forgetPasswordPageController: _forgetPasswordPageView),
      ],
    );
  }

  Widget _contentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      appBar: AppBar(
        leadingWidth: AppSize.s17.w,
          elevation: 0.0,
          backgroundColor: ColorManager.dark,
          leading: Padding(
            padding: EdgeInsets.only(
              right: AppPadding.p3.w,
            ),
            child: CustomBackButton(
              onTap: () => Navigator.pop(context),
            ),
          )),
      body: SingleChildScrollView(
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
              SizedBox(height: AppSize.s3.h),
              Text(
                LocaleKeys.forgetPasswordDescription.tr(),
                textAlign: TextAlign.center,
                style: getRegularInterStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s16.sp,
                ).copyWith(height: 1.5),
              ),
              SizedBox(height: AppSize.s7.h),
              CustomAuthFormFiled(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                cursorColor: ColorManager.orange,
                textInputAction: TextInputAction.next,
                hintText: LocaleKeys.email.tr(),
                labelText: LocaleKeys.email.tr(),
              ),
              const SizedBox(height: AppSize.s94),
              CustomButtonWidget(
                onTap: () {
                  //     Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SubmitCodeView() ,));
                  _forgetPasswordPageView.animateToPage(1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
                shadowColor: ColorManager.terracota,
                borderColor: ColorManager.terracota,
                backGroundColor: ColorManager.terracota,
                title: LocaleKeys.sendCode.tr(),
                textColor: ColorManager.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
