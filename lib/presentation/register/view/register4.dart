import 'package:bubble/bubble.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/register/register_model.dart';
import 'package:gamification/presentation/register/view/widgets/custom_stage_button.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

import '../../../app/functions.dart';
import '../../../generated/locale_keys.g.dart';
import '../../common/state_rendrer/state_renderer.dart';
import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import '../../widget/custom_button.dart';
import '../viewmodel/register_viewmodel.dart';

class RegisterView4 extends StatefulWidget {
  const RegisterView4({
    super.key,
    required this.viewModel,
    required this.pageController,
  });

  final PageController pageController;
  final RegisterViewModel viewModel;

  @override
  State<RegisterView4> createState() => _RegisterView4State();
}

class _RegisterView4State extends State<RegisterView4> {
  Artboard? riveArtboard;
  late RiveAnimationController? controllerRobotLogin;
  Color color = ColorManager.steel50;
  bool isNavigationVaild = false;
  bool isStageSelected = false;
  String? selectedDropMenuButton;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _bind() async {
    String lang = await _appPreferences.getAppLanguage();
    widget.viewModel.getStages(lang);
  }

  List<String> stagesImage = [
    ImageAssets.childIcons,
    ImageAssets.pupilIcons,
    ImageAssets.studentIcons,
    ImageAssets.graduatedIcons,
  ];

  @override
  void initState() {
    _bind();
    selectedIndex = widget.viewModel.stage;
    isNavigationVaild = widget.viewModel.register8Nav;

    var controllerRobotLogin = SimpleAnimation('Writing');

    rootBundle.load(RiveAssets.writingRobot).then((data) {
      try {
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        art.addController(controllerRobotLogin);
        setState(() => riveArtboard = art);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    super.initState();
  }

  int selectedIndex = -1;

  Color bord = ColorManager.coolGrey;

  EduYearModel? examEduModel;

  @override
  Widget build(BuildContext context) {
    return _getContentWidget(context);
  }

  Scaffold _getContentWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: AppSize.s0.h,
              left: AppSize.s3.w,
              right: AppSize.s3.w,
              bottom: AppSize.s2.h,
            ),
            child: Column(
              children: [
                // SizedBox(height: AppSize.s8.h),
                // const RegisterStepper(score: 4),
                // SizedBox(height: AppSize.s6.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppSize.s15.h,
                      height: AppSize.s20.h,
                      child: riveArtboard != null
                          ? Rive(
                              artboard: riveArtboard!,
                            )
                          : SizedBox.shrink(
                              child: Container(color: ColorManager.dark),
                            ),
                    ),
                    SizedBox(
                      width: AppSize.s60.w,
                      child: Bubble(
                        borderColor: ColorManager.secondaryText,
                        radius: const Radius.circular(AppSize.s10),
                        color: ColorManager.transparent,
                        margin: const BubbleEdges.only(top: AppSize.s10),
                        nip: isCurrentLanguageEn(context)
                            ? BubbleNip.leftBottom
                            : BubbleNip.rightBottom,
                        child: Text(
                          LocaleKeys.letsBuildAcademic.tr(),
                          style: getRegularDINNextStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s19.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<List<AllStagesModel>>(
                    stream: widget.viewModel.outStagesDataStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return StageButton(
                              viewModel: widget.viewModel,
                              id: snapshot.data![index].stages!.id,
                              arName: snapshot.data![index].stages!.arName,
                              imagePath: stagesImage[index],
                              color: selectedIndex == index
                                  ? ColorManager.blue.withOpacity(0.7)
                                  : ColorManager.secondaryText.withOpacity(0.4),
                              bgColor: selectedIndex == index
                                  ? ColorManager.blue.withOpacity(0.06)
                                  : ColorManager.steel50.withOpacity(0.071),
                              onTap: () {
                                examEduModel = null;
                                setState(() {
                                  selectedIndex = index;
                                  isNavigationVaild = false;
                                  isStageSelected = !isStageSelected;
                                  widget.viewModel.register8Nav =
                                      isNavigationVaild;
                                });
                                widget.viewModel.stage = index;
                                widget.viewModel.getEduYears(
                                    snapshot.data![index].stages!.id);
                                widget.viewModel.setStageId(
                                    snapshot.data![index].stages!.id);
                              },
                            );
                          },
                        );
                      } else {
                        return StateRenderer(
                          stateRendererType:
                              StateRendererType.fullScreenLoadingState,
                          retryActionFunction: () {
                            widget.viewModel.getStages(
                                isCurrentLanguageEn(context) ? 'en' : 'ar');
                          },
                        );
                      }
                    }),
                SizedBox(height: AppSize.s2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: AppSize.s1_5.h),
                    Text(
                      LocaleKeys.year.tr(),
                      style: getMediumDINNextStyle(
                        color: ColorManager.white,
                        fontSize: 20.sp,
                      ),
                    )
                  ],
                ),
                SizedBox(height: AppSize.s2.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.s2.w,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: AppSize.s2.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorManager.charcoalGrey,
                    border: Border.all(color: ColorManager.secondaryText),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                        color: ColorManager.black.withOpacity(0.25),
                        spreadRadius: 0.25,
                        blurStyle: BlurStyle.inner,
                      ),
                    ],
                  ),
                  child: StreamBuilder<AllEduYearsModel>(
                    stream: widget.viewModel.outEduYearsDataStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Set<EduYearModel?> eduYearset =
                            snapshot.data!.eduYears.toSet();
                        return DropdownButtonHideUnderline(
                          child: DropdownButton<EduYearModel>(
                            dropdownColor: ColorManager.charcoalGrey,
                            elevation: AppSize.s3.toInt(),
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            value: examEduModel,
                            onChanged: (EduYearModel? data) {
                              setState(() {
                                examEduModel = data!;
                                isNavigationVaild = true;
                                widget.viewModel.register8Nav =
                                    isNavigationVaild;
                              });
                              widget.viewModel.setEduYearId(data!.id);
                            },
                            padding: const EdgeInsets.all(0),
                            items: eduYearset.map(
                              (e) {
                                return DropdownMenuItem<EduYearModel>(
                                  value: e!,
                                  alignment: Alignment.center,
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(AppSize.s05.h),
                                    margin: EdgeInsets.all(AppSize.s05.h),
                                    width: AppSize.s70.w,
                                    decoration: BoxDecoration(
                                      color: ColorManager.charcoalGrey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      e.arName,
                                      textAlign: TextAlign.center,
                                      style: getRegularDINNextStyle(
                                        color: ColorManager.white,
                                        fontSize: FontSize.s18.sp,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        );
                      } else {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.s2.w,
                            vertical: AppSize.s07.h,
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: AppSize.s2.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorManager.charcoalGrey,
                          ),
                          child: Text(
                            LocaleKeys.year.tr(),
                            style: getRegularDINNextStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s18.sp,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: AppSize.s2.h,
                ),
                StreamBuilder<bool?>(
                    stream: widget.viewModel.outputAreAllInputsValid,
                    builder: (context, snapshot) {
                      return CustomButtonWidget(
                        onTap: (snapshot.data ??
                                false ||
                                    (widget.viewModel.register9Nav &&
                                        widget.viewModel.register8Nav &&
                                        widget.viewModel.register5Nav &&
                                        widget.viewModel.register4Nav &&
                                        widget.viewModel.register3Nav &&
                                        widget.viewModel.register2Nav &&
                                        widget.viewModel.register1Nav))
                            ? () {
                                widget.viewModel.register(context);
                                // widget.viewModel.register9Nav = true;
                              }
                            : null,
                        backGroundColor: ColorManager.primaryColor,
                        borderColor: ColorManager.transparent,
                        shadowColor: ColorManager.orange11,
                        textColor: ColorManager.white,
                        title: LocaleKeys.continu.tr(),
                      );
                    }),
                // CustomButtonWidget(
                //   onTap: (selectedIndex != -1 && isNavigationVaild)
                //       ? () {
                //           widget.pageController.nextPage(
                //             duration: const Duration(milliseconds: 300),
                //             curve: Curves.easeIn,
                //           );
                //         }
                //       : null,
                //   backGroundColor: ColorManager.primaryColor,
                //   borderColor: ColorManager.transparent,
                //   shadowColor: ColorManager.orange11,
                //   textColor: ColorManager.white,
                //   title: LocaleKeys.continu.tr(),
                // ),
                SizedBox(height: AppSize.s7.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
