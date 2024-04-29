import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gamification/app/app_prefs.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/presentation/register/view/register1.dart';
import 'package:gamification/presentation/register/view/register2.dart';
import 'package:gamification/presentation/register/view/register3.dart';
import 'package:gamification/presentation/register/view/register4.dart';
import 'package:gamification/presentation/register/view/register6.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../common/state_rendrer/state_renderer_impl.dart';

import '../../resources/routes_manager.dart';
import '../viewmodel/register_viewmodel.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}



class _RegisterPageViewState extends State<RegisterPageView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();

  late PageController _registerPageView;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();

  // final TextEditingController _parentNameController = TextEditingController();
  // final TextEditingController _parentNumberController = TextEditingController();

  final RegisterViewModel viewModel = instance<RegisterViewModel>();

  int currentPageIndex = 1;

  _bind() {
    viewModel.start();
  }

  @override
  void dispose() {
    _registerPageView.dispose();
    viewModel.dispose();
    viewModel.dispose();
    _passConfirmController.dispose();
    _passController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _firstNameController.dispose();
    _secondNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _bind();
    _registerPageView = PageController();
    viewModel.isUserRegisteredSuccessfullyStreamController.stream.listen(
      (isRegistered) {
        SchedulerBinding.instance.addPostFrameCallback(
          (_) {
            _appPreferences.setUserLoggedIn(true);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const RegisterView6(),
              ),
              (route) => false,
            );
          },
        );
      },
    );
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data
                  ?.getScreenWidget(context, _getContentWidget(context), () {
                //    viewModel.register();
              }) ??
              _getContentWidget(context);
        });
  }

  Widget _getContentWidget(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popAndPushNamed(context, Routes.goStartView);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.13,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p1.w,
                vertical: AppPadding.p3.h,
              ),
              child: Row(
                children: [
                  SizedBox(width: AppSize.s3.w),
                  Visibility(
                    visible: currentPageIndex != 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: ColorManager.terracota,
                      ),
                      onPressed: () {
                        if (currentPageIndex == 1) {
                        } else {
                          setState(() {
                            currentPageIndex -= 1;
                            _registerPageView.previousPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.bounceInOut,
                            );
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width:
                        currentPageIndex != 1 ? AppSize.s10.w : AppSize.s23.w,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: AppSize.s1.h,
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: AppMargin.m1.w),
                            width: AppSize.s10.w,
                            height: AppSize.s4.h,
                            decoration: BoxDecoration(
                              color: index < currentPageIndex
                                  ? ColorManager.terracota
                                  : ColorManager.terracota.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(AppSize.s14),
                              boxShadow: [
                                index + 1 == currentPageIndex
                                    ? BoxShadow(
                                        color: ColorManager.terracota,
                                        blurRadius: 30,
                                        spreadRadius: 0.5,
                                        blurStyle: BlurStyle.outer,
                                      )
                                    : const BoxShadow(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.s6.w),
                  Visibility(
                    visible: currentPageIndex != 4,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorManager.terracota,
                      ),
                      onPressed: () {
                        if (currentPageIndex == 4) {
                        } else {
                          setState(() {
                            currentPageIndex += 1;
                            _registerPageView.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.bounceInOut,
                            );
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(width: AppSize.s3.w),
                ],
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: PageView(
          controller: _registerPageView,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index + 1;
            });
          },
          children: [
            RegisterView1(
              viewModel: viewModel,
              pageController: _registerPageView,
              secondNameController: _secondNameController,
              nameController: _firstNameController,
            ),
            RegisterView2(
              viewModel: viewModel,
              pageController: _registerPageView,
              emailController: _emailController,
              phoneController: _phoneController,
            ),
            RegisterView3(
              viewModel: viewModel,
              pageController: _registerPageView,
              passController: _passController,
              passConfirmController: _passConfirmController,
            ),
            RegisterView4(
              viewModel: viewModel,
              pageController: _registerPageView,
            ),
            // RegisterView5(
            //   viewModel: viewModel,
            //   pageController: _registerPageView,
            //   parentNameController: _parentNameController,
            //   parentNumberController: _parentNumberController,
            // ),
          ],
        ),
      ),
    );
  }
}
