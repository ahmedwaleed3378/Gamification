import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/global_logo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

class GoStartView extends StatefulWidget {
  const GoStartView({Key? key}) : super(key: key);

  @override
  State<GoStartView> createState() => _GoStartViewState();
}

class _GoStartViewState extends State<GoStartView> {
  Artboard? riveArtboard;

  @override
  void initState() {
    super.initState();
    var controllerRobot = SimpleAnimation('robot welcome user');
    rootBundle.load(RiveAssets.taslimaRobot2).then((data) {
      try {
        final file = RiveFile.import(data);
        final art = file.mainArtboard;
        art.addController(controllerRobot);
        // riveArtboard = art;
        setState(() => riveArtboard = art);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: riveArtboard != null
                ? Rive(
                    artboard: riveArtboard!,
                  )
                : SizedBox.shrink(
                    child: Container(color: ColorManager.dark),
                  ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p035.dp)
                  .copyWith(bottom: AppSize.s5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: AppSize.s4.h,
                  ),
                  LogoText(
                    height:AppSize.s9.h ,
                    width: AppSize.s70.w ,
                  ),

                  Text(
                    LocaleKeys.letsLearnWithGamification.tr(),
                    style: getRegularDINNextStyle(
                        color: ColorManager.white, fontSize: AppSize.s21.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: AppSize.s7.h,
                  ),
                  CustomButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.register);
                    },
                    shadowColor: ColorManager.terracota,
                    borderColor: ColorManager.terracota,
                    backGroundColor: ColorManager.terracota,
                    title: LocaleKeys.getStarted.tr(),
                    textColor: ColorManager.white,
                  ),
                  SizedBox(
                    height: AppSize.s2.h,
                  ),
                  CustomButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    shadowColor: ColorManager.steel50,
                    borderColor: ColorManager.steel,
                    backGroundColor: ColorManager.dark,
                    title: LocaleKeys.alreadyHaveAccount.tr(),
                    textColor: ColorManager.terracota,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
