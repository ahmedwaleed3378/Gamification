import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/help_support/help_support_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/profile/viewmodel/profile_viewmodel.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/state_rendrer/state_renderer.dart';
import '../../common/state_rendrer/state_renderer_impl.dart';

class CommonQuestionView extends StatefulWidget {
  const CommonQuestionView({Key? key}) : super(key: key);

  @override
  State<CommonQuestionView> createState() => _CommonQuestionViewState();
}

class _CommonQuestionViewState extends State<CommonQuestionView> {
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
   Future loadList() async {  _profileViewModel.start();
    _profileViewModel.getHelpSupport();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: loadList,
      widgetChild: 
      Scaffold(
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
                            LocaleKeys.commonQuestions.tr(),
                            textAlign: TextAlign.center,
                            style: getMediumDINNextStyle(
                              color: ColorManager.terracota,
                              fontSize: AppSize.s21.sp,
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      SizedBox(height: AppSize.s5.h),
                      Center(
                        child: Text(
                          LocaleKeys.frequentlyQuestionsAboutApp.tr(),
                          style: getMediumDINNextStyle(
                            color: ColorManager.maize,
                            fontSize: AppSize.s17.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: AppSize.s7.h),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount:
                            snapshot.data!.commonQuestionsContent!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: AppSize.s2,
                                color: ColorManager.steel,
                              ),
                              borderRadius: BorderRadius.circular(
                                AppSize.s11,
                              ),
                            ),
                            child: ExpansionTile(
                              iconColor: ColorManager.tealish,
                              collapsedIconColor: ColorManager.tealish,
                              title: Text(
                                snapshot.data!.commonQuestionsContent![index]
                                    .question,
                                style: getMediumDINNextStyle(
                                  color: ColorManager.greenishTeal,
                                  fontSize: AppSize.s17.sp,
                                ),
                              ),
                              children: [
                                ListTile(
                                  title: Text(
                                    snapshot
                                        .data!
                                        .commonQuestionsContent![index]
                                        .answer,
                                    style: getMediumDINNextStyle(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s16 .sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: AppSize.s2.h,
                          );
                        },
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
