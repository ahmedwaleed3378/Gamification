import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/custom_text_field.dart';
import 'package:gamification/presentation/widget/cutom_back_button.dart';
import 'package:gamification/presentation/widget/transform_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';
import 'dart:ui' as ui;
import '../../../app/functions.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _loginViewModel = instance<LoginViewModel>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = true;
  Artboard? riveArtboard;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _bind() {
    _loginViewModel.start();
    _emailController
        .addListener(() => _loginViewModel.setUserEmail(_emailController.text));
    _passwordController.addListener(
        () => _loginViewModel.setPassword(_passwordController.text));

    _loginViewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      if (isLoggedIn) {
        SchedulerBinding.instance.addPostFrameCallback((_) async {
          _appPreferences.setUserLoggedIn(true);
          // navigate to main screen
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeRoute, (route) => false);
        });
      }
    });
  }

  @override
  void initState() {
    var controllerRobotLogin = SimpleAnimation('idle');
    rootBundle.load(RiveAssets.taslimaRobot).then((data) {
      try {
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        art.addController(controllerRobotLogin);
        setState(() => riveArtboard = art);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<FlowState>(
        stream: _loginViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _loginViewModel.login(context);
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorManager.dark,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: ColorManager.dark,
            leading: TransformWidget(
              buildContext: context,
              child: CustomBackButton(
                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  Routes.goStartView,
                ),
              ),
            )),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.only(
                right: AppPadding.p035.dp,
                left: AppPadding.p035.dp,
                bottom: AppPadding.p04.dp,
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: AppSize.s12.h,
                  ),
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
                    height: AppSize.s6.h,
                  ),
                  Text(
                    LocaleKeys.letsStartJounry.tr(),
                    style: getMediumDINNextStyle(
                        color: ColorManager.white, fontSize: AppSize.s21.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: AppSize.s4.h,
                  ),
                  StreamBuilder<bool>(
                      stream: _loginViewModel.outIsUserEmailValid,
                      builder: (context, snapshot) {
                        return CustomAuthFormFiled(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: ColorManager.orange,
                          textDirection: isCurrentLanguageEn(context)
                              ? ui.TextDirection.ltr
                              : ui.TextDirection.rtl,
                          textInputAction: TextInputAction.next,
                          hintText: LocaleKeys.email.tr(),
                          labelText: LocaleKeys.email.tr(),
                          // errorText: (snapshot.data ?? true)
                          //     ? null
                          //     : LocaleKeys.emailError.tr())
                        );
                      }),
                  SizedBox(height: AppSize.s3.h),
                  StreamBuilder<bool>(
                    stream: _loginViewModel.outIsUserPasswordValid,
                    builder: (context, snapshot) {
                      return CustomAuthFormFiled(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        cursorColor: ColorManager.orange,
                        textDirection: isCurrentLanguageEn(context)
                            ? ui.TextDirection.ltr
                            : ui.TextDirection.rtl,
                        obscureText: showPassword,
                        textInputAction: TextInputAction.done,
                        hintText: LocaleKeys.password.tr(),
                        labelText: LocaleKeys.password.tr(),
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
                                : Icon(MdiIcons.eyeOutline,
                                    size: AppSize.s19.sp),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: AppSize.s3.h),
                  Center(
                    child: InkWell(
                      onTap: () => Navigator.pushReplacementNamed(
                        context,
                        Routes.forgetPasswordRoute,
                      ),
                      child: Text(
                        LocaleKeys.forgotPassword.tr(),
                        style: getMediumDINNextStyle(
                          color: ColorManager.terracota,
                          fontSize: AppSize.s17.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s3.h),
                  StreamBuilder<bool>(
                    stream: _loginViewModel.outIAreAllDataValid,
                    builder: (context, snapshot) {
                      return CustomButtonWidget(
                        onTap: (snapshot.data ?? false)
                            ? () {
                                _loginViewModel.login(context);
                              }
                            : null,
                        shadowColor: ColorManager.terracota,
                        borderColor: ColorManager.terracota,
                        backGroundColor: ColorManager.terracota,
                        title: LocaleKeys.signIn.tr(),
                        textColor: ColorManager.white,
                      );
                    },
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${LocaleKeys.donotHaveAcc.tr()} ',
                        style: getRegularInterStyle(
                            color: ColorManager.white,
                            fontSize: AppSize.s16.sp),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.register,
                          );
                        },
                        child: Text(
                          LocaleKeys.signUp.tr(),
                          style: getSemiBoldInterStyle(
                              color: ColorManager.lightBlue,
                              fontSize: AppSize.s16.sp),
                        ),
                      ),
                    ],
                  )
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
    _loginViewModel.dispose();
    super.dispose();
  }
}
