import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/home/components/gift_gallery/gift_gallery_view.dart';
import 'package:gamification/presentation/home/viewmodel/home_viewmodel.dart';
import 'package:gamification/presentation/progress/view/progress1.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/scoreboard/view/scoreboard_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../domain/model/subjects_of_year/student_subjects.dart';
import '../../common/state_rendrer/state_renderer.dart';
import '../../payment/view/payment_methods_view.dart';
import '../../resources/color_manager.dart';
import '../widgets/home_screen_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel = instance<HomeViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  int currentIndex = 0;
  bool seeAllchallenges = false;

  _bind() {
    _homeViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: StreamBuilder<FlowState>(
        stream: _homeViewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _homeViewModel.start();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Future loadList() async {
    if (currentIndex == 0) {
      _homeViewModel.start();
    }
  }

  _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: AppPadding.p2.h,
              right: AppPadding.p1.w,
              left: AppPadding.p1.w),
          child: IndexedStack(
            index: currentIndex,
            children: [
              StreamBuilder<StudentSubjectsModel>(
                  stream: _homeViewModel.outAllSUbjectsDataStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<String> subjectSnapShot = snapshot
                          .data!.subjectEducationalYears!
                          .map((e) => e!.subjectArName)
                          .toList();

                      List<int> subjectIDsSnapShot = snapshot
                          .data!.subjectEducationalYears!
                          .map((e) => e!.subjectId)
                          .toList();

                      return StreamBuilder<bool>(
                          stream: _homeViewModel.outputseeAllPressed,
                          builder: (context, seeAllSnapshot) {
                            return HomeScreenBody(
                                reloadFunction: loadList,
                                userImage: Constants.baseUrl +
                                    _appPreferences.getUserPicture(),
                                subjectImages: snapshot
                                    .data!.subjectEducationalYears!
                                    .map((e) => e!.subjectImage)
                                    .toList(),
                                viewModel: _homeViewModel,
                                subjectNames: (seeAllSnapshot.data ?? false)
                                    ? subjectSnapShot
                                    : subjectSnapShot.length > 6
                                        ? subjectSnapShot.sublist(0, 6)
                                        : subjectSnapShot,
                                subjectIds: subjectIDsSnapShot,
                                userGimNum: snapshot
                                    .data!.profileData!.availablePoints
                                    .toInt(),
                                userFlashNum: _appPreferences.getUserFlashNum(),
                                connected: true,
                                isOpen: snapshot.data!.isOpen,
                                recentSubjects: snapshot.data!.recentSubjects!,
                                onTapSubjects: snapshot.data!
                                            .subjectEducationalYears!.length >
                                        6
                                    ? () {
                                        _homeViewModel.seeAllPressing();
                                      }
                                    : null,
                                seeAllChallenges: seeAllchallenges,
                                onTapChallenges: () {
                                  setState(() =>
                                      seeAllchallenges = !seeAllchallenges);
                                },
                                totalStreak: _homeViewModel.totalStreak ??
                                    _appPreferences
                                        .getUserStreaks() // userStreaksnapshot

                                );
                          });
                    } else {
                      return StateRenderer(
                        stateRendererType:
                            StateRendererType.fullScreenLoadingState,
                        retryActionFunction: () {
                          _homeViewModel.start();
                        },
                      );
                    }
                  }),
              const ProgressAllSubjectsView(),
              const ScoreBoardView(),
              const GiftGalleryScreen(),
              const PaymentMethods(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: ColorManager.blackLight,
        padding: EdgeInsets.only(bottom: AppPadding.p1_5.h),
        child: FluidNavBar(
          onChange: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          // currentIndex: currentIndex,
          scaleFactor: 1,
          animationFactor: 0.4,
          style: FluidNavBarStyle(
              barBackgroundColor: ColorManager.blackLight,
              iconUnselectedForegroundColor: ColorManager.darkGrey,
              iconSelectedForegroundColor: ColorManager.orange),
          icons: [
            FluidNavBarIcon(svgPath: ImageAssets.homeIcon),
            FluidNavBarIcon(svgPath: ImageAssets.squaresIcon),
            FluidNavBarIcon(svgPath: ImageAssets.chartsIcon),
            FluidNavBarIcon(svgPath: ImageAssets.unFilledGift),
            FluidNavBarIcon(
              icon: Icons.credit_card,
            ),
          ],
        ),
      ),
    );
  }
}
