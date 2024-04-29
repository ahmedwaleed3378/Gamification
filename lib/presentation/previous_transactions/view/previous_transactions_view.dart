import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/domain/model/gift_gallery/gift_by_user_id_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/home/viewmodel/home_viewmodel.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';
import 'package:intl/intl.dart' as intl;
import 'package:responsive_sizer/responsive_sizer.dart';

class PreviousTransactionsView extends StatefulWidget {
  const PreviousTransactionsView({Key? key}) : super(key: key);

  @override
  State<PreviousTransactionsView> createState() =>
      _PreviousTransactionsViewState();
}

class _PreviousTransactionsViewState extends State<PreviousTransactionsView> {
  final HomeViewModel _homeViewModel = instance<HomeViewModel>();

  @override
  void initState() {
    _homeViewModel.getGiftByUserId();
    super.initState();
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
                _homeViewModel.getGiftByUserId();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p5.w,
            vertical: AppPadding.p3.h,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: AppSize.s1.w,),
                  Column(
                    children: [
                   SizedBox(height: AppSize.s1.h,),
                      InkWell(
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: AppSize.s3.h,
                          color: ColorManager.terracota,
                        ),
                        onTap: () => Navigator.of(context).pop(),
                      ),    
                    ],
                  ),
              
                   Expanded(
                     child: Column(
                       children: [
                        SizedBox(height: AppSize.s2.h,),
                         Text(
                            LocaleKeys.previousTransactions.tr(),
                            textAlign: TextAlign.center,
                            style: getMediumDINNextStyle(
                              color: ColorManager.terracota,
                              fontSize: AppSize.s20.sp,
                            ),
                          ),
                       ],
                     ),
                   ),
                 
                ],
              ),
              SizedBox(height: AppSize.s4.h),
              RefreshWidget(
                onRefresh: () async {
                  await _homeViewModel.getGiftByUserId();
                },
                widgetChild: StreamBuilder<List<GiftByUserIdModel>>(
                  stream: _homeViewModel.outputUserGiftsById,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if(snapshot.data!.isNotEmpty){
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: ColorManager.offWhite.withOpacity(AppSize.s015),
                              elevation: AppSize.s5,
                              shadowColor: ColorManager.dark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppSize.s20),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: AppSize.s1,
                                        color: ColorManager.white,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        AppSize.s20,
                                      ),
                                    ),
                                    width: AppSize.s27.w,
                                    height: AppSize.s10.h,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        AppSize.s20,
                                      ),
                                      child: Image.network(
                                          snapshot.data![index].giftPicture,
                                          fit: BoxFit.fill,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                              ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(
                                                  AppSize.s20,
                                                ),
                                                child: Image.asset(
                                                  ImageAssets.errorImage,
                                                  fit: BoxFit.fill,
                                                ),
                                              )),
                                    ),
                                  ),
                                  SizedBox(width: AppSize.s4.w),
                                  SvgPicture.asset(ImageAssets.gemBlueIcon),
                                  Text(
                                    snapshot.data![index].giftPoints
                                        .toStringAsFixed(2),
                                    style: getMediumMPLUSRounded1CStyle(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s14.sp,
                                    ),
                                  ),
                                  SizedBox(width: AppSize.s6.w),
                                  const Image(
                                    image: AssetImage(ImageAssets.refreshIcon),
                                  ),
                                  SizedBox(width: AppSize.s2.w),
                                  Text(
                                    intl.Intl.defaultLocale.toString() == 'en'
                                        ? snapshot.data![index].giftEnName
                                        : snapshot.data![index].giftName,
                                    style: getMediumMPLUSRounded1CStyle(
                                      color: ColorManager.lightBlue,
                                      fontSize: AppSize.s16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: AppSize.s2.h);
                          },
                        );
                      }else{
                        return Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: AppSize.s20.h,
                              ),
                              SvgPicture.asset(ImageAssets.robot , height: AppSize.s20.h),
                              SizedBox(
                                height: AppSize.s5.h,
                              ),
                              Text(
                                LocaleKeys.noGiftsFound.tr(),
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
                          _homeViewModel.getUserPoints();
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List previousTransactions = [
  {
    'icon': ImageAssets.giftImage01,
    'pointType': 'gem',
    'points': '600',
    'type': 'PS 4',
  },
  {
    'icon': ImageAssets.giftImage02,
    'pointType': 'flash',
    'points': '50',
    'type': 'Iphone 14',
  },
  {
    'icon': ImageAssets.giftImage03,
    'pointType': 'gem',
    'points': '600',
    'type': 'Bike',
  },
  {
    'icon': ImageAssets.giftImage04,
    'pointType': 'gem',
    'points': '600',
    'type': 'Bike',
  },
  {
    'icon': ImageAssets.giftImage05,
    'pointType': 'flash',
    'points': '50',
    'type': 'Iphone 14',
  },
];
