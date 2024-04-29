import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/help_support/help_support_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/profile/viewmodel/profile_viewmodel.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/state_rendrer/state_renderer.dart';
import '../../common/state_rendrer/state_renderer_impl.dart';

class HelpSupportView extends StatefulWidget {
  const HelpSupportView({Key? key}) : super(key: key);

  @override
  State<HelpSupportView> createState() => _HelpSupportViewState();
}

class _HelpSupportViewState extends State<HelpSupportView> {
  final ProfileViewModel _profileViewModel = instance<ProfileViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _profileViewModel.start();
    _profileViewModel.getHelpSupport();
  }

  @override
  void dispose() {
    _profileViewModel.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: StreamBuilder<FlowState>(
        stream: _profileViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(
                context,
                _getContentWidget(),
                () {
                  _profileViewModel.getHelpSupport();
                },
              ) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<HelpSupportModel>(
      stream: _profileViewModel.outputHelpSupport,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: ColorManager.dark,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p3.w,
                    vertical: AppPadding.p2.h,
                  ),
                  child: Column(
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
                            LocaleKeys.helpAndSupport.tr(),
                            textAlign: TextAlign.center,
                            style: getMediumDINNextStyle(
                              color: ColorManager.terracota,
                              fontSize: AppSize.s21.sp,
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      SizedBox(height: AppSize.s2.h),
                      Card(
                        color: ColorManager.dark,
                        elevation: AppSize.s5,
                        shadowColor: ColorManager.dark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p4.w,
                            vertical: AppPadding.p3.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                LocaleKeys.companyNumbers.tr(),
                                style: getMediumDINNextStyle(
                                  color: ColorManager.lightBlue,
                                  fontSize: AppSize.s19.sp,
                                ),
                              ),
                              SizedBox(height: AppSize.s2.h),
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.helpContent!.companyEmails!.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: ColorManager.charcoalGrey80
                                        .withOpacity(0.8),
                                    elevation: AppSize.s15,
                                    shadowColor: ColorManager.charcoalGrey80,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(AppSize.s10),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppPadding.p8.w,
                                        vertical: AppPadding.p2.h,
                                      ),
                                      child: Text(
                                        snapshot.data!.helpContent!.companyEmails![index],
                                        style: getRegularDINNextStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s18.sp,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: AppSize.s2.h);
                                },
                              ),

                            ],
                          ),
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p4.w,
                            vertical: AppPadding.p3.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                LocaleKeys.companyEmails.tr(),
                                style: getMediumDINNextStyle(
                                  color: ColorManager.lightBlue,
                                  fontSize: AppSize.s19.sp,
                                ),
                              ),
                              SizedBox(height: AppSize.s2.h),
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.helpContent!.companyNumbers!.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: ColorManager.charcoalGrey80
                                        .withOpacity(0.8),
                                    elevation: AppSize.s15,
                                    shadowColor: ColorManager.charcoalGrey80,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(AppSize.s10),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppPadding.p8.w,
                                        vertical: AppPadding.p2.h,
                                      ),
                                      child: Text(
                                        snapshot.data!.helpContent!.companyNumbers![index],
                                        style: getRegularDINNextStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s18.sp,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: AppSize.s2.h);
                                },
                              ),

                            ],
                          ),
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
              _profileViewModel.getHelpSupport();
            },
          );
        }
      },
    );
  }
}

