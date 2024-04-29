import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/map_model/map_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/map/view/map_library/game_levels_scrolling_map.dart';
import 'package:gamification/presentation/map/view/map_library/model/point_model.dart';
import 'package:gamification/presentation/map/viewmodel/map_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/font_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

import '../component/solved_exam_dialogue.dart';
import '../component/start_exam_dialogue.dart';

class MapVerticalExample extends StatefulWidget {
  const MapVerticalExample({
    Key? key,
    required this.subjectId,
    required this.subjectName,
  }) : super(key: key);

  final int subjectId;
  final String subjectName;

  @override
  State<MapVerticalExample> createState() => _MapVerticalExampleState();
}

class _MapVerticalExampleState extends State<MapVerticalExample> {
  List<PointModel> points = [];
  final MapViewModel _mapViewModel = instance<MapViewModel>();
  int n = -1;
  Artboard? riveArtboard;
  Artboard? riveArtboard2;
  late RiveAnimationController controllerSplash;
  late RiveAnimationController controllerIdle;
  bool rocketLoaded = false;
  _bind() async {
    _mapViewModel.subjectExamsList = await _mapViewModel
        .getSubjectMapById(widget.subjectId); //widget.subjectId

    for (int i = 0; i < _mapViewModel.subjectExamsList.length; i++) {
      print('lllloooop');
      print(_mapViewModel.subjectExamsList[i].examExperience);
      print(_mapViewModel.subjectExamsList[i].examArName);
      points.add(
        PointModel(
          100,
          testWidget(_mapViewModel.subjectExamsList[i]),
        ),
      );
    }
    if (_mapViewModel.subjectExamsList.isEmpty) {
      setState(() => n = 0);
    } else {
      n = 1;
    }

    controllerSplash = SimpleAnimation('Onboarding');
    rootBundle.load('assets/rive/taslim (1).riv').then((data) {
      final file = RiveFile.import(data);
      final art = file.mainArtboard;
      art.addController(controllerSplash);
      riveArtboard = art;
      Future.delayed(const Duration(seconds: 3)).then((value) {
        setState(() => rocketLoaded = true);
      });
    });
      // controllerIdle = SimpleAnimation('Onboarding');
      // rootBundle.load('assets/rive/taslim.riv').then((data) {
      // final file = RiveFile.import(data);
      // final art = file.mainArtboard;
      // art.addController(controllerIdle);
      // riveArtboard2 = art;
   // });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _bind();
  }

  Future loadList() async {
    _bind();
  }

  @override
  void dispose() {
    controllerSplash.dispose();
    controllerIdle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: loadList,
      widgetChild: Scaffold(
        backgroundColor: ColorManager.dark,
        body: (points.isEmpty && n == -1)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : (n == 0)
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageAssets.robot),
                        SizedBox(
                          height: AppSize.s5.h,
                        ),
                        Text(
                          LocaleKeys.emptyMap.tr(),
                          style: getMediumDINNextStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s20.sp),
                        )
                      ],
                    ),
                  )
                : GameLevelsScrollingMap.scrollable(
                    imageUrl: ImageAssets.mapVertical1,
                    direction: Axis.vertical,
                    reverseScrolling: true,
                    pointsPositionDeltaX: 25,
                    pointsPositionDeltaY: 25,
                    svgUrl: ImageAssets.mapVerticalSVG,
                    points: points,
                  ),
      ),
    );
  }

  Widget testWidget(SubjectExamsModel subjectExamsModel) {
    return InkWell(
      child: Stack(
        alignment: Alignment.center,
        children: [
          subjectExamsModel.isCompleted
              ? SvgPicture.asset(
                  ImageAssets.solvedPop,
                  width: AppSize.s10.w,
                  height: AppSize.s10.w,
                )
              : SvgPicture.asset(
                  ImageAssets.notSolvedPop,
                  width: AppSize.s10.w,
                  height: AppSize.s10.w,
                ),
          SizedBox(
            width: AppSize.s13.w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s1.w),
              child: Text(
                subjectExamsModel.examArName,
                textAlign: TextAlign.center,
                style: getMediumDINNextStyle(
                  color: subjectExamsModel.isCompleted
                      ? ColorManager.white
                      : ColorManager.dark,
                  fontSize: FontSize.s13.sp,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        if (subjectExamsModel.notResolved) {
          print('mmmmmmm');
          print(subjectExamsModel.examExperience.toInt());
          print(subjectExamsModel.examMark.toInt());
          print(subjectExamsModel.examId.toInt());
          print('mmmmmmm');
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return StartExamWidget(
                riveArtboard: riveArtboard,
                riveArtboard2: riveArtboard2,
                widget: widget,
                examName: subjectExamsModel.examArName,
                examId: subjectExamsModel.examId,
                experience: subjectExamsModel.examExperience.toInt(),
                time: subjectExamsModel.examTime,
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SolvedExamDialogue(
                widget: widget,
                examName: subjectExamsModel.examArName,
                experience: subjectExamsModel. userExamExperince.toInt(),
                totalMark: subjectExamsModel.totalResult.toInt(),
                userResult: subjectExamsModel.totalResult.toInt(),
                examId: subjectExamsModel.examId,
                grade: subjectExamsModel.totalResult.toInt(),
                totalPoints: subjectExamsModel.userExamPoint.toInt(),
                examExperience: subjectExamsModel.examExperience.toInt(),
                examMark: subjectExamsModel.examMark.toInt(),
              );
            },
          );
        }
      },
    );
  }
}
