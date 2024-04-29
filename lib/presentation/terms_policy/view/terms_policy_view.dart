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

class TermsPolicyView extends StatefulWidget {
  const TermsPolicyView({Key? key}) : super(key: key);

  @override
  State<TermsPolicyView> createState() => _TermsPolicyViewState();
}

class _TermsPolicyViewState extends State<TermsPolicyView> {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            LocaleKeys.termsAndPolicies.tr(),
                            textAlign: TextAlign.center,
                            style: getMediumDINNextStyle(
                              color: ColorManager.terracota,
                              fontSize: AppSize.s21.sp,
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      SizedBox(height: AppSize.s7.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p3.w,
                        ),
                        child: Text(
                          snapshot.data!.privacyContent,
                          style: getMediumDINNextStyle(
                            color: ColorManager.white,
                            fontSize: AppSize.s19.sp,
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

