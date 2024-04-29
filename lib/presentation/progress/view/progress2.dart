import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/subject_progress/subject_progress_details.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/progress/view/widgets/cutome_card.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/state_rendrer/state_renderer.dart';
import '../../common/state_rendrer/state_renderer_impl.dart';
import '../../home/components/gift_gallery/gift_gallery_view.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../../widget/refresh_indicator_widget.dart';
import '../viewmodel/all_subjects_progress_viewmodel.dart';
import 'widgets/custom_unit_progress.dart';

class ProgressSubjectDetailsView extends StatefulWidget {
  const ProgressSubjectDetailsView(
      {super.key, required this.id, required this.pageController});

  final int id;
  final PageController pageController;

  @override
  State<ProgressSubjectDetailsView> createState() =>
      _ProgressSubjectDetailsViewState();
}

class _ProgressSubjectDetailsViewState
    extends State<ProgressSubjectDetailsView> {
  final SubjectsProgressViewModel _viewModel =
      instance<SubjectsProgressViewModel>();

  _bind() {
    if (widget.id != -1) {
      _viewModel.getSubjectProgressDetailsData(widget.id);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  Future loadList() async {
    //  _viewModel.start();
    _viewModel.getSubjectProgressDetailsData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.pageController.animateToPage(0,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
        return false;
      },
      child: RefreshWidget(
        onRefresh: loadList,
        widgetChild: Scaffold(
          backgroundColor: ColorManager.dark,
          body: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data
                      ?.getScreenWidget(context, _getContentWidget(), () {
                    _bind();
                  }) ??
                  _getContentWidget();
            },
          ),
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
            top: AppPadding.p5.h,
            right: AppPadding.p2.w,
            left: AppPadding.p3.w),
        child: SingleChildScrollView(
          child: StreamBuilder<SubjectProgressIdModel>(
            stream: _viewModel.outSubjectDetailsProgressDataStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return StateRenderer(
                  stateRendererType: StateRendererType.fullScreenLoadingState,
                  retryActionFunction: () {
                    _viewModel.start();
                    _viewModel.getSubjectProgressDetailsData(widget.id);
                  },
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: AppSize.s1.w,),
                        CachedNetworkImage(
                          imageUrl: Constants.baseUrl
                                  .substring(0, Constants.baseUrl.length - 1) +
                              snapshot
                                  .data!.subjectEducationalYears!.subjectImage,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              SvgPicture.asset(ImageAssets.noSubjectImage),
                          height: AppSize.s7.h,
                          width: AppSize.s7.h,
                        ),

                        SizedBox(
                          width: AppSize.s45.w,
                          child: Text(
                            snapshot
                                .data!.subjectEducationalYears!.subjectArName,
                            style: getMediumDINNextStyle(
                              color: ColorManager.blue,
                              fontSize: AppSize.s20.sp,
                            ),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () => widget.pageController.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.bounceOut,
                          ),
                          icon: Icon(
                            Icons.close,
                            size: AppSize.s7.w,
                            color: ColorManager.terracota,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s4.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: AppSize.s3.w,
                        ),
                        Text(
                          LocaleKeys.summary.tr(),
                          style: getRegularDINNextStyle(
                              color: ColorManager.blue, fontSize: AppSize.s21.sp
                              // .h
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomCard(
                          LocaleKeys.gems.tr(),
                          ImageAssets.gemBlue,
                          snapshot.data!.subjectEducationalYears!
                              .studentTotalPointsOfSubject
                              .toInt()
                              .toString(),
                          ColorManager.maize.withOpacity(0.25),
                        ),
                        const SizedBox(width: AppSize.s12),
                        CustomCard(
                          LocaleKeys.xp.tr(),
                          ImageAssets.emojiSmile,
                          snapshot.data!.subjectEducationalYears!
                              .studentTotalExperienceOfSubject
                              .toInt()
                              .toString(),
                          ColorManager.lightBlue.withOpacity(0.25),
                        ),
                        const SizedBox(width: AppSize.s12),
                        Expanded(
                          child: Container(
                            height: AppSize.s12.h,
                            padding: EdgeInsets.all(AppSize.s3.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s15),
                              color: ColorManager.terracota.withOpacity(0.25),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  LocaleKeys.avgGrade.tr(),
                                  textAlign: TextAlign.center,
                                  style: getMediumDINNextStyle(
                                    color: ColorManager.white,
                                    fontSize: AppSize.s17.sp,
                                  ),
                                  overflow: TextOverflow.clip,
                                ),
                                SizedBox(
                                  height: AppSize.s1_5.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: AppSize.s1_5.w,
                                    ),
                                    Text(
                                      '${snapshot.data!.subjectEducationalYears!.subjectAverage.toStringAsFixed(2)} %',
                                      style: getRegularDINNextStyle(
                                        color: ColorManager.white,
                                        fontSize: AppSize.s18.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s3.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.terracota.withOpacity(0.2),
                            spreadRadius: 8,
                            blurRadius: 8,
                            offset: const Offset(3, -3),
                          ),
                        ],
                      ),
                      child: CustomPaint(
                        size: Size(AppSize.s85.w, AppSize.s07.h),
                        painter: CurvePainter(),
                      ),
                    ),
                    // CustomHomeDivider(color: ColorManager.orange),
                    SizedBox(
                      height: AppSize.s3.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot
                          .data!.subjectEducationalYears!.eduUnit.length,
                      itemBuilder: (BuildContext context, int index) {
                        return UnitProgressWidget(
                          unitName: snapshot.data!.subjectEducationalYears!
                              .eduUnit[index].unitArName,
                          unitAvrege: snapshot.data!.subjectEducationalYears!
                              .eduUnit[index].unitAvrege,
                          totalPointsOfUnit: snapshot
                              .data!
                              .subjectEducationalYears!
                              .eduUnit[index]
                              .studentTotalPointsOfUnit,
                          totalExperienceOfUnit: snapshot
                              .data!
                              .subjectEducationalYears!
                              .eduUnit[index]
                              .studentTotalExperienceOfUnit,
                          exams: snapshot.data!.subjectEducationalYears!
                              .eduUnit[index].exams,
                          subjectName: snapshot
                              .data!.subjectEducationalYears!.subjectArName,
                        );
                      },
                    ),
                    SizedBox(
                      height: AppSize.s5.h,
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
