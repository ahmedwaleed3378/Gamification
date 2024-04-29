import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/request/all_courses_model.dart';
import 'package:gamification/domain/model/request/category_subcourse_model.dart';
import 'package:gamification/domain/model/request/course_category_model.dart';
import 'package:gamification/domain/model/request/request_learning_model.dart';
import 'package:gamification/domain/model/request/request_teaching_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/home/components/request/request_shimmer.dart';
import 'package:gamification/presentation/home/viewmodel/home_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/network_image_widget.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sticky_headers/sticky_headers.dart';

class RequestView extends StatefulWidget {
  const RequestView({super.key});

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final HomeViewModel _homeViewModel = instance<HomeViewModel>();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Future loadRequests() async {
    _homeViewModel.getRequests();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
      stream: _homeViewModel.outputState,
      builder: (context, snapshot) {
        return snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
              _homeViewModel.getRequests();
            }) ??
            _getContentWidget();
      },
    );
  }

  Widget _getContentWidget() {
    return RefreshWidget(
      onRefresh: loadRequests,
      widgetChild: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p5.w,
            vertical: AppPadding.p3.h,
          ),
          child: Column(
            children: [
              Text(
                LocaleKeys.requests.tr(),
                style: getBoldOxygenStyle(
                  color: ColorManager.gray300,
                  fontSize: AppSize.s21.sp,
                ),
              ),
              SizedBox(height: AppSize.s3.h),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: AppSize.s5.h,
                      decoration: BoxDecoration(
                        color: ColorManager.gray600.withOpacity(AppSize.s01),
                        borderRadius: BorderRadius.circular(AppSize.s15),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: AppPadding.p8.h,
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: ColorManager.orange,
                          borderRadius: BorderRadius.circular(AppSize.s15),
                        ),
                        labelStyle: getBoldOxygenStyle(
                          color: ColorManager.white,
                          fontSize: AppSize.s15.sp,
                        ),
                        labelColor: ColorManager.white,
                        unselectedLabelColor: ColorManager.gray500,
                        tabs: [
                          Tab(text: LocaleKeys.teaching.tr()),
                          Tab(text: LocaleKeys.learning.tr()),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          TeachingRequestTabView(homeViewModel: _homeViewModel),
                          LearningRequestTabView(homeViewModel: _homeViewModel),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}

class LearningRequestTabView extends StatefulWidget {
  const LearningRequestTabView({
    super.key,
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  State<LearningRequestTabView> createState() => _LearningRequestTabViewState();
}

class _LearningRequestTabViewState extends State<LearningRequestTabView> {

  final TextEditingController _requestDurationController = TextEditingController();
  final TextEditingController _requestReasonController = TextEditingController();

  _bind() {
    widget.homeViewModel.getRequests();
    _requestDurationController.addListener(() => widget.homeViewModel
        .setLearningRequestDuration(
        int.parse(_requestDurationController.text)));
    _requestReasonController.addListener(() => widget.homeViewModel
        .setLearningRequestReason(_requestReasonController.text));
  }

  int? courseValue;
  int _numPages = 1;

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: AppSize.s5.h),
          Text(
            LocaleKeys.addLearningRequest.tr(),
            style: getBoldOxygenStyle(
              color: ColorManager.black,
              fontSize: AppSize.s20.sp,
            ),
          ),
          SizedBox(height: AppSize.s2.h),
          Text(
            LocaleKeys.category.tr(),
            style: getBoldOxygenStyle(
              color: ColorManager.orange,
              fontSize: AppSize.s20.sp,
            ),
          ),
          SizedBox(height: AppSize.s2.h),
          StreamBuilder<CourseCategoryModel>(
            stream: widget.homeViewModel.outputAllCourseCategory,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p2.h,
                    vertical: AppPadding.p1.w,
                  ),
                  decoration: ShapeDecoration(
                    color: ColorManager.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: AppSize.s2,
                        color: ColorManager.white22,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppSize.s16),
                      ),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        LocaleKeys.courseName.tr(),
                        style: getBoldOxygenStyle(
                          color: ColorManager.greyDark,
                          fontSize: AppSize.s16.sp,
                        ),
                      ),
                      style: getBoldOxygenStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s16.sp,
                      ),
                      value: courseValue,
                      isExpanded: true,
                      items: [
                        ...snapshot.data!.courseCategoryList!.map(
                          (course) => DropdownMenuItem(
                            value: course.id,
                            child: Text(course.enName.toString()),
                          ),
                        ),
                      ],
                      onChanged: (val) {
                        setState(() => courseValue = val);
                        widget.homeViewModel.getCategorySubCourses(val!);
                      },
                    ),
                  ),
                );
              } else {
                return const RequestShimmer();
                // return StateRenderer(
                //   stateRendererType: StateRendererType.fullScreenLoadingState,
                //   retryActionFunction: () {
                //     widget.homeViewModel.getAllCoursesRequest();
                //   },
                // );
              }
            },
          ),
          SizedBox(height: AppSize.s2.h),
          Text(
            LocaleKeys.courses.tr(),
            style: getBoldOxygenStyle(
              color: ColorManager.orange,
              fontSize: AppSize.s20.sp,
            ),
          ),
          SizedBox(height: AppSize.s2.h),
          StreamBuilder<List<CategorySubCourseModel>>(
            stream: widget.homeViewModel.outputCategorySubCourse,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return AnimationLimiter(
                  child: GridView.count(
                    padding: EdgeInsets.only(top: AppPadding.p2.h),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    childAspectRatio: 1.0 / 1.10,
                    crossAxisCount: AppSize.s2.toInt(),
                    mainAxisSpacing: AppSize.s22,
                    crossAxisSpacing: AppSize.s16,
                    children: List.generate(
                      snapshot.data!.length,
                      (int index) {
                        return AnimationConfiguration.staggeredGrid(
                          columnCount: AppSize.s2.toInt(),
                          position: index,
                          duration:
                              Duration(milliseconds: AppSize.s500.toInt()),
                          child: ScaleAnimation(
                            scale: AppSize.s05,
                            child: FadeInAnimation(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s12),
                                  color: ColorManager.paleGrey,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p12,
                                ).copyWith(top: AppPadding.p2.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: AppSize.s10.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: ColorManager.white,
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s12),
                                        border: Border.all(
                                          color: ColorManager.orange,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s12),
                                        child: NetworkImageWidget(
                                          url: snapshot.data![index].attachFile,
                                          height: AppSize.s14.h,
                                          width: AppSize.s14.h,
                                          errorChild: SvgPicture.asset(
                                            ImageAssets.noImageCourse,
                                            width: AppSize.s14.h,
                                            height: AppSize.s14.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: AppSize.s1.h),
                                    Text(
                                      snapshot.data![index].courseEnName,
                                      maxLines: AppSize.s2.toInt(),
                                      overflow: TextOverflow.ellipsis,
                                      style: getBoldOxygenStyle(
                                        color: ColorManager.greyIshBrown,
                                        fontSize: AppSize.s14.sp,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.s1.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${snapshot.data![index].courseTime} Hours',
                                          maxLines: AppSize.s2.toInt(),
                                          overflow: TextOverflow.ellipsis,
                                          style: getBoldOxygenStyle(
                                            color: ColorManager.greyIshBrown,
                                            fontSize: AppSize.s14.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppSize.s20.w,
                                          height: AppSize.s3.h,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              widget.homeViewModel.courseRequest.courseId = snapshot.data![index].id;

                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    content: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Card(
                                                          shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                              width: AppSize.s2,
                                                              color: ColorManager.white22,
                                                            ),
                                                            borderRadius: const BorderRadius.all(
                                                              Radius.circular(AppSize.s16),
                                                            ),
                                                          ),
                                                          margin: EdgeInsets.zero,
                                                          child: SizedBox(
                                                            height: AppSize.s7.h,
                                                            child: StreamBuilder<bool>(
                                                              stream: widget.homeViewModel.outputIsLearningDurationValid,
                                                              builder: (context, snapshot) {
                                                                return TextFormField(
                                                                  style: getBoldOxygenStyle(
                                                                    color: ColorManager.greyDark,
                                                                    fontSize: AppSize.s16.sp,
                                                                  ),
                                                                  validator: (value) {
                                                                    return value!.isEmpty
                                                                        ? 'Please enter valid value '
                                                                        : int.parse(value) == 0
                                                                        ? 'Please enter valid value > 0'
                                                                        : null;
                                                                  },
                                                                  controller: _requestDurationController,
                                                                  keyboardType: TextInputType.number,
                                                                  cursorColor: ColorManager.orange,
                                                                  decoration: InputDecoration(
                                                                    enabledBorder: InputBorder.none,
                                                                    focusedBorder: InputBorder.none,
                                                                    errorBorder: InputBorder.none,
                                                                    errorText: (snapshot.data ?? true)
                                                                        ? null
                                                                        : 'Please enter valid value',
                                                                    hintText: LocaleKeys.noOfDays.tr(),
                                                                    hintStyle: getBoldOxygenStyle(
                                                                      color: ColorManager.greyDark,
                                                                      fontSize: AppSize.s16.sp,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: AppSize.s2.h),
                                                        Card(
                                                          shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                              width: AppSize.s2,
                                                              color: ColorManager.white22,
                                                            ),
                                                            borderRadius: const BorderRadius.all(
                                                              Radius.circular(AppSize.s16),
                                                            ),
                                                          ),
                                                          margin: EdgeInsets.zero,
                                                          child: SizedBox(
                                                            height: AppSize.s15.h,
                                                            child: StreamBuilder<bool>(
                                                              stream: widget.homeViewModel.outputIsLearningReasonValid,
                                                              builder: (context, snapshot) {
                                                                return TextFormField(
                                                                  style: getBoldOxygenStyle(
                                                                    color: ColorManager.greyDark,
                                                                    fontSize: AppSize.s16.sp,
                                                                  ),
                                                                  validator: (String? value) =>
                                                                  value!.isEmpty ? ' Please enter valid value' : null,
                                                                  controller: _requestReasonController,
                                                                  keyboardType: TextInputType.text,
                                                                  maxLines: null,
                                                                  cursorColor: ColorManager.orange,
                                                                  decoration: InputDecoration(
                                                                    errorText: (snapshot.data ?? true)
                                                                        ? null
                                                                        : 'Please enter valid value',
                                                                    enabledBorder: InputBorder.none,
                                                                    focusedBorder: InputBorder.none,
                                                                    errorBorder: InputBorder.none,
                                                                    hintText: LocaleKeys.requestReason.tr(),
                                                                    hintStyle: getBoldOxygenStyle(
                                                                      color: ColorManager.greyDark,
                                                                      fontSize: AppSize.s16.sp,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor: ColorManager
                                                              .white200, // Background color
                                                        ),
                                                        child: Text(
                                                          LocaleKeys.cancel.tr(),
                                                          style: getBoldOxygenStyle(
                                                            color:
                                                            ColorManager.black,
                                                            fontSize:
                                                            AppSize.s18.sp,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      SizedBox(width: AppSize.s2.w),
                                                      StreamBuilder<bool>(
                                                        stream: widget.homeViewModel.outputIsLearningAllDataValid,
                                                        builder: (context, snapshot) {
                                                          return ElevatedButton(
                                                            child: Text(
                                                              LocaleKeys.request.tr(),
                                                              style: getBoldOxygenStyle(
                                                                color:
                                                                ColorManager.white,
                                                                fontSize:
                                                                AppSize.s18.sp,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              widget.homeViewModel.addCourseRequest();
                                                              Navigator.of(context).pop();
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Text(
                                              LocaleKeys.request.tr(),
                                              style: getBoldOxygenStyle(
                                                color: ColorManager.white,
                                                fontSize: AppSize.s14.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return SizedBox(height: AppSize.s20.h);
              }
            },
          ),
          SizedBox(height: AppSize.s2.h),
          StreamBuilder<RequestLearningModel>(
            stream: widget.homeViewModel.outputLearningRequest,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _numPages =
                    (snapshot.data!.countItems / 10 /* 10 items in page */)
                        .ceil();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.enrollRequests.tr(),
                      style: getBoldOxygenStyle(
                        color: ColorManager.black33,
                        fontSize: AppSize.s20.sp,
                      ),
                    ),
                    SizedBox(height: AppSize.s2.h),
                    StickyHeader(
                        header: Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          padding:
                              EdgeInsets.symmetric(vertical: AppPadding.p1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '',
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.greyDark,
                                    fontSize: AppSize.s16.sp,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSize.s4),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  LocaleKeys.courseName.tr(),
                                  textAlign: TextAlign.center,
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.greyDark,
                                    fontSize: AppSize.s16.sp,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSize.s4),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  LocaleKeys.durationDays.tr(),
                                  textAlign: TextAlign.center,
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.greyDark,
                                    fontSize: AppSize.s16.sp,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSize.s4),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  LocaleKeys.status.tr(),
                                  textAlign: TextAlign.center,
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.greyDark,
                                    fontSize: AppSize.s16.sp,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSize.s4),
                            ],
                          ),
                        ),
                        content: Column(children: [
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.requests!.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                color: ColorManager.white100,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppSize.s20),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p5.w,
                                    vertical: AppPadding.p2.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              '${index + 1}',
                                              style: getBoldOxygenStyle(
                                                color: ColorManager.black,
                                                fontSize: AppSize.s20.sp,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: AppSize.s4),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              snapshot.data!.requests![index]
                                                  .courseEnName,
                                              textAlign: TextAlign.center,
                                              style: getMediumInterStyle(
                                                color: ColorManager.black,
                                                fontSize: AppSize.s14.sp,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: AppSize.s4),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${snapshot.data!.requests![index].numberOfDays}',
                                              textAlign: TextAlign.center,
                                              style: getBoldOxygenStyle(
                                                color: ColorManager.black,
                                                fontSize: AppSize.s16.sp,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: AppSize.s4),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              snapshot.data!.requests![index]
                                                      .status
                                                  ? LocaleKeys.approved.tr()
                                                  : LocaleKeys.waiting.tr(),
                                              textAlign: TextAlign.center,
                                              style: getBoldOxygenStyle(
                                                color: snapshot.data!
                                                        .requests![index].status
                                                    ? ColorManager.green
                                                    : ColorManager.orange,
                                                fontSize: AppSize.s16.sp,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: AppSize.s4),
                                        ],
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        color: Colors.red,
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Text(
                                                  "Are you want to delete ${snapshot.data!.requests![index].courseEnName} course?",
                                                  style: getBoldOxygenStyle(
                                                    color: ColorManager.black,
                                                    fontSize: AppSize.s18.sp,
                                                  ),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: ColorManager
                                                          .white200, // Background color
                                                    ),
                                                    child: Text(
                                                      LocaleKeys.cancel.tr(),
                                                      style: getBoldOxygenStyle(
                                                        color:
                                                            ColorManager.black,
                                                        fontSize:
                                                            AppSize.s18.sp,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  SizedBox(width: AppSize.s3.w),
                                                  ElevatedButton(
                                                    child: Text(
                                                      LocaleKeys.delete.tr(),
                                                      style: getBoldOxygenStyle(
                                                        color:
                                                            ColorManager.white,
                                                        fontSize:
                                                            AppSize.s18.sp,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      widget.homeViewModel
                                                          .deleteCourseRequest(
                                                              snapshot
                                                                  .data!
                                                                  .requests![
                                                                      index]
                                                                  .id);
                                                      Navigator.of(context)
                                                          .pop();
                                                      StateRenderer(
                                                        stateRendererType:
                                                            StateRendererType
                                                                .fullScreenLoadingState,
                                                        retryActionFunction:
                                                            () {
                                                          widget.homeViewModel
                                                              .getCoursesRequest();
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: AppSize.s1_5.h),
                          ),
                          SizedBox(height: AppSize.s2.h),
                          NumberPaginator(
                            numberPages: _numPages,
                            config: NumberPaginatorUIConfig(
                              buttonSelectedForegroundColor: ColorManager.white,
                              buttonUnselectedForegroundColor: Colors.white,
                              buttonUnselectedBackgroundColor: Colors.grey,
                              buttonSelectedBackgroundColor:
                                  ColorManager.orange,
                            ),
                            onPageChange: (int index) {
                              setState(() {
                                widget.homeViewModel.learningRequestPage =
                                    (index + 1);
                              });
                              widget.homeViewModel.getCoursesRequest();
                            },
                          )
                        ])),
                    SizedBox(height: AppSize.s2.h),
                  ],
                );
              } else {
                return const RequestShimmer();
              }
            },
          ),
        ],
      ),
    );
  }
}

class TeachingRequestTabView extends StatefulWidget {
  const TeachingRequestTabView({
    super.key,
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  State<TeachingRequestTabView> createState() => _TeachingRequestTabViewState();
}

class _TeachingRequestTabViewState extends State<TeachingRequestTabView> {
  int? courseValue;

  int _numPages = 1;
  final TextEditingController _requestDurationController =
      TextEditingController();
  final TextEditingController _requestDetailsController =
      TextEditingController();

  _bind() {
    widget.homeViewModel.getRequests();
    _requestDurationController.addListener(() => widget.homeViewModel
        .setTeachingRequestDuration(
            int.parse(_requestDurationController.text)));
    _requestDetailsController.addListener(() => widget.homeViewModel
        .setTeachingRequestDetails(_requestDetailsController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: AppSize.s5.h),
          Text(
            LocaleKeys.addTeachingRequest.tr(),
            style: getBoldOxygenStyle(
              color: ColorManager.black,
              fontSize: AppSize.s20.sp,
            ),
          ),
          SizedBox(height: AppSize.s2.h),
          StreamBuilder<AllCoursesRequestModel>(
            stream: widget.homeViewModel.outputAllCoursesRequest,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p2.h,
                    vertical: AppPadding.p1.w,
                  ),
                  decoration: ShapeDecoration(
                    color: ColorManager.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: AppSize.s2,
                        color: ColorManager.white22,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppSize.s16),
                      ),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        LocaleKeys.courseName.tr(),
                        style: getBoldOxygenStyle(
                          color: ColorManager.greyDark,
                          fontSize: AppSize.s16.sp,
                        ),
                      ),
                      style: getBoldOxygenStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s16.sp,
                      ),
                      value: courseValue,
                      isExpanded: true,
                      items: [
                        ...snapshot.data!.courses!.map(
                          (course) => DropdownMenuItem(
                            value: course.id,
                            child: Text(course.courseEnName.toString()),
                          ),
                        ),
                      ],
                      onChanged: (val) {
                        setState(() => courseValue = val);
                        widget.homeViewModel.teachingRequest.courseId = val;
                      },
                    ),
                  ),
                );
              } else {
                return const RequestShimmer();
                // return StateRenderer(
                //   stateRendererType: StateRendererType.fullScreenLoadingState,
                //   retryActionFunction: () {
                //     widget.homeViewModel.getAllCoursesRequest();
                //   },
                // );
              }
            },
          ),
          SizedBox(height: AppSize.s2.h),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: AppSize.s2,
                color: ColorManager.white22,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(AppSize.s16),
              ),
            ),
            margin: EdgeInsets.zero,
            child: SizedBox(
              height: AppSize.s7.h,
              child: StreamBuilder<bool>(
                stream: widget.homeViewModel.outputIsTeachingDurationValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    style: getBoldOxygenStyle(
                      color: ColorManager.greyDark,
                      fontSize: AppSize.s16.sp,
                    ),
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Please enter valid value '
                          : int.parse(value) == 0
                              ? 'Please enter valid value > 0'
                              : null;
                    },
                    controller: _requestDurationController,
                    keyboardType: TextInputType.number,
                    cursorColor: ColorManager.orange,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      errorText: (snapshot.data ?? true)
                          ? null
                          : 'Please enter valid value',
                      hintText: LocaleKeys.noOfDays.tr(),
                      hintStyle: getBoldOxygenStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s16.sp,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: AppSize.s2.h),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: AppSize.s2,
                color: ColorManager.white22,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(AppSize.s16),
              ),
            ),
            margin: EdgeInsets.zero,
            child: SizedBox(
              height: AppSize.s20.h,
              child: StreamBuilder<bool>(
                stream: widget.homeViewModel.outputIsTeachingDetailsValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    style: getBoldOxygenStyle(
                      color: ColorManager.greyDark,
                      fontSize: AppSize.s16.sp,
                    ),
                    validator: (String? value) =>
                        value!.isEmpty ? ' Please enter valid value' : null,
                    controller: _requestDetailsController,
                    keyboardType: TextInputType.text,
                    maxLines: null,
                    cursorColor: ColorManager.orange,
                    decoration: InputDecoration(
                      errorText: (snapshot.data ?? true)
                          ? null
                          : 'Please enter valid value',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: LocaleKeys.courseDetails.tr(),
                      hintStyle: getBoldOxygenStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s16.sp,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: AppSize.s4.h),
          StreamBuilder<bool>(
            stream: widget.homeViewModel.outputIsTeachingAllDataValid,
            builder: (context, snapshot) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p12.h,
                ),
                child: MaterialButton(
                  padding: EdgeInsets.all(AppPadding.p07.h),
                  onPressed: () {
                    widget.homeViewModel.addTeachingRequest();
                    _requestDetailsController.clear();
                    _requestDurationController.clear();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppSize.s15,
                    ),
                  ),
                  color: ColorManager.orange,
                  child: Text(
                    LocaleKeys.add.tr(),
                    style: getBoldOxygenStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s22.sp,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: AppSize.s2.h),
          StreamBuilder<RequestTeachingModel>(
            stream: widget.homeViewModel.outputRequestTeaching,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _numPages =
                    (snapshot.data!.countItems / 10 /* 10 items in page */)
                        .ceil();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.enrollRequests.tr(),
                      style: getBoldOxygenStyle(
                        color: ColorManager.black33,
                        fontSize: AppSize.s20.sp,
                      ),
                    ),
                    SizedBox(height: AppSize.s2.h),
                    StickyHeader(
                        header: Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          padding:
                              EdgeInsets.symmetric(vertical: AppPadding.p1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '',
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.greyDark,
                                    fontSize: AppSize.s16.sp,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSize.s4),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  LocaleKeys.courseName.tr(),
                                  textAlign: TextAlign.center,
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.greyDark,
                                    fontSize: AppSize.s16.sp,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSize.s4),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  LocaleKeys.durationDays.tr(),
                                  textAlign: TextAlign.center,
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.greyDark,
                                    fontSize: AppSize.s16.sp,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSize.s4),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  LocaleKeys.status.tr(),
                                  textAlign: TextAlign.center,
                                  style: getBoldOxygenStyle(
                                    color: ColorManager.greyDark,
                                    fontSize: AppSize.s16.sp,
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSize.s4),
                            ],
                          ),
                        ),
                        content: Column(children: [
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.requests!.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                color: ColorManager.white100,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppSize.s20),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p5.w,
                                    vertical: AppPadding.p2.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              '${index + 1}',
                                              style: getBoldOxygenStyle(
                                                color: ColorManager.black,
                                                fontSize: AppSize.s20.sp,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: AppSize.s4),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              snapshot.data!.requests![index]
                                                  .courseEnName,
                                              textAlign: TextAlign.center,
                                              style: getMediumInterStyle(
                                                color: ColorManager.black,
                                                fontSize: AppSize.s14.sp,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: AppSize.s4),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${snapshot.data!.requests![index].numberOfDays}',
                                              textAlign: TextAlign.center,
                                              style: getBoldOxygenStyle(
                                                color: ColorManager.black,
                                                fontSize: AppSize.s16.sp,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: AppSize.s4),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              snapshot.data!.requests![index]
                                                      .status
                                                  ? LocaleKeys.approved.tr()
                                                  : LocaleKeys.waiting.tr(),
                                              textAlign: TextAlign.center,
                                              style: getBoldOxygenStyle(
                                                color: snapshot.data!
                                                        .requests![index].status
                                                    ? ColorManager.green
                                                    : ColorManager.orange,
                                                fontSize: AppSize.s16.sp,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: AppSize.s4),
                                        ],
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        color: Colors.red,
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Text(
                                                  "Are you want to delete ${snapshot.data!.requests![index].courseEnName} course?",
                                                  style: getBoldOxygenStyle(
                                                    color: ColorManager.black,
                                                    fontSize: AppSize.s18.sp,
                                                  ),
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: ColorManager
                                                          .white200, // Background color
                                                    ),
                                                    child: Text(
                                                      "Cancel",
                                                      style: getBoldOxygenStyle(
                                                        color:
                                                            ColorManager.black,
                                                        fontSize:
                                                            AppSize.s18.sp,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  SizedBox(width: AppSize.s3.w),
                                                  ElevatedButton(
                                                    child: Text(
                                                      "Delete",
                                                      style: getBoldOxygenStyle(
                                                        color:
                                                            ColorManager.white,
                                                        fontSize:
                                                            AppSize.s18.sp,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      widget.homeViewModel
                                                          .deleteTeachingRequest(
                                                              snapshot
                                                                  .data!
                                                                  .requests![
                                                                      index]
                                                                  .id);
                                                      Navigator.of(context)
                                                          .pop();
                                                      StateRenderer(
                                                        stateRendererType:
                                                            StateRendererType
                                                                .fullScreenLoadingState,
                                                        retryActionFunction:
                                                            () {
                                                          widget.homeViewModel
                                                              .getTeachingRequest();
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: AppSize.s1_5.h),
                          ),
                          SizedBox(height: AppSize.s2.h),
                          NumberPaginator(
                            numberPages: _numPages,
                            config: NumberPaginatorUIConfig(
                              buttonSelectedForegroundColor: ColorManager.white,
                              buttonUnselectedForegroundColor: Colors.white,
                              buttonUnselectedBackgroundColor: Colors.grey,
                              buttonSelectedBackgroundColor:
                                  ColorManager.orange,
                            ),
                            onPageChange: (int index) {
                              setState(() {
                                widget.homeViewModel.teachingRequestPage =
                                    (index + 1);
                              });
                              widget.homeViewModel.getTeachingRequest();
                            },
                          )
                        ])),
                    SizedBox(height: AppSize.s2.h),
                  ],
                );
              } else {
                return const RequestShimmer();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
