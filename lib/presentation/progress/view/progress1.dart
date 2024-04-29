import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/subject_progress/subjects_progress.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/progress/view/progress2.dart';
import 'package:gamification/presentation/progress/view/widgets/custom_subject_prgress_widget.dart';
import 'package:gamification/presentation/widget/custom_home_header.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/constants.dart';
import '../../common/state_rendrer/state_renderer.dart';
import '../../common/state_rendrer/state_renderer_impl.dart';
import '../../home/components/gift_gallery/gift_gallery_view.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../../widget/refresh_indicator_widget.dart';
import '../viewmodel/all_subjects_progress_viewmodel.dart';

class ProgressAllSubjectsView extends StatefulWidget {
  const ProgressAllSubjectsView({super.key});

  @override
  State<ProgressAllSubjectsView> createState() =>
      _ProgressAllSubjectsViewState();
}

class _ProgressAllSubjectsViewState extends State<ProgressAllSubjectsView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final SubjectsProgressViewModel _viewModel =
      instance<SubjectsProgressViewModel>();
  late PageController _progressPageView;
  int idHolder = -1;
  assignValue(int n) {
    idHolder = n;
  }

  _bind() {
    _viewModel.start();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
    _progressPageView.dispose();
  }

  @override
  void initState() {
    _bind();
    super.initState();
    _progressPageView = PageController();
  }

  Future loadList() async {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _progressPageView,
      physics: const BouncingScrollPhysics(),
      children: [
        _contentWidget(),
        StreamBuilder<int>(
            stream: _viewModel.outSubjectIdDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ProgressSubjectDetailsView(
                  id: snapshot.data!,
                  pageController: _progressPageView,
                );
              } else {
                return StateRenderer(
                  stateRendererType: StateRendererType.fullScreenLoadingState,
                  retryActionFunction: () {},
                );
              }
            })
      ],
    );
  }

  RefreshWidget _contentWidget() {
    return RefreshWidget(
      onRefresh: loadList,
      widgetChild: Scaffold(
        backgroundColor: ColorManager.dark,
        body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.start();
                }) ??
                _getContentWidget();
          },
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return Padding(
      padding: EdgeInsets.only(
          top: AppPadding.p1.h, right: AppPadding.p2.w, left: AppPadding.p3.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomHomeHeaderWidget(
                userFlashNum: _appPreferences.getUserGimNum(),
                userGimNum: _appPreferences.getUserGimNum(),
                userImage: ''),
            SizedBox(
              height: AppSize.s2.h,
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
                size: Size(AppSize.s87.w, AppSize.s07.h),
                painter: CurvePainter(),
              ),
            ),
            SizedBox(
              height: AppSize.s2.h,
            ),
            Row(
              children: [
                Text(
                  LocaleKeys.progress.tr(),
                  style: getSemiBoldDINNextStyle(
                      color: ColorManager.blue, fontSize: AppSize.s22.sp
                      // .h
                      ),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s2.h,
            ),
            StreamBuilder<SubjectsProgressModel>(
                stream: _viewModel.outSubjectsProgressDataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.subjectEducationalYears.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
                            _viewModel.getSubjectId(snapshot.data!
                                .subjectEducationalYears[index]!.subjectId);
                            _progressPageView.animateToPage(1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear);
                          },
                          child: CustomSubjectProgressWidget(
                            image: Constants.baseUrl.substring(
                                    0, Constants.baseUrl.length - 1) +
                                snapshot.data!.subjectEducationalYears[index]!
                                    .subjectImage,
                            subjectName: snapshot.data!
                                .subjectEducationalYears[index]!.subjectArName,
                            progressPercentage: snapshot.data!
                                .subjectEducationalYears[index]!.progressBar,
                            unitsNum: snapshot.data!
                                .subjectEducationalYears[index]!.unitCount,
                            quizesNum: snapshot.data!
                                .subjectEducationalYears[index]!.examCount,
                          ),
                        );
                      },
                    );
                  } else {
                    return StateRenderer(
                      stateRendererType:
                          StateRendererType.fullScreenLoadingState,
                      retryActionFunction: () {
                        _viewModel.start();
                      },
                    );
                  }
                }),
            SizedBox(
              height: AppSize.s5.h,
            ),
          ],
        ),
      ),
    );
  }
}
