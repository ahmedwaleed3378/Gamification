import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class ChoosePlanResultView extends StatefulWidget {
  const ChoosePlanResultView({Key? key}) : super(key: key);

  @override
  State<ChoosePlanResultView> createState() => _ChoosePlanResultViewState();
}

class _ChoosePlanResultViewState extends State<ChoosePlanResultView> {
 Artboard? riveArtboard;
 late RiveAnimationController controllerCelebrateRobot;
  @override
  void initState() {
    super.initState();
    var controllerCelebrateRobot = SimpleAnimation('Timeline 1');
    rootBundle.load(RiveAssets.celebrateRobot).then((data) {
      final file = RiveFile.import(data);
      final art = file.mainArtboard;
      art.addController(controllerCelebrateRobot);
      setState(() =>riveArtboard = art);
    });
  }
@override
  void dispose() {
    super.dispose();
    controllerCelebrateRobot.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: AppSize.s15.h),
            child: SizedBox(
              width:double.infinity,
              height: double.infinity,
              child:SvgPicture.asset(ImageAssets.backgroundCube,fit: BoxFit.fill,)
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p5.w,
                    vertical: AppPadding.p2.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height:  AppSize.s20.h,),
                      Center(
                        child: SizedBox(
                          height:AppSize.s30.h,
                          width: AppSize.s30.h,
                          child: riveArtboard != null
                              ? Rive(
                            artboard: riveArtboard!,
                          )
                              : SizedBox.shrink(
                            child: Container(color: ColorManager.red),
                          ),
                        ),
                      ),
                      SizedBox(height:  AppSize.s8.h,),
                      Text(
                        LocaleKeys.congratulations.tr(),
                        style: getMediumDINNextStyle(
                          color: ColorManager.lightBlue,
                          fontSize: AppSize.s23.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppSize.s3.h,),
                      Text(
                        LocaleKeys.startAmazingAdventure.tr(),
                        style: getRegularDINNextStyle(
                          color: ColorManager.white,
                          fontSize: AppSize.s19.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppSize.s5.h,),
                      CustomButtonWidget(
                        onTap: () {
                          },
                        shadowColor: ColorManager.terracota,
                        borderColor: ColorManager.terracota,
                        backGroundColor: ColorManager.terracota,
                        title: LocaleKeys.okGreat.tr(),
                        textColor: ColorManager.white,
                        fontSize: AppSize.s21.sp,

                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

