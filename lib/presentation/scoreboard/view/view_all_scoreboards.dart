import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/domain/model/student_rank/student_rank_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/constants.dart';
import '../../../app/di.dart';
import '../../common/state_rendrer/state_renderer.dart';
import '../../widget/refresh_indicator_widget.dart';
import '../viewmodel/scoreboard_viewmodel.dart';

class ViewAllScoreBoardExamView extends StatefulWidget {
  const ViewAllScoreBoardExamView({Key? key}) : super(key: key);

  @override
  State<ViewAllScoreBoardExamView> createState() =>
      _ViewAllScoreBoardExamViewState();
}

class _ViewAllScoreBoardExamViewState extends State<ViewAllScoreBoardExamView> {
  final ScoreBoardViewModel _viewModel = instance<ScoreBoardViewModel>();
  final AppPreferences appPreferences = instance<AppPreferences>();
  int selectedIndex = -1;

  @override
  void initState() {
    _viewModel.start();
    _selectCurrentUser();
    super.initState();
  }

  _selectCurrentUser() async {
    selectedIndex = await appPreferences.getUserId();
    print('current $selectedIndex');
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Future loadList() async {
    _viewModel.start();
  }

  Widget _getContentWidget() {
    return RefreshWidget(
        onRefresh: loadList,
        widgetChild: Scaffold(
          backgroundColor: ColorManager.dark,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SvgPicture.asset(
                      ImageAssets.backgroundCube,
                      fit: BoxFit.fill,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p6.w,
                  vertical: AppPadding.p2.h,
                ),
                child: StreamBuilder<StudentRankModel>(
                    stream: _viewModel.outScoreBoardDataStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: AppPadding.p4.h,
                                  bottom: AppPadding.p2.h,
                                  left: AppPadding.p2.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () => Navigator.pop(context),
                                    icon: Icon(
                                      Icons.close,
                                      size: AppSize.s4.h,
                                      color: ColorManager.terracota,
                                    ),
                                  ),

                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        LocaleKeys.scoreBoard.tr(),
                                        style: getRegularDINNextStyle(
                                          color: ColorManager.terracota,
                                          fontSize: AppSize.s21.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: ColorManager.steel,
                              height: AppSize.s005.h,
                            ),
                            if (snapshot.data!.studentsRankList.isNotEmpty)
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      snapshot.data?.studentsRankList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        //   setState(() => selectedIndex = index);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: AppSize.s009.h),
                                        padding: EdgeInsets.symmetric(
                                            vertical: AppSize.s1.h,
                                            horizontal: AppSize.s4.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              AppSize.s10),
                                          color: selectedIndex ==
                                                  snapshot
                                                      .data
                                                      ?.studentsRankList[index]!
                                                      .userId
                                              ? ColorManager.grayBrown2
                                              : Colors.transparent,
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: AppSize.s10.w,
                                              child: Text(
                                                '${index + 1}',
                                                style: getMediumDINNextStyle(
                                                    color: selectedIndex ==
                                                            snapshot
                                                                .data
                                                                ?.studentsRankList[
                                                                    index]!
                                                                .userId
                                                        ? ColorManager.green
                                                        : ColorManager
                                                            .lightBlue,
                                                    fontSize: AppSize.s19.sp),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppSize.s360),
                                              child: CachedNetworkImage(
                                                imageUrl: Constants.baseUrl
                                                        .substring(
                                                            0,
                                                            Constants.baseUrl
                                                                    .length -
                                                                1) +
                                                    snapshot
                                                        .data!
                                                        .studentsRankList[
                                                            index]!
                                                        .userProfile,
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                fit: BoxFit.cover,
                                                errorWidget: (context, url,
                                                        error) =>
                                                    SvgPicture.asset(ImageAssets
                                                        .profileIcon),
                                                width: AppSize.s10.w,
                                                height: AppSize.s10.w,
                                              ),
                                            ),
                                            SizedBox(
                                              width: AppSize.s6.w,
                                            ),
                                            SizedBox(
                                              width: AppSize.s35.w,
                                              child: Text(
                                                (snapshot
                                                        .data
                                                        ?.studentsRankList[
                                                            index]
                                                        ?.arName ??
                                                    Constants.empty),
                                                style: getRegularDINNextStyle(
                                                    color: selectedIndex ==
                                                            snapshot
                                                                .data
                                                                ?.studentsRankList[
                                                                    index]!
                                                                .userId
                                                        ? ColorManager.green
                                                        : ColorManager
                                                            .lightBlue,
                                                    fontSize: AppSize.s18.sp),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              (snapshot
                                                          .data
                                                          ?.studentsRankList[
                                                              index]
                                                          ?.totalPoints ??
                                                      Constants.zero)
                                                  .toString(),
                                              style: getMediumDINNextStyle(
                                                  color: ColorManager.goldenRod,
                                                  fontSize: AppSize.s19.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (snapshot.data!.studentsRankList.isEmpty)
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: AppSize.s2.h,
                                    ),
                                    SvgPicture.asset(ImageAssets.robot),
                                    SizedBox(
                                      height: AppSize.s2.h,
                                    ),
                                    Text(
                                      LocaleKeys.emptyList.tr(),
                                      style: getMediumDINNextStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s20.sp),
                                    )
                                  ],
                                ),
                              ),
                          ],
                        );
                      } else {
                        return Center(
                          child: StateRenderer(
                            stateRendererType:
                                StateRendererType.fullScreenLoadingState,
                            retryActionFunction: () {
                              _viewModel.getScoreBoardData();
                            },
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ));
  }
}
