
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/payment/all_payment_methods_model.dart';
import 'package:gamification/domain/model/payment/plans_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/payment/view/cash_code_view.dart';
import 'package:gamification/presentation/payment/view/visa_view.dart';
import 'package:gamification/presentation/payment/viewmodel/payment_methods_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/custom_plan_item.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChoosePlanView extends StatefulWidget {
  const ChoosePlanView({Key? key, required this.paymentMethodsModel})
      : super(key: key);
  final PaymentMethodsModel paymentMethodsModel;

  @override
  State<ChoosePlanView> createState() => _ChoosePlanViewState();
}

class _ChoosePlanViewState extends State<ChoosePlanView> {
  final PaymentMethodsViewModel _viewModel =
      instance<PaymentMethodsViewModel>();
  int selectedIndex = -1;

  @override
  void initState() {
    _viewModel.getAllPaymentPlans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.getAllPaymentPlans();
                }) ??
                _getContentWidget();
          }),
    );
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      appBar: AppBar(
        toolbarHeight: AppSize.s10.h,

        elevation: 0.0,
        leading: Padding(
          padding:  EdgeInsets.only(top: AppSize.s2.h),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              size: AppSize.s3.h,
              color: ColorManager.terracota,
            ),
          ),
        ),
        title: Padding(
          padding:  EdgeInsets.only(top: AppSize.s2.h),
          child: Text(
            LocaleKeys.choosePlan.tr(),
            style: getRegularDINNextStyle(
                color: ColorManager.terracota, fontSize: AppSize.s22.sp),
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p5.w,
            vertical: AppPadding.p2.h,
          ),
          child: RefreshWidget(
            onRefresh: () async {
              _viewModel.getAllPaymentPlans();
            },
            widgetChild: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  StreamBuilder<PlansModel>(
                    stream: _viewModel.outPutAllPaymentPlans,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if(snapshot.data!.paymentPlans.isNotEmpty){
                          return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                  color: ColorManager.charcoalGrey,
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(12),
                                    child: selectedIndex == index
                                        ? ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                          ColorManager.green
                                              .withOpacity(0.1),
                                          BlendMode.srcATop),
                                      child: CustomPlanItem(
                                          duration: snapshot
                                              .data!
                                              .paymentPlans[index]
                                              .planName,
                                          price: snapshot
                                              .data!
                                              .paymentPlans[index]
                                              .price,
                                          borderColor:
                                          selectedIndex == index
                                              ? ColorManager.green
                                              : ColorManager
                                              .secondaryText),
                                    )
                                        : CustomPlanItem(
                                        duration: snapshot.data!
                                            .paymentPlans[index].planName,
                                        price: snapshot.data!
                                            .paymentPlans[index].price,
                                        borderColor: selectedIndex ==
                                            index
                                            ? ColorManager.green
                                            : ColorManager.secondaryText),
                                  ),
                                  separatorBuilder: (context, index) => SizedBox(
                                    height: 2.h,
                                  ),
                                  itemCount: snapshot.data!.paymentPlans.length));
                        }
                        else{
                        return   Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: AppSize.s20.h,
                              ),
                              SvgPicture.asset(ImageAssets.robot, height: AppSize.s20.h),
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
          )),
      bottomNavigationBar: Container(
        color: ColorManager.dark,
        padding: EdgeInsets.only(
            left: AppSize.s10.w,
            right: AppSize.s10.w,
            bottom: AppSize.s5.h,
            top: AppSize.s1.h),
        child: CustomButtonWidget(
          onTap: () {
            if (widget.paymentMethodsModel.isFawry) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CashCodeView(
                            image: ImageAssets.fawry,
                        id: widget.paymentMethodsModel.id,
                        description:'${LocaleKeys.codeRecievedOnNumber.tr()} 0111******2',
                        subDescrition: LocaleKeys.goToNearPayment.tr(),
                          )));
            }
            if (widget.paymentMethodsModel.isVisa) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VisaView(id: widget.paymentMethodsModel.id),
                  ));
            }
            if(widget.paymentMethodsModel.isVFCash){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CashCodeView(
                        image: ImageAssets.vodafone,
                        description: LocaleKeys.vdCashDesc.tr(),
                        id: widget.paymentMethodsModel.id,
                      )));
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
}
