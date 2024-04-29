import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScoreBoardExamView extends StatefulWidget {
  const ScoreBoardExamView({Key? key}) : super(key: key);

  @override
  State<ScoreBoardExamView> createState() => _ScoreBoardExamViewState();
}

class _ScoreBoardExamViewState extends State<ScoreBoardExamView> {
  List<DummyScoreBoardData> dummyList = List<DummyScoreBoardData>.generate(
      100, (index) => DummyScoreBoardData('mustafa', Random().nextInt(1000)));
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: AppPadding.p6.h,
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
                      SizedBox(
                        width: AppSize.s16.w,
                      ),
                      Text(
                        LocaleKeys.scoreBoard.tr(),
                        style: getRegularDINNextStyle(
                          color: ColorManager.terracota,
                          fontSize: AppSize.s21.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                ),
                Divider(
                  color: ColorManager.steel,
                  height: AppSize.s005.h,
                ),

                SizedBox(
                  height: AppSize.s70.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: dummyList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap:(){
                          setState(() => selectedIndex = index);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: AppSize.s009.h
                          ),
                          padding:EdgeInsets.symmetric(
                              vertical: AppSize.s1.h,
                              horizontal: AppSize.s4.w
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            color: selectedIndex == index
                                ? ColorManager.grayBrown2
                                : Colors.transparent,
                          ),
                          child: Row(
                            children: [
                            SizedBox(
                              width: AppSize.s10.w,
                              child:   Text(
                                '${index + 1}',
                                style: getMediumDINNextStyle(
                                    color: selectedIndex == index
                                        ? ColorManager.green
                                        : ColorManager.lightBlue,
                                    fontSize: AppSize.s19.sp),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(AppSize.s360),
                                child: SvgPicture.asset(ImageAssets.egyLogo , fit: BoxFit.cover,width: AppSize.s10.w,height: AppSize.s10.w,),
                              ),
                              SizedBox(
                                width: AppSize.s6.w,
                              ),
                              SizedBox(
                                width: AppSize.s35.w,
                                child: Text(dummyList[index].name , style: getRegularDINNextStyle(color:selectedIndex == index
                                    ? ColorManager.green
                                    : ColorManager.lightBlue, fontSize: AppSize.s18.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                dummyList[index].grade.toString(),
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
                SizedBox(
                  height: AppSize.s4.h,
                ),
                CustomButtonWidget(
                  onTap: () {
                  },
                  shadowColor: ColorManager.terracota,
                  borderColor: ColorManager.terracota,
                  backGroundColor: ColorManager.terracota,
                  title: LocaleKeys.next.tr(),
                  textColor: ColorManager.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DummyScoreBoardData {
  final String name;
  final int grade;

  DummyScoreBoardData(this.name, this.grade);
}
