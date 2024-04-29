import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rive/rive.dart';

import '../../../domain/model/check_balance/check_balance.dart';
import '../../common/state_rendrer/state_renderer.dart';
import '../../common/state_rendrer/state_renderer_impl.dart';
import '../view_model/subscription_viewmodel.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({Key? key}) : super(key: key);

  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  Artboard? riveArtBoard;
  late RiveAnimationController? controllerRobot;
  final CheckBalanceViewModel _viewModel = instance<CheckBalanceViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    var controllerRobot = SimpleAnimation('robot welcome user');
    rootBundle.load(RiveAssets.taslimaRobot2).then(
      (data) {
        try {
          final file = RiveFile.import(data);
          final art = file.mainArtboard;

          art.addController(controllerRobot);
          setState(() => riveArtBoard = art);
        } catch (e) {
          debugPrint(e.toString());
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controllerRobot!.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshWidget(
        onRefresh: () async {},
        widgetChild: Scaffold(
          backgroundColor: ColorManager.dark,
          body:
          
          StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data
                  ?.getScreenWidget(context, _getContentWidget(), () {
                //    _viewModel.start();
              }) ??
              _getContentWidget();
        }),
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: StreamBuilder<CheckBalanceModel>(
            stream: _viewModel.outCheckBalanceDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if(snapshot.data!.userBalanceList.isNotEmpty){
                  BalanceModel? balanceModel =
                  snapshot.data!.userBalanceList.firstWhere((element) {
                    return element!.isCurrent;
                  });
                  return Stack(
                    children: [
                      riveArtBoard != null
                          ? Container(
                        transform: Matrix4.translationValues(
                          AppSize.s0,
                          -AppSize.s25.h,
                          AppSize.s0,
                        ),
                        height: 96.h,
                        width: AppSize.s100.w,
                        child: Rive(
                          artboard: riveArtBoard!,
                          // fit: BoxFit.contain,
                        ),
                      )
                          : SvgPicture.asset(
                        ImageAssets.robot,
                        height: AppSize.s20.h,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p5.w,
                            //   vertical: AppPadding.p2.h,
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: AppSize.s3.h),
                              Text(
                                LocaleKeys.subscription.tr(),
                                textAlign: TextAlign.center,
                                style: getMediumDINNextStyle(
                                  color: ColorManager.terracota,
                                  fontSize: AppSize.s23.sp,
                                ),
                              ),
                              SizedBox(height: AppSize.s25.h),
                              Card(
                                color: ColorManager.dark,
                                elevation: AppSize.s5,
                                shadowColor: ColorManager.dark,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppSize.s10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p5.w,
                                    vertical: AppPadding.p2.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        LocaleKeys.month.tr(),
                                        style: getSemiBoldInterStyle(
                                          color: ColorManager.lightBlue,
                                          fontSize: AppSize.s19.sp,
                                        ),
                                      ),
                                      Text(
                                        balanceModel?.paymentMonth ??
                                            snapshot.data!.userBalanceList[0]!
                                                .paymentMonth,
                                        style: getRegularInterStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s17.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: AppSize.s5.h),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p5.w,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LocaleKeys.amount.tr(),
                                          style: getSemiBoldInterStyle(
                                            color: ColorManager.lightBlue,
                                            fontSize: AppSize.s19.sp,
                                          ),
                                        ),
                                        Text(
                                          balanceModel?.amount
                                              .toStringAsPrecision(4) ??
                                              snapshot
                                                  .data!.userBalanceList[0]!.amount
                                                  .toStringAsPrecision(4),
                                          style: getRegularInterStyle(
                                            color: ColorManager.white,
                                            fontSize: AppSize.s17.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: AppSize.s5.h),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LocaleKeys.begins.tr(),
                                          style: getSemiBoldInterStyle(
                                            color: ColorManager.lightBlue,
                                            fontSize: AppSize.s19.sp,
                                          ),
                                        ),
                                        Text(
                                          balanceModel?.begins ??
                                              snapshot
                                                  .data!.userBalanceList[0]!.begins
                                          //  '28 June, 2023'
                                          ,
                                          style: getRegularInterStyle(
                                            color: ColorManager.white,
                                            fontSize: AppSize.s17.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: AppSize.s5.h),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LocaleKeys.ends.tr(),
                                          style: getSemiBoldInterStyle(
                                            color: ColorManager.lightBlue,
                                            fontSize: AppSize.s19.sp,
                                          ),
                                        ),
                                        Text(
                                          balanceModel?.ends ??
                                              snapshot
                                                  .data!.userBalanceList[0]!.ends
                                          // '28 July, 2023'
                                          ,
                                          style: getRegularInterStyle(
                                            color: ColorManager.white,
                                            fontSize: AppSize.s17.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: AppSize.s5.h),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          LocaleKeys.type.tr(),
                                          style: getSemiBoldInterStyle(
                                            color: ColorManager.lightBlue,
                                            fontSize: AppSize.s19.sp,
                                          ),
                                        ),
                                        Text(
                                          balanceModel?.paymentType ??
                                              snapshot.data!.userBalanceList[0]!
                                                  .paymentType
                                          // 'Standard'
                                          ,
                                          style: getRegularInterStyle(
                                            color: ColorManager.white,
                                            fontSize: AppSize.s17.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: AppSize.s5.h),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.steel,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppSize.s16,
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p4.w,
                                    vertical: AppPadding.p1_5.h,
                                  ),
                                  child: Text(
                                    LocaleKeys.renew.tr(),
                                    style: getMediumDINNextStyle(
                                      color: ColorManager.dark,
                                      fontSize: AppSize.s20.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: AppSize.s8.h),
                            ],
                          )),
                    ],
                  );
                }else{
               return Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(height: AppSize.s25.h),
                   SvgPicture.asset(ImageAssets.robot),
                   SizedBox(height: AppSize.s5.h),
                   Text(
                       LocaleKeys.emptyList.tr(),
                     style: getMediumDINNextStyle(
                       color: ColorManager.white,
                       fontSize: AppSize.s20.sp,
                     ),
                   ),
                   SizedBox(height: AppSize.s5.h),
                   Padding(
                     padding: EdgeInsets.symmetric(
                       horizontal: AppPadding.p6.h,
                     ),
                     child: CustomButtonWidget(
                       onTap: () {
                         Navigator.pop(context);
                       },
                       height: AppSize.s7.h,
                       shadowColor: ColorManager.terracota,
                       borderColor: ColorManager.terracota,
                       backGroundColor: ColorManager.terracota,
                       title: LocaleKeys.returnT.tr(),
                       style: getMediumDINNextStyle(
                         color: ColorManager.white,
                         fontSize: AppSize.s26,
                       ),
                       textColor: ColorManager.dark,
                     ),
                   ),
                   SizedBox(height: AppSize.s5.h),
                 ],
               );
                }
              } else {
                return StateRenderer(
                  stateRendererType: StateRendererType.fullScreenLoadingState,
                  retryActionFunction: () {
                    _viewModel.start();
                  },
                );
              }
            }),
      ),
    );
  }
}
