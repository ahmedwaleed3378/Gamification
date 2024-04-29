import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/onboarding/view/custom_line_paint.dart';
import 'package:gamification/presentation/onboarding/view/custom_oboard.dart';
import 'package:gamification/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/start/view/start_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController _pageController;
  late PageController _outerPageController;
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  Artboard? riveArtboard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerDown;
  late RiveAnimationController robotLanding;

  _bind() {
    _appPreferences.setOnBoardingViewed();
    _viewModel.start();
    _viewModel.lastUserOnBoardingViewed.stream.listen((lastOnBoardingViewed) {
      if (lastOnBoardingViewed) {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      }
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    _outerPageController = PageController();
    _bind();

    controllerIdle = SimpleAnimation('Onboarding');
    controllerDown = SimpleAnimation('landing + Open door');
    robotLanding = SimpleAnimation('robot landing');
    rootBundle.load('assets/rive/taslim.riv').then((data) {
      final file = RiveFile.import(data);
      final art = file.mainArtboard;
      art.addController(controllerIdle);
      riveArtboard = art;
    });
    super.initState();
  }

  addDownController(BuildContext context) async {
    final navigator = Navigator.of(context);

    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.addController(controllerDown);

    /// rocket landing
    Future.delayed(const Duration(seconds: 8)).then((value) {
      /// then robot go out and landing
      riveArtboard?.artboard.removeController(controllerDown);
      riveArtboard?.artboard.addController(robotLanding);

      Future.delayed(const Duration(seconds: 7)).then((value) {
        // Use the saved navigator reference here
        riveArtboard?.artboard.removeController(robotLanding);

        navigator.pushReplacement(
          MaterialPageRoute(builder: (context) => const GoStartView()),
        );
      });
    });

    debugPrint("downnnnn");
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _pageController.dispose();
    controllerIdle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputPageViewObject,
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container();
        } else {
          return _getContentWidget(snapshot.data);
        }
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    return Scaffold(
        backgroundColor: ColorManager.dark,
        body: Container(
          width: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: riveArtboard != null
                    ? Padding(
                      padding:  EdgeInsets.only(bottom: AppPadding.p6.h),
                      child: Rive(
                          artboard: riveArtboard!,
                        ),
                    )
                    : SizedBox.shrink(
                        child: Container(color: ColorManager.dark),
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  SizedBox(
                    height: 58.h,
                    width: double.infinity,
                    child: PageView.builder(
                        itemCount: 2,
                        controller: _outerPageController,
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        allowImplicitScrolling: false,
                        pageSnapping: false,
                        physics: const NeverScrollableScrollPhysics(),
                        padEnds: false,
                        itemBuilder: (context, outerIndex) {
                          if (outerIndex == 1) {
                            return Container();
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: AppPadding.p4.w,
                                    right: AppPadding.p2.w,),
                                  child: CustomPaint(
                                    painter: CustomLinePainter(),
                                    child: SizedBox(
                                      height: AppSize.s17.h,
                                    ),
                                  ),
                                ),

                                /// inner page view
                                SizedBox(
                                  height: AppSize.s41.h,
                                  width: double.infinity,
                                  child: PageView.builder(
                                    itemCount: sliderViewObject!.numOfSlides,
                                    controller: _pageController,
                                    scrollDirection: Axis.vertical,
                                    reverse: true,
                                    allowImplicitScrolling: false,
                                    pageSnapping: false,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padEnds: false,
                                    onPageChanged: (index) {
                                      _viewModel.onPageChanged(index);
                                    },
                                    itemBuilder: (context, index) {
                                      if (index == 3) {
                                        addDownController(context);
                                        return Container();
                                      } else {
                                        return CustomPaint(
                                            painter: OnBoardingPainter(),
                                            child: SizedBox(
                                                width: double.infinity,
                                                child: sliderWidget(
                                                    sliderViewObject)));
                                      }
                                    },
                                  ),
                                )
                              ],
                            );
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  sliderWidget(SliderViewObject sliderViewObject) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: AppSize.s3.h,
        ),
        Text(
          sliderViewObject.sliderObject.title.tr(),
          style: getMediumDINNextStyle(
            color: ColorManager.lightBlue,
            fontSize: AppSize.s21.sp,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: AppSize.s3.h,
        ),
        Text(
          sliderViewObject.sliderObject.subTitle.tr(),
          textAlign: TextAlign.center,
          style: getMediumDINNextStyle(
            color: ColorManager.white,
            fontSize: AppSize.s18.sp,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: AppSize.s9.w,
              right: AppSize.s9.w,
              bottom: AppSize.s10,
              top: AppSize.s10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.goStartView,
                  );
                },
                child: Text(
                  LocaleKeys.skip.tr(),
                  style: getRegularDINNextStyle(
                    color: ColorManager.lightBlue,
                    fontSize: AppSize.s19.sp,
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: sliderViewObject.numOfSlides - 1,
                effect: WormEffect(
                  activeDotColor: ColorManager.terracota,
                  dotColor: ColorManager.lightGrey,
                  radius: AppSize.s10,
                  dotHeight: AppSize.s3.w,
                  dotWidth: AppSize.s3.w,
                ),
              ),
              SizedBox(
                width: AppSize.s11.w,
                height: AppSize.s11.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        backgroundColor: ColorManager.terracota,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      if (sliderViewObject.currentIndex == 2) {
                        // Navigator.pushReplacementNamed(
                        //   context,
                        //   Routes.goStartView,
                        // );
                        _outerPageController.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeOut);

                        _pageController.animateToPage(
                          _viewModel.goNext(),
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeOut,
                        );
                      } else {
                        _pageController.animateToPage(
                          _viewModel.goNext(),
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    child: Center(
                        child: Icon(
                      Icons.arrow_forward_ios,
                      color: ColorManager.white,
                      size: AppSize.s4.w,
                    ))),
              ),
            ],
          ),
        ),
      ],
    );
  }

  customOnBoardingWidget() {}
}
