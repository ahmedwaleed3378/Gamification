import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AudioTextView extends StatefulWidget {
  const AudioTextView({Key? key}) : super(key: key);

  @override
  State<AudioTextView> createState() => _AudioTextViewState();
}

class _AudioTextViewState extends State<AudioTextView> {
  int selectedAnswer = -1;

  AudioPlayer? _player;
  bool audioPlayed = false;
  PlayerState? _playerState;

  Future<void> _play(String audioUrl) async {
    final player = _player = AudioPlayer();
    await player.play(UrlSource(audioUrl));

    player.onPlayerComplete.listen((event) {
      setState(() => audioPlayed = false);
    });
  }

  Future<void> _pause() async {
    await _player!.pause();
    setState(() => _playerState = PlayerState.paused);
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p4.w,
              vertical: AppPadding.p2.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.s5.w,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'English',
                            style: getSemiBoldSFProDisplayCStyle(
                              color: ColorManager.terracota,
                              fontSize: AppSize.s23.sp,
                            ),
                          ),
                          SizedBox(height: AppSize.s1.h),
                          Text(
                            'Unit 1 lesson 3',
                            style: getSemiBoldSFProDisplayCStyle(
                              color: ColorManager.greenishTeal,
                              fontSize: AppSize.s19.sp,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        ImageAssets.arabicSubject,
                      ),
                    ],
                  ),
                ),
                //ToDo: Adding stepper
                SizedBox(height: AppSize.s4.h),
                Text(
                  'What does audio say ? ',
                  style: getMediumDINNextStyle(
                    color: ColorManager.offWhite,
                    fontSize: AppSize.s22,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSize.s4.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p3.w,
                  ),
                  child: Container(
                    height: AppSize.s23.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppSize.s20,
                      ),
                      border: Border.all(
                        width: AppSize.s2,
                        color: ColorManager.darkSkyBlue,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InkWell(
                          onTap: () {
                            if (audioPlayed == true) {
                              setState(() => audioPlayed = false);
                              _pause();
                            } else {
                              setState(() => audioPlayed = true);
                              _play(
                                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3',
                              );
                            }
                          },
                          child: SvgPicture.asset(
                            audioPlayed
                                ? ImageAssets.pauseIcon
                                : ImageAssets.playIcon,
                            width: AppSize.s20.w,
                          ),
                        ),
                        SizedBox(height: AppSize.s3.h),
                        Text(
                          LocaleKeys.tapPlayAudio.tr(),
                          style: getMediumDINNextStyle(
                            color: ColorManager.darkSkyBlue,
                            fontSize: AppSize.s22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s4.h),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: textAnswers.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() => selectedAnswer = index);
                      },
                      child: Card(
                        color: selectedAnswer == index
                            ? ColorManager.darkSkyBlue
                            : ColorManager.white30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSize.s14,
                          ),
                        ),
                        child: Card(
                          margin: EdgeInsets.only(
                            top: AppPadding.p02.h,
                            bottom: AppPadding.p07.h,
                            right: AppPadding.p05.w,
                            left: AppPadding.p05.w,
                          ),
                          color: ColorManager.dark.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSize.s14,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: AppPadding.p2.h,
                            ),
                            child: Text(
                              textAnswers[index],
                              style: getRegularDINNextStyle(
                                color: ColorManager.white,
                                fontSize: AppSize.s21,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: AppSize.s2.h);
                  },
                ),
                SizedBox(height: AppSize.s4.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p6.w,
                  ),
                  child: CustomButtonWidget(
                    onTap: () {},
                    height: AppSize.s7.h,
                    shadowColor: selectedAnswer != -1
                        ? ColorManager.terracota
                        : ColorManager.white30,
                    borderColor: selectedAnswer != -1
                        ? ColorManager.terracota
                        : ColorManager.white30,
                    backGroundColor: selectedAnswer != -1
                        ? ColorManager.terracota
                        : ColorManager.white30,
                    title: LocaleKeys.check.tr(),
                    style: getMediumDINNextStyle(
                      color: selectedAnswer != -1
                          ? ColorManager.white
                          : ColorManager.dark,
                      fontSize: AppSize.s26,
                    ),
                    textColor: ColorManager.dark,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _player?.dispose();

    super.dispose();
  }
}

List textAnswers = [
  'Books are the windows of the house',
  'Books are windows of knowledge',
  'Books are windows of information',
  'Books is the window to the world'
];
