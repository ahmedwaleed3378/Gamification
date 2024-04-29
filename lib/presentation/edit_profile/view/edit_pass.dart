import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gamification/presentation/common/freezed_data_classes.dart';
import 'package:gamification/presentation/profile/viewmodel/profile_viewmodel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../../widget/custom_button.dart';

class EditPassView extends StatefulWidget {
  const EditPassView(
      {super.key, required this.viewModel, required this.logoutFunc});
  final ProfileViewModel viewModel;
  final Function logoutFunc;

  @override
  State<EditPassView> createState() => _EditPassViewState();
}

class _EditPassViewState extends State<EditPassView> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  bool showPassword = true;
  bool visibleNewPassword = false;
  bool visibleEditPassword = true;
  bool buttonAvailable = false;

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    widget.viewModel.start();
    _passwordController.addListener(
        () => widget.viewModel.setPassword(_passwordController.text));
    _newPasswordController.addListener(
        () => widget.viewModel.setNewPassword(_newPasswordController.text));

    _confirmNewPasswordController.addListener(() => widget.viewModel
        .setNewConfirmPassword(_confirmNewPasswordController.text));

    widget.viewModel.isPasswordProfileUpdatedSuccessfullyStreamController.stream
        .listen((profileUpdated) {
      if (profileUpdated) {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          /// logout when update password
          widget.logoutFunc();
        //  resetModules();

        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // StreamBuilder<FlowState>(
        //   stream: widget.viewModel.outputState,
        //   builder: (context, snapshot) {
        //     return snapshot.data?.getScreenWidget(
        //           context,
        //           _getContentWidget(context),
        //           () {
        //             widget.viewModel.getProfile();
        //           },
        //         ) ??
        _getContentWidget(context);
    //     },
    //   );
  }

  Scaffold _getContentWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: StreamBuilder<ProfileObject>(
          stream: widget.viewModel.outProfileDataObject,
          builder: (context, pSnapshot) {
            return SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p3.w,
                    vertical: AppPadding.p2.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: AppSize.s2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              size: AppSize.s4.h,
                              color: ColorManager.terracota,
                            ),
                            onTap: () => Navigator.of(context).pop(),
                          ),
                          Text(
                            LocaleKeys.editPass.tr(),
                            textAlign: TextAlign.center,
                            style: getMediumDINNextStyle(
                              color: ColorManager.terracota,
                              fontSize: AppSize.s23.sp,
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      SizedBox(height: AppSize.s4.h),
                      SizedBox(height: AppSize.s2.h),
                      Card(
                        color: ColorManager.dark,
                        elevation: AppSize.s5,
                        shadowColor: ColorManager.dark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p5.w,
                                  vertical: AppPadding.p2.h,
                                ),
                                child: Text(
                                  LocaleKeys.password.tr(),
                                  style: getRegularDINNextStyle(
                                    color: ColorManager.lightBlue,
                                    fontSize: AppSize.s18.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: StreamBuilder<bool>(
                                stream: widget.viewModel.outIsUserPasswordValid,
                                builder: (context, snapshot) {
                                  return TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: _passwordController,
                                    obscureText: showPassword,
                                    textInputAction: TextInputAction.next,
                                    style: getRegularDINNextStyle(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s18.sp,
                                    ),
                                    cursorColor: ColorManager.orange,
                                    autofillHints: const [
                                      AutofillHints.password
                                    ],
                                    decoration: InputDecoration(
                                      hintText: LocaleKeys.password.tr(),
                                      labelText: LocaleKeys.password.tr(),
                                      fillColor: ColorManager.charcoalGrey80,
                                      labelStyle: getRegularDINNextStyle(
                                        color: ColorManager.white,
                                        fontSize: AppSize.s18.sp,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppSize.s10,
                                        ),
                                        borderSide: BorderSide(
                                          color: ColorManager.charcoalGrey80,
                                        ),
                                      ),
                                      hintStyle: getRegularDINNextStyle(
                                        color: ColorManager.gray,
                                        fontSize: AppSize.s16.sp,
                                      ),
                                      // suffixIcon: (snapshot.data ??
                                      //         false ||
                                      //             _passwordController
                                      //                 .text.isNotEmpty)
                                      //     ? Icon(
                                      //         Icons.check,
                                      //         color: ColorManager.orange,
                                      //         size: AppSize.s2_5.h,
                                      //       )
                                      //     : null,
                                      errorText: (snapshot.data ?? true)
                                          ? null
                                          : LocaleKeys.passwordError.tr(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSize.s2.h),
                      Column(
                        children: [
                          Card(
                            color: ColorManager.dark,
                            elevation: AppSize.s5,
                            shadowColor: ColorManager.dark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppPadding.p5.w,
                                      vertical: AppPadding.p2.h,
                                    ),
                                    child: Text(
                                      LocaleKeys.newPassword.tr(),
                                      style: getRegularDINNextStyle(
                                        color: ColorManager.lightBlue,
                                        fontSize: AppSize.s16.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: StreamBuilder<bool>(
                                    stream: widget
                                        .viewModel.outIsUserNewPasswordValid,
                                    builder: (context, snapshot) {
                                      return TextField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        controller: _newPasswordController,
                                        obscureText: showPassword,
                                        textInputAction: TextInputAction.next,
                                        style: getRegularDINNextStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s18.sp,
                                        ),
                                        cursorColor: ColorManager.orange,
                                        autofillHints: const [
                                          AutofillHints.password
                                        ],
                                        decoration: InputDecoration(
                                          hintText: LocaleKeys.newPassword.tr(),
                                          labelText:
                                              LocaleKeys.newPassword.tr(),
                                          fillColor:
                                              ColorManager.charcoalGrey80,
                                          labelStyle: getRegularDINNextStyle(
                                            color: ColorManager.white,
                                            fontSize: AppSize.s18.sp,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              AppSize.s10,
                                            ),
                                            borderSide: BorderSide(
                                              color:
                                                  ColorManager.charcoalGrey80,
                                            ),
                                          ),
                                          hintStyle: getRegularDINNextStyle(
                                            color: ColorManager.gray,
                                            fontSize: AppSize.s16.sp,
                                          ),
                                          suffixIcon: (snapshot.data ??
                                                  false ||
                                                      _newPasswordController
                                                          .text.isNotEmpty)
                                              ? Icon(
                                                  Icons.check,
                                                  color: ColorManager.orange,
                                                  size: AppSize.s2_5.h,
                                                )
                                              : null,
                                          errorText: (snapshot.data ?? true)
                                              ? null
                                              : LocaleKeys.passIsNotValid.tr(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSize.s2.h),
                          Card(
                            color: ColorManager.dark,
                            elevation: AppSize.s5,
                            shadowColor: ColorManager.dark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppPadding.p5.w,
                                      vertical: AppPadding.p2.h,
                                    ),
                                    child: Text(
                                      LocaleKeys.confirmNewPassword.tr(),
                                      style: getRegularDINNextStyle(
                                        color: ColorManager.lightBlue,
                                        fontSize: AppSize.s17.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: StreamBuilder<bool>(
                                    stream: widget.viewModel
                                        .outIsUserConfirmNewPasswordValid,
                                    builder: (context, snapshot) {
                                      return TextField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        controller:
                                            _confirmNewPasswordController,
                                        obscureText: showPassword,
                                        textInputAction: TextInputAction.next,
                                        style: getRegularDINNextStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s18.sp,
                                        ),
                                        cursorColor: ColorManager.orange,
                                        autofillHints: const [
                                          AutofillHints.password
                                        ],
                                        decoration: InputDecoration(
                                          hintText: LocaleKeys
                                              .confirmNewPassword
                                              .tr(),
                                          labelText: LocaleKeys
                                              .confirmNewPassword
                                              .tr(),
                                          fillColor:
                                              ColorManager.charcoalGrey80,
                                          labelStyle: getRegularDINNextStyle(
                                            color: ColorManager.white,
                                            fontSize: AppSize.s18.sp,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              AppSize.s10,
                                            ),
                                            borderSide: BorderSide(
                                              color:
                                                  ColorManager.charcoalGrey80,
                                            ),
                                          ),
                                          hintStyle: getRegularDINNextStyle(
                                            color: ColorManager.gray,
                                            fontSize: AppSize.s16.sp,
                                          ),
                                          suffixIcon: (snapshot.data ??
                                                  false ||
                                                      _confirmNewPasswordController
                                                          .text.isNotEmpty)
                                              ? Icon(
                                                  Icons.check,
                                                  color: ColorManager.orange,
                                                  size: AppSize.s2_5.h,
                                                )
                                              : null,
                                          errorText: (snapshot.data ?? true)
                                              ? null
                                              : LocaleKeys.passwordNotMatchError
                                                  .tr(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSize.s2.h),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s2.h,
                      ),
                      CustomButtonWidget(
                        backGroundColor: ColorManager.terracota,
                        borderColor: ColorManager.transparent,
                        title: LocaleKeys.save.tr(),
                        shadowColor: ColorManager.orange11,
                        textColor: ColorManager.white,
                        onTap:
                            //  (_passwordController.text.isNotEmpty &&
                            //         _confirmNewPasswordController.text.isNotEmpty &&
                            //         _passwordController.text.isNotEmpty)
                            //     ?
                            () {
                          if (_passwordController.text.isNotEmpty &&
                              _newPasswordController.text.isNotEmpty &&
                              _newPasswordController.text ==
                                  _confirmNewPasswordController.text) {
                            widget.viewModel.updateUserProfile(context);
                          }
                        }
                        // : null
                        ,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
