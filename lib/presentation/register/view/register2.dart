import 'package:bubble/bubble.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

import '../../../app/functions.dart';
import '../../../generated/locale_keys.g.dart';
import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_field.dart';
import '../viewmodel/register_viewmodel.dart';
import 'dart:ui' as ui;

class RegisterView2 extends StatefulWidget {
  const RegisterView2({
    super.key,
    required this.viewModel,
    required this.pageController,
    required this.emailController,
    required this.phoneController,
  });

  final PageController pageController;
  final RegisterViewModel viewModel;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  State<RegisterView2> createState() => _RegisterView2State();
}

class _RegisterView2State extends State<RegisterView2> {
  Artboard? riveArtboard;
  late RiveAnimationController? controllerRobotLogin;
  bool navigationValid = false;
  bool navigationValid2 = false;
  RegisterViewModel _registerViewModel = instance<RegisterViewModel>();

  _bind() {
    widget.emailController.addListener(() {
      if (widget.emailController.text.isNotEmpty) {
        widget.viewModel.setEmail(widget.emailController.text);
      }
    },);
    widget.phoneController.addListener(() {
      if (widget.phoneController.text.isNotEmpty) {
        widget.viewModel.setMobileNumber(widget.phoneController.text);
      }
    },);
    setState(() {

    });
  }

  @override
  void initState() {
    _bind();
    navigationValid = widget.viewModel.register3Nav;
    navigationValid2 = widget.viewModel.register2Nav;
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _registerViewModel.outputState,
      builder: (context, snapshot) {
        return snapshot.data?.getScreenWidget(
              context,
              _getContentWidget(context),
              () {
                _registerViewModel.checkEmailOrPhone(
                    widget.emailController.text,
                    widget.phoneController.text,
                    widget.pageController,
                    context);
              },
            ) ??
            _getContentWidget(context);
      },
    );
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
                  // const RegisterStepper(score: 2),
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
                          radius: const Radius.circular(10),
                          color: ColorManager.transparent,
                          margin: const BubbleEdges.only(top: 10),
                          nip: isCurrentLanguageEn(context)
                              ? BubbleNip.leftBottom
                              : BubbleNip.rightBottom,
                          child: Text(
                            LocaleKeys.letsContactWith.tr(),
                            style: getRegularDINNextStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s19.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s7.h,
                  ),
                  StreamBuilder<String?>(
                      stream: widget.viewModel.outputErrorEmail,
                      builder: (context, snapshot) {
                        return CustomAuthFormFiled(
                          controller: widget.emailController,
                          textDirection: isCurrentLanguageEn(context)
                              ? ui.TextDirection.ltr
                              : ui.TextDirection.rtl,
                          onChanged: (p0) {
                            setState(() {
                              navigationValid = isEmailValid(p0);
                              widget.viewModel.register3Nav = navigationValid;
                            });
                          },
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: ColorManager.orange,
                          textInputAction: TextInputAction.next,
                          hintText: LocaleKeys.email.tr(),
                          labelText: LocaleKeys.email.tr(),
                          errorText: snapshot.data,
                        );
                      }),
                  SizedBox(height: AppSize.s4.h),
                  StreamBuilder<String?>(
                      stream: widget.viewModel.outputErrorMobileNumber,
                      builder: (context, snapshot) {
                        return CustomAuthFormFiled(
                          controller: widget.phoneController,
                          textDirection: isCurrentLanguageEn(context)
                              ? ui.TextDirection.ltr
                              : ui.TextDirection.rtl,
                          onChanged: (p0) {
                            setState(() {
                              navigationValid2 = p0.length == 11;
                              widget.viewModel.register2Nav = navigationValid2;
                            });
                          },
                          keyboardType: TextInputType.phone,
                          cursorColor: ColorManager.orange,
                          textInputAction: TextInputAction.next,
                          hintText: LocaleKeys.mobile.tr(),
                          labelText: LocaleKeys.mobile.tr(),
                          errorText: snapshot.data,
                        );
                      }),
                  const Spacer(),
                  CustomButtonWidget(
                    onTap: (navigationValid && navigationValid2)
                        ? () {
                            // widget.pageController.nextPage(
                            //   duration: const Duration(milliseconds: 300),
                            //   curve: Curves.easeIn,
                            // );
                            _registerViewModel.checkEmailOrPhone(
                                widget.emailController.text,
                                widget.phoneController.text,
                                widget.pageController,
                                context);
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
