import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/language/language_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/freezed_data_classes.dart';
import 'package:gamification/presentation/common_question/view/common_question_view.dart';
import 'package:gamification/presentation/edit_profile/view/edit_profile_view.dart';
import 'package:gamification/presentation/help_support/view/help_support_view.dart';
import 'package:gamification/presentation/privacy_policy/view/privacy_policy_view.dart';
import 'package:gamification/presentation/profile/viewmodel/profile_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/terms_policy/view/terms_policy_view.dart';
import 'package:gamification/presentation/widget/custom_robot_dialog.dart';
import 'package:gamification/presentation/widget/profile_photo_widget.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

import '../../common/state_rendrer/state_renderer.dart';
import '../../common/state_rendrer/state_renderer_impl.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final ProfileViewModel _profileViewModel = instance<ProfileViewModel>();
  Artboard? riveArtboard;
  late  RiveAnimationController controllerRobotForgetPassword;
  @override
  void initState() {
    controllerRobotForgetPassword = SimpleAnimation('Sad 2');
    rootBundle.load(RiveAssets.newSad).then((data) {
      try{
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        art.addController(controllerRobotForgetPassword);
        setState(() => riveArtboard = art);
      }catch(e){debugPrint(e.toString());}
    });
    _bind();
    super.initState();
  }

  _bind() {
    _profileViewModel.start();
    _profileViewModel.getHelpSupport();

    _profileViewModel
        .isPasswordProfileUpdatedSuccessfullyStreamController.stream
        .listen((profileUpdated) {
      if (profileUpdated) {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          /// logout when update password
          logoutFunc();
        });
      }
    });
  }

  void logoutFunc() {
    _appPreferences.logout().then((value) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.goStartView,
        (route) => false,
      );
    });
    // resetModules();
  }

  @override
  void dispose() {
    _profileViewModel.dispose();
    super.dispose();
  }

  String? languageSelected;

  Future loadList() async {
    _profileViewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: loadList,
      widgetChild: Scaffold(
        backgroundColor: ColorManager.dark,
        body: StreamBuilder<FlowState>(
          stream: _profileViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                  context,
                  _getContentWidget(),
                  () {
                    _profileViewModel.getProfile();
                  },
                ) ??
                _getContentWidget();
          },
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<ProfileObject>(
      stream: _profileViewModel.outProfileDataObject,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return WillPopScope(
            onWillPop: () async {
              Navigator.popAndPushNamed(context, Routes.homeRoute);
              return false;
            },
            child: Scaffold(
              backgroundColor: ColorManager.dark,
              body: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: AppSize.s2.h),
                      Text(
                        LocaleKeys.myAccount.tr(),
                        textAlign: TextAlign.center,
                        style: getMediumDINNextStyle(
                          color: ColorManager.terracota,
                          fontSize: AppSize.s20.sp,
                        ),
                      ),
                      SizedBox(height: AppSize.s2.h),
                      Container(
                        padding: EdgeInsets.only(
                          right: AppPadding.p5.w,
                          left: AppPadding.p5.w,
                          bottom: AppPadding.p2.h,
                        ),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  StreamBuilder<File>(
                                    stream: _profileViewModel.outImageProfile,
                                    builder: (context, snapshotImage) {
                                      if (snapshotImage.hasData) {
                                        return ProfileWidget(
                                          photoSize: AppSize.s12.h,
                                          onTap: () {},
                                          imageFileProfile: snapshotImage.data,
                                          networkImage: '',
                                        );
                                      } else {
                                        return ProfileWidget(
                                            photoSize: AppSize.s12.h,
                                            onTap: () {},
                                            imageFileProfile: null,
                                            networkImage:
                                                snapshot.data!.profilePicture);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: AppSize.s1.h),
                            Card(
                              color: ColorManager.dark,
                              elevation: AppSize.s5,
                              shadowColor: ColorManager.dark,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p2.w,
                                  vertical: AppPadding.p1.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      LocaleKeys.changeLanguage.tr(),
                                      style: getRegularDINNextStyle(
                                        color: ColorManager.lightBlue,
                                        fontSize: AppSize.s19.sp,
                                      ),
                                    ),
                                    Container(
                                      height: AppSize.s5.h,
                                      padding: EdgeInsets.all(AppPadding.p1.w),
                                      decoration: ShapeDecoration(
                                        color: ColorManager.dark,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1.0,
                                            style: BorderStyle.solid,
                                            color: ColorManager.steel,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(AppSize.s10),
                                          ),
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          dropdownColor: ColorManager.dark,
                                          value: languageSelected,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: AppPadding.p04.h,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              languageSelected = value;
                                            });

                                            _appPreferences
                                                .customChangeAppLanguage(
                                              value == 'English' ? 'en' : 'ar',
                                            );
                                            Phoenix.rebirth(context);
                                          },
                                          items: [
                                            DropdownMenuItem(
                                              value: null,
                                              child: Text(
                                                LocaleKeys.language.tr(),
                                                style: getMediumInterStyle(
                                                  color: ColorManager.white,
                                                  fontSize: AppSize.s14.sp,
                                                ),
                                              ),
                                            ),
                                            ...languages.map(
                                              (choice) => DropdownMenuItem(
                                                value: choice.title,
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      choice.image,
                                                      width: AppSize.s6.w,
                                                    ),
                                                    SizedBox(
                                                        width: AppSize.s2.w),
                                                    Text(
                                                      choice.title,
                                                      style:
                                                          getMediumInterStyle(
                                                        color:
                                                            ColorManager.white,
                                                        fontSize:
                                                            AppSize.s14.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: AppSize.s1.h),
                            Card(
                              color: ColorManager.dark,
                              elevation: AppSize.s5,
                              shadowColor: ColorManager.dark,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p2.w,
                                  vertical: AppPadding.p2.h,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LocaleKeys.subscription.tr(),
                                          style: getRegularDINNextStyle(
                                            color: ColorManager.lightBlue,
                                            fontSize: AppSize.s19.sp,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, Routes.paymentRoute);
                                          },
                                          child: Text(
                                            LocaleKeys.subscribeNow.tr(),
                                            style: getMediumInterStyle(
                                                color: ColorManager.orange,
                                                fontSize: AppSize.s15.sp,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: AppSize.s1.h),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.subiscription,
                                        );
                                      },
                                      child: Text(
                                        LocaleKeys.seeDetails.tr(),
                                        style: getMediumInterStyle(
                                          color: ColorManager.liliac,
                                          fontSize: AppSize.s16.sp,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: AppSize.s1.h),
                            Card(
                              color: ColorManager.dark,
                              elevation: AppSize.s5,
                              shadowColor: ColorManager.dark,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p2.w,
                                  vertical: AppPadding.p1.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      LocaleKeys.myProfile.tr(),
                                      style: getRegularDINNextStyle(
                                        color: ColorManager.lightBlue,
                                        fontSize: AppSize.s19.sp,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditProfileView(
                                              logoutFunc: () {
                                                Navigator.of(context)
                                                    .popAndPushNamed(
                                                        Routes.loginRoute);
                                                _appPreferences.logout();
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        LocaleKeys.edit.tr(),
                                        style: getMediumInterStyle(
                                          color: ColorManager.liliac,
                                          fontSize: AppSize.s16.sp,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: AppSize.s1.h),
                            Card(
                              color: ColorManager.dark,
                              elevation: AppSize.s5,
                              shadowColor: ColorManager.dark,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p2.w,
                                  vertical: AppPadding.p1.h,
                                ),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: accountData.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          switch (index) {
                                            case 0:
                                              return const HelpSupportView();
                                            case 1:
                                              return const CommonQuestionView();
                                            case 2:
                                              return const PrivacyPolicyView();
                                            case 3:
                                              return const TermsPolicyView();
                                            default:
                                              return const HelpSupportView();
                                          }
                                        }));
                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              accountData[index]['icon']),
                                          SizedBox(width: AppSize.s3.w),
                                          Text(
                                            accountData[index]['title'],
                                            style: getRegularDINNextStyle(
                                              color: ColorManager.lightBlue,
                                              fontSize: AppSize.s19.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: AppSize.s1_5.h);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: AppSize.s1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // InkWell(
                                //   onTap: () {
                                //     customRobotDialog(
                                //       context,
                                //       LocaleKeys.areYouSureDeleteAccount.tr(),
                                //         (){
                                //           _profileViewModel.deleteUserId(
                                //               _appPreferences.getUserId(), context);
                                //         },
                                //         riveArtboard
                                //     );
                                //   },
                                //   child: Card(
                                //     color: ColorManager.dark,
                                //     elevation: AppSize.s5,
                                //     shadowColor: ColorManager.dark,
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius:
                                //           BorderRadius.circular(AppSize.s10),
                                //     ),
                                //     child: Padding(
                                //       padding: EdgeInsets.symmetric(
                                //         horizontal: AppPadding.p1.w,
                                //         vertical: AppPadding.p2.h,
                                //       ),
                                //       child: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.center,
                                //         children: [
                                //           SvgPicture.asset(
                                //             ImageAssets.deleteAccountIcon,
                                //           ),
                                //           SizedBox(width: AppSize.s3.w),
                                //           Text(
                                //             LocaleKeys.deleteAccount.tr(),
                                //             style: getMediumDINNextStyle(
                                //               color: ColorManager.terracota,
                                //               fontSize: AppSize.s19.sp,
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                InkWell(
                                  onTap: (){
                                    customRobotDialog(context , LocaleKeys.areYouSureLogout.tr(),(){
                                      _appPreferences.logout().then((value) {
                                        Navigator.of(context).pushNamedAndRemoveUntil(
                                          Routes.goStartView,
                                              (route) => false,
                                        );
                                      });
                                    },
                                        riveArtboard
                                    );
                                  },
                                  child: Card(
                                    color: ColorManager.dark,
                                    elevation: AppSize.s5,
                                    shadowColor: ColorManager.dark,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s10),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppPadding.p2.w,
                                        vertical: AppPadding.p2.h,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            ImageAssets.logOutIcon,
                                          ),
                                          SizedBox(width: AppSize.s3.w),
                                          Text(
                                            LocaleKeys.logOut.tr(),
                                            style: getMediumDINNextStyle(
                                              color: ColorManager.terracota,
                                              fontSize: AppSize.s19.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return StateRenderer(
            stateRendererType: StateRendererType.fullScreenLoadingState,
            retryActionFunction: () {
              _profileViewModel.getProfile();
            },
          );
        }
      },
    );
  }


}

List accountData = [
  {
    'icon': ImageAssets.helpIcon,
    'title': LocaleKeys.helpAndSupport.tr(),
  },
  {
    'icon': ImageAssets.commonQuestionIcon,
    'title': LocaleKeys.commonQuestions.tr(),
  },
  {
    'icon': ImageAssets.policyIcon,
    'title': LocaleKeys.privacyPolicies.tr(),
  },
  {
    'icon': ImageAssets.termsIcon,
    'title': LocaleKeys.termsAndPolicies.tr(),
  },
];
