import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/unit_files/unit_files_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/subject/viewmodel/subject_viewmodel.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResourcesTabBarView extends StatefulWidget {
  final int subjectId;
  final SubjectViewModel subjectViewModel;

  const ResourcesTabBarView({
    super.key,
    required this.subjectViewModel,
    required this.subjectId,
  });

  @override
  State<ResourcesTabBarView> createState() => _ResourcesTabBarViewState();
}

class _ResourcesTabBarViewState extends State<ResourcesTabBarView>
    with TickerProviderStateMixin {
  late TabController _resourcesTabController;
  final SubjectViewModel _subjectViewModel = instance<SubjectViewModel>();

  _bind() {
    _subjectViewModel.start();
    _subjectViewModel.getUnitFile(widget.subjectId);
    _resourcesTabController = TabController(length: 0, vsync: this);
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _resourcesTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UnitFileModel>(
      stream: _subjectViewModel.outputUnitFile,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _resourcesTabController = TabController(
            length: snapshot.data!.unitData!.length,
            vsync: this,
          );

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: AppSize.s5_5.h,
                  padding: EdgeInsets.all(AppPadding.p2.w),
                  child: TabBar(
                    controller: _resourcesTabController,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      color: ColorManager.orange,
                      borderRadius: BorderRadius.circular(AppSize.s13),
                    ),
                    labelStyle: getBoldOxygenStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s15.sp,
                    ),
                    labelColor: ColorManager.white,
                    unselectedLabelColor: ColorManager.gray33,
                    tabs: List<Widget>.generate(
                      snapshot.data!.unitData!.length,
                      (int index) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.p2.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s13),
                          border: Border.all(
                            color: ColorManager.orange,
                            width: AppSize.s1_5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Tab(text: snapshot.data!.unitData![index].arName),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s100.h,
                  child: TabBarView(
                    controller: _resourcesTabController,
                    children: List<Widget>.generate(
                      snapshot.data!.unitData!.length,
                      (int index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p7.w,
                          vertical: AppPadding.p2.h,
                        ),
                        child: Column(
                          children: [
                            snapshot.data!.unitData![index].fileEduUnit!
                                    .isNotEmpty
                                ? ListView.separated(
                                    itemCount: snapshot.data!.unitData![index].fileEduUnit!.length,
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: AppPadding.p3.w,
                                        ),
                                        child: Card(
                                          color: ColorManager.white,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(AppSize.s15),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: AppPadding.p5.w,
                                              vertical: AppPadding.p2.h,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  ImageAssets.pdfIcon,
                                                  height: AppSize.s5.h,
                                                ),
                                                Text(
                                                  snapshot.data!.unitData![index].fileEduUnit![index],
                                                  style: getBoldOxygenStyle(
                                                    color: ColorManager.gray34,
                                                    fontSize: AppSize.s16.sp,
                                                  ),
                                                ),
                                                Card(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                          AppSize.s15),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        AppPadding.p04.w),
                                                    child: const Icon(
                                                        Icons.arrow_downward),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (index, context) =>
                                        SizedBox(
                                      height: AppSize.s1.h,
                                    ),
                                  )
                                : SizedBox(
                                    height: AppSize.s70.h,
                                    width: AppSize.s70.h,
                                    child: ListView(
                                      shrinkWrap: true,
                                      primary: Platform.isIOS ? false : true,
                                      physics: const BouncingScrollPhysics(),
                                      children: [
                                        Lottie.asset(JsonAssets.emptyContent),
                                        Text(
                                          LocaleKeys.emptyList.tr(),
                                          textAlign: TextAlign.center,
                                          style: getBoldOxygenStyle(
                                            color: ColorManager.warmGrey,
                                            fontSize: AppSize.s19.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
