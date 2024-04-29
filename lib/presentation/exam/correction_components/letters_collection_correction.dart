import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/empty_text_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class LettersCollectionsCorrectionView extends StatefulWidget {
  const LettersCollectionsCorrectionView({Key? key}) : super(key: key);

  @override
  State<LettersCollectionsCorrectionView> createState() =>
      _LettersCollectionsCorrectionViewState();
}

class _LettersCollectionsCorrectionViewState
    extends State<LettersCollectionsCorrectionView> {
  final bool correction = true;
  List<String> letters = [
    'A',
    'Y',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'Z',
    'X',
    'Q',
    'T',
    'L',
  ];
  List<String> selectedLetters = [];
  Artboard? riveArtboard;
  late RiveAnimationController controllerRobot;
  bool voicePlay = false;
  int lettersIndex = -1;
  int selectedLettersIndex = -1;
  late AudioPlayer player;

  playAudio(String audioUrl) async {
    await player.play(UrlSource(audioUrl));
  }

  @override
  void initState() {
    controllerRobot = SimpleAnimation('idle');
    rootBundle.load(RiveAssets.taslimaRobot).then((data) {
      try {
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        art.addController(controllerRobot);
        setState(() => riveArtboard = art);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    player = AudioPlayer();
    player.onPlayerComplete.listen((event) {
      setState(() => voicePlay = false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
        backgroundColor: ColorManager.dark,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: AppPadding.p7.w,
                right: AppPadding.p7.w,
                top: AppPadding.p6.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.s5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'English',
                              style: getSemiBoldSFProDisplayCStyle(
                                  color: ColorManager.terracota,
                                  fontSize: AppSize.s22.sp),
                            ),
                            SizedBox(
                              height: AppSize.s1.h,
                            ),
                            Text(
                              'Unit 1 lesson 3',
                              style: getSemiBoldSFProDisplayCStyle(
                                  color: ColorManager.lightGreen,
                                  fontSize: AppSize.s18.sp),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          ImageAssets.arabicSubject,
                          width: AppSize.s7.h,
                          height: AppSize.s7.h,
                        ),
                      ],
                    ),
                  ),

                  /// TODO STEPPER NOT ADDED
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.s5.w)
                        .copyWith(bottom: AppSize.s3.h, top: AppSize.s6.h),
                    child: Text(
                      LocaleKeys.listenAndWrite.tr(),
                      style: getMediumDINNextStyle(
                          color: ColorManager.white, fontSize: AppSize.s20),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      //height: AppSize.s27.h,
                      padding: EdgeInsets.symmetric(
                          vertical: AppPadding.p1.h,
                          horizontal: AppPadding.p2.w),
                      decoration: BoxDecoration(
                        color: ColorManager.newWidget,
                        borderRadius: BorderRadius.circular(AppSize.s14),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: AppSize.s14.h,
                                height: AppSize.s14.h,
                                child: riveArtboard != null
                                    ? Rive(
                                        artboard: riveArtboard!,
                                      )
                                    : SizedBox.shrink(
                                        child:
                                            Container(color: ColorManager.dark),
                                      ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() => voicePlay = true);
                                    playAudio(
                                        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3');
                                  },
                                  child: SvgPicture.asset(
                                    voicePlay
                                        ? ImageAssets.soundWaveThree
                                        : ImageAssets.soundWaveOne,
                                    width: AppSize.s3.h,
                                    height: AppSize.s3.h,
                                  )),
                              const Spacer(),
                              Container(
                                width: AppSize.s34.w,
                                height: AppSize.s13.h,
                                padding: EdgeInsets.symmetric(
                                    vertical: AppPadding.p1.h,
                                    horizontal: AppPadding.p2.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: ColorManager.charcoalGrey,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s20),
                                ),
                                child: SvgPicture.asset(
                                  ImageAssets.table,
                                  width: AppSize.s16.w,
                                  height: AppSize.s15.h,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppSize.s1.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                EmptyTextContainer(
                                  text: 'T',
                                  backgroundColor: correction
                                      ? ColorManager.correctGreen
                                      : ColorManager.red,
                                  textColor: ColorManager.white,
                                ),
                                EmptyTextContainer(
                                  text: 'A',
                                  backgroundColor: correction
                                      ? ColorManager.correctGreen
                                      : ColorManager.red,
                                  textColor: ColorManager.white,
                                ),
                                EmptyTextContainer(
                                  text: 'A',
                                  backgroundColor: correction
                                      ? ColorManager.correctGreen
                                      : ColorManager.red,
                                  textColor: ColorManager.white,
                                ),
                                EmptyTextContainer(
                                  text: 'B',
                                  backgroundColor: correction
                                      ? ColorManager.correctGreen
                                      : ColorManager.red,
                                  textColor: ColorManager.white,
                                ),
                                EmptyTextContainer(
                                  text: 'L',
                                  backgroundColor: correction
                                      ? ColorManager.correctGreen
                                      : ColorManager.red,
                                  textColor: ColorManager.white,
                                ),
                                EmptyTextContainer(
                                  text: 'L',
                                  backgroundColor: correction
                                      ? ColorManager.correctGreen
                                      : ColorManager.red,
                                  textColor: ColorManager.white,
                                ),
                                EmptyTextContainer(
                                  text: 'L',
                                  backgroundColor: correction
                                      ? ColorManager.correctGreen
                                      : ColorManager.red,
                                  textColor: ColorManager.white,
                                ),
                                EmptyTextContainer(
                                  text: 'E',
                                  backgroundColor: correction
                                      ? ColorManager.correctGreen
                                      : ColorManager.red,
                                  textColor: ColorManager.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: AppSize.s5.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorManager.newWidget),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p3.w,
                      vertical: AppPadding.p1.h,
                    ),
                    child: 
                    
                    
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(correction? 
                         LocaleKeys.correctAnswer:LocaleKeys.wrongAnswer,
                          style: getMediumDINNextStyle(
                              color:correction?ColorManager.correctGreen : ColorManager.red, fontSize: 23.sp),
                        ),
                        const SizedBox(
                          width: AppSize.s18,
                        ),
                        Container(
                            padding:  EdgeInsets.all(AppPadding.p1.w),
                            decoration: BoxDecoration(
                                color: correction?ColorManager.correctGreen : ColorManager.red,
                                shape: BoxShape.circle),
                            child: Icon(
                    correction?   Icons.done    :  Icons.close,
                              color: ColorManager.white,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s5.h,
                  ),
                  correction?
                     const   SizedBox(height: AppSize.s17,)  :
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorManager.newWidget),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p3.w,
                      vertical: AppPadding.p2.h,
                    ),
                    child: Column(
                      children: [
                        Text(
                       LocaleKeys.correctAnswer  ,
                          style: getMediumDINNextStyle(
                              color: ColorManager.correctGreen, fontSize: 22.sp),
                        ),
                        SizedBox(
                          height: AppSize.s2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            EmptyTextContainer(
                              text: 'T',
                              backgroundColor: ColorManager.correctGreen,
                              textColor: ColorManager.white,
                            ),
                            EmptyTextContainer(
                              text: 'A',
                              backgroundColor: ColorManager.correctGreen,
                              textColor: ColorManager.white,
                            ),
                            EmptyTextContainer(
                              text: 'B',
                              backgroundColor: ColorManager.correctGreen,
                              textColor: ColorManager.white,
                            ),
                            EmptyTextContainer(
                              text: 'L',
                              backgroundColor: ColorManager.correctGreen,
                              textColor: ColorManager.white,
                            ),
                            EmptyTextContainer(
                              text: 'L',
                              backgroundColor: ColorManager.correctGreen,
                              textColor: ColorManager.white,
                            ),
                            EmptyTextContainer(
                              text: 'L',
                              backgroundColor: ColorManager.correctGreen,
                              textColor: ColorManager.white,
                            ),
                            EmptyTextContainer(
                              text: 'E',
                              backgroundColor: ColorManager.correctGreen,
                              textColor: ColorManager.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s5.h,
                  ),
                  CustomButtonWidget(
                    onTap: () {},
                    shadowColor: ColorManager.terracota,
                    borderColor: ColorManager.terracota,
                    backGroundColor: ColorManager.terracota,
                    title: LocaleKeys.next.tr(),
                    textColor: ColorManager.white,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
    controllerRobot.dispose();
  }
}
