import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/language_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_selected_lang.dart';
import 'package:gamification/presentation/widget/custom_start_button.dart';
import 'package:gamification/presentation/widget/global_logo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

String selectedLang = 'ar';
String selectedVal = "ar";

class LanguageView extends StatefulWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerSplash;
  bool shownContent = false;

  @override
  void initState() {
    super.initState();
    controllerSplash = SimpleAnimation('splash sabet');
    rootBundle.load(RiveAssets.splashRocket).then((data) {
      final file = RiveFile.import(data);
      final art = file.mainArtboard;
      art.addController(controllerSplash);
      // riveArtboard = art;
      setState(() => riveArtboard = art);
    });
    Future.delayed(const Duration(milliseconds: 10))
        .then((value) => setState(() => shownContent = true));
  }

  @override
  void dispose() {
    controllerSplash.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: riveArtboard != null
                  ? Rive(
                      artboard: riveArtboard!,
                    )
                  : SizedBox.shrink(
                      child: Container(color: ColorManager.dark),
                    ),
            ),
            if (shownContent)
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.s9.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LogoText(
                      height: AppSize.s4.h,
                      width: AppSize.s14.w,
                    ),
                    SizedBox(height: AppSize.s2.h),
                    Text(
                      LocaleKeys.changeLanguage.tr(),
                      style: getRegularDINNextStyle(
                          color: ColorManager.lightBlue,
                          fontSize: AppSize.s21.sp),
                      textAlign: TextAlign.center,
                    ),
                    const RadioGroups(),
                    CustomStartButton(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.onboardingRoute);
                      },
                      color: selectedLang.isEmpty
                          ? ColorManager.steel
                          : ColorManager.terracota,
                      text: LocaleKeys.startNow.tr(),
                      textColor:
                          selectedLang.isEmpty ? null : ColorManager.white,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class RadioGroups extends StatefulWidget {
  const RadioGroups({super.key});

  @override
  State<RadioGroups> createState() => _RadioGroupsState();
}

class _RadioGroupsState extends State<RadioGroups> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final List<LanguageSetup> _languageSetupList = [];

  void setSelectedRadio(String? val) {
    setState(() {
      selectedVal = val!;
      selectedLang = val!;
    });
  }

  _bind() {
    _languageSetupList.add(LanguageSetup(LocaleKeys.arabic.tr(),
        ImageAssets.egyLogo, LanguageType.ARABIC.getValue()));
    _languageSetupList.add(LanguageSetup(LocaleKeys.english.tr(),
        ImageAssets.usaLogo, LanguageType.ENGLISH.getValue()));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: AppSize.s2.h,
          right: AppSize.s5.w,
          left: AppSize.s5.w,
          bottom: AppSize.s4.h),
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        itemCount: _languageSetupList.length,
        itemBuilder: (context, choiceIndex) {
          final selected = selectedVal == _languageSetupList[choiceIndex].type;
          final color =
              selected ? ColorManager.lightBlue : ColorManager.steel50;
          return CustomLanguageWidget(
              onTap: () async {
                setState(() {
                  selectedVal = choiceIndex == 0 ? 'ar' : 'en';
                });
                setSelectedRadio(selectedVal);
                String currentLang = await _appPreferences.getAppLanguage();
                _appPreferences.customChangeAppLanguage(
                    _languageSetupList[choiceIndex].type);
                Phoenix.rebirth(context);
                String lan = await _appPreferences.getAppLanguage();
                print('$lan ======');
              },
              backGroundColor: ColorManager.dark,
              borderColor: color,
              countryFlag: _languageSetupList[choiceIndex].image,
              countryName: _languageSetupList[choiceIndex].name,
              showColor: color);
        },
        separatorBuilder: (_, __) => const SizedBox(
          height: AppSize.s27,
        ),
      ),
    );
  }
}

class LanguageSetup {
  String name;
  String image;
  String type;

  LanguageSetup(this.name, this.image, this.type);
}
