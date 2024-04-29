import 'package:bubble/bubble.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';
import 'dart:ui' as ui;
import '../../../app/functions.dart';
import '../../../generated/locale_keys.g.dart';
import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_field.dart';
import '../viewmodel/register_viewmodel.dart';

class RegisterView3 extends StatefulWidget {
  const RegisterView3({
    super.key,
    required this.viewModel,
    required this.pageController,
    required this.passController,
    required this.passConfirmController,
  });

  final PageController pageController;
  final RegisterViewModel viewModel;
  final TextEditingController passController;
  final TextEditingController passConfirmController;

  @override
  State<RegisterView3> createState() => _RegisterView3State();
}

class _RegisterView3State extends State<RegisterView3> {
  Artboard? riveArtboard;
  late RiveAnimationController? controllerRobotLogin;
  bool navigationValid = false;
  bool navigationValid2 = false;

  _bind() {
    navigationValid = widget.viewModel.register5Nav;
    navigationValid2 = widget.viewModel.register4Nav;
    widget.passController.addListener(() {
      if (widget.passController.text.isNotEmpty) {
        widget.viewModel.setPassword(widget.passController.text);
      }
    });
    widget.passConfirmController.addListener(() {
      if (widget.passConfirmController.text.isNotEmpty) {
        widget.viewModel.setConfirmPassword(widget.passConfirmController.text);
      }
    });
  }

  @override
  void initState() {
    _bind();
    var controllerRobotLogin = SimpleAnimation('Writing');

    rootBundle.load(RiveAssets.writingRobot).then((data) {
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

  bool visible1 = false;
  bool visible2 = false;

  @override
  Widget build(BuildContext context) {
    return _getContentWidget(context);
  }

  Scaffold _getContentWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSize.s0.h,
            left: AppSize.s2.w,
            right: AppSize.s2.w,
            bottom: AppSize.s2.h,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: AppSize.s70.h,
              child: Column(
                children: [
                  // SizedBox(height: AppSize.s8.h),
                  // const RegisterStepper(score: 3),
                  // SizedBox(height: AppSize.s7.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        width: AppSize.s60.w,
                        child: Bubble(
                          borderColor: ColorManager.secondaryText,
                          radius: const Radius.circular(AppSize.s10),
                          color: ColorManager.transparent,
                          margin: const BubbleEdges.only(top: AppSize.s10),
                          nip: isCurrentLanguageEn(context)
                              ? BubbleNip.leftBottom
                              : BubbleNip.rightBottom,
                          child: Text(
                            LocaleKeys.letsSetPassword.tr(),
                            style: getRegularDINNextStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s18.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s7.h,
                  ),
                  StreamBuilder<String?>(
                      stream: widget.viewModel.outputErrorPassword,
                      builder: (context, snapshot) {
                        return CustomAuthFormFiled(
                          controller: widget.passController,
                          textDirection: isCurrentLanguageEn(context)
                              ? ui.TextDirection.ltr
                              : ui.TextDirection.rtl,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: ColorManager.orange,
                          textInputAction: TextInputAction.next,
                          hintText: LocaleKeys.password.tr(),
                          labelText: LocaleKeys.password.tr(),
                          errorText: snapshot.data,
                          onChanged: (p0) {
                            setState(() {
                              navigationValid = p0.isNotEmpty && p0.length > 5;
                              widget.viewModel.register5Nav = navigationValid;
                            });
                          },
                          obscureText: !visible1,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visible1 = !visible1;
                                });
                              },
                              icon: Icon(
                                visible1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: AppSize.s19.sp,
                              )),
                        );
                      }),
                  SizedBox(
                    height: AppSize.s4.h,
                  ),
                  StreamBuilder<String?>(
                      stream: widget.viewModel.outputErrorConfirmPassword,
                      builder: (context, snapshot) {
                        return CustomAuthFormFiled(
                          controller: widget.passConfirmController,
                          keyboardType: TextInputType.visiblePassword,
                          textDirection: isCurrentLanguageEn(context)
                              ? ui.TextDirection.ltr
                              : ui.TextDirection.rtl,
                          cursorColor: ColorManager.orange,
                          errorText: widget.passConfirmController.text ==
                                  widget.passController.text
                              ? null
                              : LocaleKeys.confirmPasswordNotMatch.tr(),
                          onChanged: (p0) {
                            setState(() {
                              navigationValid2 = p0.isNotEmpty &&
                                  p0 == widget.passController.text;
                              widget.viewModel.register4Nav = navigationValid2;
                            });
                          },
                          textInputAction: TextInputAction.next,
                          hintText: LocaleKeys.confirmPassword.tr(),
                          labelText: LocaleKeys.confirmPassword.tr(),
                          obscureText: !visible2,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visible2 = !visible2;
                                });
                              },
                              icon: Icon(
                                visible2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 19.sp,
                              )),
                        );
                      }),
                  const Spacer(),
                  CustomButtonWidget(
                    onTap: (navigationValid && navigationValid2)
                        ? () {
                            widget.pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        : null,
                    backGroundColor: ColorManager.primaryColor,
                    borderColor: ColorManager.transparent,
                    shadowColor: ColorManager.orange11,
                    textColor: ColorManager.white,
                    title: LocaleKeys.continu.tr(),
                  ),
                  SizedBox(height: AppSize.s7.h)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
