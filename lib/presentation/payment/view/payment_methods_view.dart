import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/app/functions.dart';
import 'package:gamification/domain/model/payment/all_payment_methods_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/payment/view/choose_plan_view.dart';
import 'package:gamification/presentation/payment/viewmodel/payment_methods_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/payment_widget.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../resources/routes_manager.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final PaymentMethodsViewModel _viewModel =
      instance<PaymentMethodsViewModel>();

  int selectedIndex = -1;
  PaymentMethodsModel? selectedPaymentMethod;

  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.start();
              }) ??
              _getContentWidget();
        });
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      appBar: AppBar(
        elevation: 0.0,
     toolbarHeight: AppSize.s8.h,

        leading: Padding(
          padding:  EdgeInsets.only(top: AppPadding.p4.h,right: AppSize.s3.w),
          child: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                Routes.homeRoute,
              );
            },
            icon: Icon(
              Icons.close,
              size: AppSize.s2_5.h,
              color: ColorManager.terracota,
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: AppSize.s4.h),
          child: Text(
            LocaleKeys.payment.tr(),
            style: getMediumDINNextStyle(
                color: ColorManager.terracota, fontSize: AppSize.s22.sp),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.s2.h),
            child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SvgPicture.asset(
                  ImageAssets.backgroundCube,
                  fit: BoxFit.fill,
                )),
          ),
          RefreshWidget(
              widgetChild: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p5.w,
                    vertical: AppPadding.p2.h,
                  ).copyWith(top: AppSize.s6.h),
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.chooseThePaymentMethod.tr(),
                        style: getRegularDINNextStyle(
                            color: ColorManager.blue, fontSize: AppSize.s20.sp),
                      ),
                      SizedBox(
                        height: AppSize.s2.h,
                      ),
                      StreamBuilder<AllPaymentMethodsModel>(
                        stream: _viewModel.outPutAllPaymentMethods,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.paymentMethods.isNotEmpty) {
                              return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                      color: ColorManager.charcoalGrey,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final paymentId = snapshot
                                            .data!.paymentMethods[index].id;
                                        // filter list show only Visa & Vodafone cash & Fawry
                                        if (paymentId == 1 ||
                                            paymentId == 4 ||
                                            paymentId == 9) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedIndex = index;
                                                selectedPaymentMethod = snapshot
                                                    .data!
                                                    .paymentMethods[index];
                                              });
                                            },
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: selectedIndex == index
                                                ? ColorFiltered(
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            ColorManager
                                                                .green
                                                                .withOpacity(
                                                                    0.1),
                                                            BlendMode.srcATop),
                                                    child: CustomPaymentWidget(
                                                        paymentImage: paymentId ==
                                                                1
                                                            ? ImageAssets.fawry
                                                            : paymentId == 9
                                                                ? ImageAssets
                                                                    .vodafone
                                                                : ImageAssets
                                                                    .visa,
                                                        paymentMethodText:
                                                            isCurrentLanguageEn(
                                                                    context)
                                                                ? snapshot
                                                                    .data!
                                                                    .paymentMethods[
                                                                        index]
                                                                    .enName
                                                                : snapshot
                                                                    .data!
                                                                    .paymentMethods[
                                                                        index]
                                                                    .arName,
                                                        borderColor:
                                                            selectedIndex ==
                                                                    index
                                                                ? ColorManager
                                                                    .green
                                                                : ColorManager
                                                                    .secondaryText),
                                                  )
                                                : CustomPaymentWidget(
                                                    paymentImage: paymentId == 1
                                                        ? ImageAssets.fawry
                                                        : paymentId == 9
                                                            ? ImageAssets
                                                                .vodafone
                                                            : ImageAssets.visa,
                                                    paymentMethodText:
                                                        isCurrentLanguageEn(
                                                                context)
                                                            ? snapshot
                                                                .data!
                                                                .paymentMethods[
                                                                    index]
                                                                .enName
                                                            : snapshot
                                                                .data!
                                                                .paymentMethods[
                                                                    index]
                                                                .arName,
                                                    borderColor:
                                                        selectedIndex == index
                                                            ? ColorManager.green
                                                            : ColorManager
                                                                .secondaryText),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      },
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: AppSize.s05.h,
                                          ),
                                      itemCount: snapshot
                                          .data!.paymentMethods.length));
                            } else {
                              return Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: AppSize.s2.h,
                                    ),
                                    SvgPicture.asset(ImageAssets.robot),
                                    SizedBox(
                                      height: AppSize.s2.h,
                                    ),
                                    Text(
                                      LocaleKeys.emptyList.tr(),
                                      style: getMediumDINNextStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s20.sp),
                                    )
                                  ],
                                ),
                              );
                            }
                          } else {
                            return StateRenderer(
                              stateRendererType:
                                  StateRendererType.fullScreenLoadingState,
                              retryActionFunction: () {
                                _viewModel.start();
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              onRefresh: () async {
                _viewModel.start();
              })
        ],
      ),
      bottomNavigationBar: Container(
        color: ColorManager.dark,
        padding: EdgeInsets.only(
            left: AppSize.s10.w,
            right: AppSize.s10.w,
            bottom: AppSize.s5.h,
            top: AppSize.s1.h),
        child: CustomButtonWidget(
          onTap: () {
            if (selectedIndex != -1 && selectedPaymentMethod != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChoosePlanView(
                        paymentMethodsModel: selectedPaymentMethod!),
                  ));
            }
          },
          height: AppSize.s7.h,
          shadowColor: selectedIndex != -1
              ? ColorManager.terracota
              : ColorManager.white30,
          borderColor: selectedIndex != -1
              ? ColorManager.terracota
              : ColorManager.white30,
          backGroundColor: selectedIndex != -1
              ? ColorManager.terracota
              : ColorManager.white30,
          title: LocaleKeys.submit.tr(),
          style: getMediumDINNextStyle(
            color: selectedIndex != -1 ? ColorManager.white : ColorManager.dark,
            fontSize: AppSize.s21.sp,
          ),
          textColor: ColorManager.dark,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }
}
