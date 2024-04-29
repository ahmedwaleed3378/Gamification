import 'package:bubble/bubble.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/app/functions.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/font_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';
import 'dart:ui' as ui;
import '../viewmodel/register_viewmodel.dart';
import '../../../generated/locale_keys.g.dart';
import '../../resources/assets_manager.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text_field.dart';

class RegisterView1 extends StatefulWidget {
  const RegisterView1({
    super.key,
    required this.viewModel,
    required this.pageController,
    required this.nameController,
    required this.secondNameController,
  });

  final RegisterViewModel viewModel;
  final PageController pageController;

  final TextEditingController nameController;
  final TextEditingController secondNameController;

  @override
  State<RegisterView1> createState() => _RegisterView1State();
}

class _RegisterView1State extends State<RegisterView1> {
  Artboard? riveArtboard;
  late RiveAnimationController? controllerRobotLogin;

  _bind() {
    widget.viewModel.start();
    widget.nameController.addListener(() {
      if (widget.nameController.text.isNotEmpty) {
        widget.viewModel.setUserName(
          widget.nameController.text,
        );
      }
    });
    widget.secondNameController.addListener(() {
      if (widget.secondNameController.text.isNotEmpty) {
        widget.viewModel.setUserName(
          (widget.nameController.text + widget.secondNameController.text),
        );
      }
    });
  }

  @override
  void initState() {
    _bind();
    navigationValid2 = widget.viewModel.register1Nav;
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

  bool navigationValid = true;
  bool navigationValid2 = false;

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
                  // const RegisterStepper(score: 1),
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
                              ? BubbleNip.leftCenter
                              : BubbleNip.rightCenter,
                          child: RichText(
                            text: TextSpan(
                              text: LocaleKeys.hiMyNameIs.tr(),
                              style: getRegularDINNextStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s19.sp,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: LocaleKeys.robo.tr(),
                                  style: getMediumDINNextStyle(
                                      color: ColorManager.primaryColor,
                                      fontSize: FontSize.s19.sp),
                                ),
                                TextSpan(
                                  text: LocaleKeys.whatsYourName.tr(),
                                  style: getRegularDINNextStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s19.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s7.h),
                  StreamBuilder<bool>(
                    stream: widget.viewModel.outputIsUserNameValid,
                    builder: (context, snapshot) {
                      return CustomAuthFormFiled(
                        controller: widget.nameController,
                        onChanged: (p0) {
                          setState(() {
                            navigationValid2 = p0.isNotEmpty && p0.length > 3;
                            widget.viewModel.register1Nav = p0.isNotEmpty;
                          });
                        },
                        errorText: (snapshot.data ?? true)
                            ? null
                            : LocaleKeys.userNameInvalid.tr(),
                        errorStyle: TextStyle(
                          color: (snapshot.data ?? true)
                              ? ColorManager.white
                              : ColorManager.red,
                        ),
                        keyboardType: TextInputType.name,
                        textDirection: isCurrentLanguageEn(context)
                            ? ui.TextDirection.ltr
                            : ui.TextDirection.rtl,
                        cursorColor: ColorManager.orange,
                        textInputAction: TextInputAction.next,
                        hintText: LocaleKeys.firstName.tr(),
                        labelText: LocaleKeys.firstName.tr(),
                      );
                    },
                  ),
                  SizedBox(height: AppSize.s4.h),
                  CustomAuthFormFiled(
                    controller: widget.secondNameController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter,
                    ],
                    keyboardType: TextInputType.name,
                    cursorColor: ColorManager.orange,
                    textInputAction: TextInputAction.next,
                    hintText: LocaleKeys.secondName.tr(),
                    labelText: LocaleKeys.secondName.tr(),
                    textDirection: isCurrentLanguageEn(context)
                        ? ui.TextDirection.ltr
                        : ui.TextDirection.rtl,
                  ),
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
