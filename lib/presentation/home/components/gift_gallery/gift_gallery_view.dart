import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamification/app/constants.dart';
import 'package:gamification/app/di.dart';
import 'package:gamification/app/functions.dart';
import 'package:gamification/domain/model/gift_gallery/all_gifts_model.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer.dart';
import 'package:gamification/presentation/common/state_rendrer/state_renderer_impl.dart';
import 'package:gamification/presentation/home/viewmodel/home_viewmodel.dart';
import 'package:gamification/presentation/previous_transactions/view/previous_transactions_view.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:gamification/presentation/widget/custom_home_header.dart';
import 'package:gamification/presentation/widget/refresh_indicator_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GiftGalleryScreen extends StatefulWidget {
  const GiftGalleryScreen({super.key});

  @override
  State<GiftGalleryScreen> createState() => _GiftGalleryScreenState();
}

bool buyGiftSuccess = false;

class _GiftGalleryScreenState extends State<GiftGalleryScreen> {
  final HomeViewModel _homeViewModel = instance<HomeViewModel>();

  @override
  void initState() {
    _homeViewModel.getAllData();
    _homeViewModel.getAllGifts();
    super.initState();
  }

  int selectedItem = -1;
  GiftModel? selectedGift;

  Future loadList() async {
    _homeViewModel.getAllGifts();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: loadList,
      widgetChild: Scaffold(
        backgroundColor: ColorManager.dark,
        body: StreamBuilder<FlowState>(
          stream: _homeViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _homeViewModel.getAllGifts();
                }) ??
                _getContentWidget();
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.s5.w, vertical: AppSize.s3.h),
          child: CustomButtonWidget(
            onTap: selectedItem != -1
                ? () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialogBox(
                          buyGiftSuccess: buyGiftSuccess,
                          image: previousTransactions[selectedItem]['icon'],
                          pointType: previousTransactions[selectedItem]
                              ['pointType'],
                          points: selectedGift!.giftPoints.toStringAsFixed(1),
                          title: isCurrentLanguageEn(context)
                              ? selectedGift!.giftEnName
                              : selectedGift!.giftArName,
                          assignGift: () async {
                            // dismiss dialog
                         
                            await _homeViewModel.assignGiftToUser(
                                selectedGift!.giftId,
                                selectedGift!.giftPoints,
                                context)
                                ;
                            

                            /// refresh user gems after assign gift
                            setState(() {});   
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  }
                : null,
            shadowColor: selectedItem != -1
                ? ColorManager.terracota
                : ColorManager.steel,
            borderColor: selectedItem != -1
                ? ColorManager.terracota
                : ColorManager.steel,
            backGroundColor: selectedItem != -1
                ? ColorManager.terracota
                : ColorManager.steel,
            title: LocaleKeys.buy.tr(),
            textColor: ColorManager.dark,
            style: getMediumDINNextStyle(
              color:
                  selectedItem != -1 ? ColorManager.white : ColorManager.dark,
              fontSize: AppSize.s21.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p5.w,
        ),
        child: Column(
          children: [
            StreamBuilder<AllGiftsModel>(
              stream: _homeViewModel.outputAllGifts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomHomeHeaderWidget(
                    userFlashNum: snapshot.data!.profileData.loginCounter,
                    userGimNum:
                        snapshot.data!.profileData.availablePoints.toInt(),
                    userImage: snapshot.data!.profileData.userProfilePhoto,
                  );
                } else {
                  return Container();
                  // CustomHomeHeaderWidget(
                  //   userFlashNum: _homeViewModel.userGimNum,
                  //   userGimNum: _homeViewModel.userFlashNum,
                  //   userImage: _homeViewModel.userImage,
                  // );
                }
              },
            ),
            SizedBox(height: AppSize.s3.h),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.terracota.withOpacity(AppSize.s02),
                    spreadRadius: AppSize.s9,
                    blurRadius: AppSize.s9,
                    offset: const Offset(AppSize.s3, AppSize.s3M),
                  ),
                ],
              ),
              child: CustomPaint(
                size: Size(AppSize.s100.w, AppSize.s07.h),
                painter: CurvePainter(),
              ),
            ),
            SizedBox(height: AppSize.s3.h),
            Row(
              children: [
                Image(
                  image: const AssetImage(ImageAssets.giftGalleryIcon),
                  width: AppSize.s10.w,
                ),
                SizedBox(width: AppSize.s3.w),
                Text(
                  LocaleKeys.giftGallery.tr(),
                  style: getMediumDINNextStyle(
                    color: ColorManager.lightBlue,
                    fontSize: AppSize.s21.sp,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushDynamicScreen(
                      context,
                      screen: MaterialPageRoute(
                        builder: (context) => const PreviousTransactionsView(),
                      ),
                      withNavBar: true,
                    );
                  },
                  child: SvgPicture.asset(ImageAssets.clockIcon , width: AppSize.s2_5.h,height:  AppSize.s2_5.h,),
                ),
                SizedBox(width: AppSize.s2.w),
              ],
            ),
            SizedBox(height: AppSize.s4.h),
            StreamBuilder(
              stream: _homeViewModel.outputAllGifts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      Visibility(
                        visible: buyGiftSuccess == false ? true : false,
                        child: Column(
                          children: [
                            if (snapshot.data!.allGifts.isNotEmpty)
                              AnimationLimiter(
                                child: GridView.count(
                                  padding:
                                      EdgeInsets.only(top: AppPadding.p1.h),
                                  shrinkWrap: true,
                                  primary: Platform.isIOS ? false : true,
                                  physics: const BouncingScrollPhysics(),
                                  childAspectRatio: 1.0 / 1.7,
                                  crossAxisCount: AppSize.s3.toInt(),
                                  mainAxisSpacing: AppSize.s22,
                                  crossAxisSpacing: AppSize.s16,
                                  children: List.generate(
                                    snapshot.data!.allGifts.length,
                                    (int index) {
                                      return AnimationConfiguration
                                          .staggeredGrid(
                                        columnCount: AppSize.s3.toInt(),
                                        position: index,
                                        duration: Duration(
                                          milliseconds: AppSize.s500.toInt(),
                                        ),
                                        child: ScaleAnimation(
                                          scale: AppSize.s05,
                                          child: FadeInAnimation(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (selectedItem == -1) {
                                                    selectedItem = index;
                                                    selectedGift = snapshot
                                                        .data!.allGifts[index];
                                                  } else {
                                                    selectedItem = -1;
                                                    selectedGift = null;
                                                  }
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            selectedItem ==
                                                                    index
                                                                ? BoxShadow(
                                                                    color: ColorManager
                                                                        .terracota
                                                                        .withOpacity(
                                                                            AppSize.s002),
                                                                    spreadRadius:
                                                                        AppSize
                                                                            .s7,
                                                                    blurRadius:
                                                                        AppSize
                                                                            .s9,
                                                                    offset: const Offset(
                                                                        AppSize
                                                                            .s3,
                                                                        AppSize
                                                                            .s3M),
                                                                  )
                                                                : const BoxShadow(),
                                                          ],
                                                          border: Border.all(
                                                            width:
                                                                selectedItem ==
                                                                        index
                                                                    ? AppSize.s3
                                                                    : AppSize
                                                                        .s1,
                                                            color: selectedItem ==
                                                                    index
                                                                ? ColorManager
                                                                    .terracota
                                                                : ColorManager
                                                                    .white,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            AppSize.s20,
                                                          ),
                                                        ),
                                                        width: AppSize.s27.w,
                                                        height: AppSize.s14.h,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            AppSize.s20,
                                                          ),
                                                          child: Image.network(
                                                            snapshot
                                                                .data!
                                                                .allGifts[index]
                                                                .giftPicture,
                                                            fit: BoxFit.fill,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                AppSize.s20,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                ImageAssets
                                                                    .errorImage,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: AppPadding
                                                                .p12.h,
                                                          ),
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical:
                                                                  AppPadding
                                                                      .p03.h,
                                                              horizontal:
                                                                  AppPadding
                                                                      .p2.w,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              boxShadow: [
                                                                selectedItem ==
                                                                        index
                                                                    ? BoxShadow(
                                                                        color: ColorManager
                                                                            .terracota
                                                                            .withOpacity(AppSize.s02),
                                                                        spreadRadius:
                                                                            AppSize.s7,
                                                                        blurRadius:
                                                                            AppSize.s9,
                                                                        offset: const Offset(
                                                                            AppSize.s3,
                                                                            AppSize.s3M),
                                                                      )
                                                                    : const BoxShadow(),
                                                              ],
                                                              border: Border.all(
                                                                  width: selectedItem ==
                                                                          index
                                                                      ? AppSize
                                                                          .s3
                                                                      : AppSize
                                                                          .s1,
                                                                  color: selectedItem ==
                                                                          index
                                                                      ? ColorManager
                                                                          .terracota
                                                                      : ColorManager
                                                                          .white),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                AppSize.s10,
                                                              ),
                                                              color:
                                                                  ColorManager
                                                                      .dark,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                SvgPicture
                                                                    .asset(
                                                                  previousTransactions[index]
                                                                              [
                                                                              'pointType'] ==
                                                                          'gem'
                                                                      ? ImageAssets
                                                                          .gemBlueIcon
                                                                      : ImageAssets
                                                                          .flashPurpleIcon,
                                                                  width: AppSize
                                                                      .s6.w,
                                                                ),
                                                                Text(
                                                                  snapshot
                                                                      .data!
                                                                      .allGifts[
                                                                          index]
                                                                      .giftPoints
                                                                      .toStringAsFixed(
                                                                          1),
                                                                  style:
                                                                      getMediumMPLUSRounded1CStyle(
                                                                    color: ColorManager
                                                                        .white,
                                                                    fontSize:
                                                                        AppSize
                                                                            .s14
                                                                            .sp,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                      height: AppSize.s1.h),
                                                  Text(
                                                    isCurrentLanguageEn(context)
                                                        ? snapshot
                                                            .data!
                                                            .allGifts[index]
                                                            .giftEnName
                                                        : snapshot
                                                            .data!
                                                            .allGifts[index]
                                                            .giftArName,
                                                    style:
                                                        getMediumMPLUSRounded1CStyle(
                                                      color: previousTransactions[
                                                                      index][
                                                                  'pointType'] ==
                                                              'gem'
                                                          ? ColorManager
                                                              .darkSkyBlue80
                                                          : ColorManager.liliac,
                                                      fontSize: AppSize.s16.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            if (snapshot.data!.allGifts.isEmpty)
                              Text(
                                LocaleKeys.emptyGifts.tr(),
                                style: getRegularDINNextStyle(
                                    color: ColorManager.terracota,
                                    fontSize: AppSize.s20),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                      ),
                      if (selectedGift != null)
                        Visibility(
                          visible: buyGiftSuccess == true ? true : false,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p3.w,
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: AppPadding.p14.w,
                                            vertical: AppPadding.p3.h,
                                          ),
                                          margin: EdgeInsets.only(
                                            top: AppMargin.m14.w,
                                          ),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: ColorManager.dark,
                                            border: Border.all(
                                              width: AppSize.s2,
                                              color: ColorManager.white,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              AppSize.s20,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: ColorManager.white,
                                                blurRadius: AppSize.s10,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(height: AppSize.s6.h),
                                              Card(
                                                color: ColorManager.offWhite
                                                    .withOpacity(AppSize.s015),
                                                shadowColor: ColorManager.dark,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    AppSize.s20,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: AppPadding.p1_5.h,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: AppSize.s4.w,
                                                      ),
                                                      Text(
                                                        isCurrentLanguageEn(
                                                                context)
                                                            ? selectedGift!
                                                                .giftEnName
                                                            : selectedGift!
                                                                .giftArName,
                                                        style:
                                                            getMediumMPLUSRounded1CStyle(
                                                          color: ColorManager
                                                              .lightBlue,
                                                          fontSize:
                                                              AppSize.s20.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      left: AppPadding.p18.w,
                                      right: AppPadding.p18.w,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorManager.terracota
                                                  .withOpacity(AppSize.s02),
                                              spreadRadius: AppSize.s7,
                                              blurRadius: AppSize.s9,
                                              offset: const Offset(
                                                  AppSize.s3, AppSize.s3M),
                                            ),
                                          ],
                                          border: Border.all(
                                            width: AppSize.s3,
                                            color: ColorManager.white,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            AppSize.s20,
                                          ),
                                        ),
                                        width: AppSize.s27.w,
                                        height: AppSize.s14.h,
                                        child: Image.network(
                                            '${Constants.baseUrl}${selectedGift!.giftPicture}',
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
                                  ],
                                ),
                                SizedBox(height: AppSize.s3.h),
                                Text(
                                  LocaleKeys.congratulations.tr(),
                                  style: getMediumMPLUSRounded1CStyle(
                                    color: ColorManager.maize,
                                    fontSize: AppSize.s24.sp,
                                  ),
                                ),
                                SizedBox(height: AppSize.s1.h),
                                Text(
                                  '${LocaleKeys.youWon.tr()} ${isCurrentLanguageEn(context) ? selectedGift!.giftEnName : selectedGift!.giftArName}',
                                  style: getMediumMPLUSRounded1CStyle(
                                    color: ColorManager.white,
                                    fontSize: AppSize.s22.sp,
                                  ),
                                ),
                                SizedBox(height: AppSize.s5.h),
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorManager.terracota
                                            .withOpacity(AppSize.s04),
                                        spreadRadius: AppSize.s1,
                                        blurRadius: AppSize.s9,
                                        offset: const Offset(
                                            AppSize.s10, AppSize.s7),
                                      ),
                                    ],
                                  ),
                                  child: CustomButtonWidget(
                                    onTap: () {
                                      setState(() => buyGiftSuccess = false);
                                    },
                                    shadowColor: ColorManager.terracota,
                                    borderColor: ColorManager.terracota,
                                    backGroundColor: ColorManager.terracota,
                                    title: LocaleKeys.continu.tr(),
                                    textColor: ColorManager.dark,
                                    style: getMediumDINNextStyle(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s21.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                } else {
                  return StateRenderer(
                    stateRendererType: StateRendererType.fullScreenLoadingState,
                    retryActionFunction: () {
                      _homeViewModel.getUserPoints();
                    },
                  );
                }
              },
            ),
            SizedBox(
              height: AppSize.s30.h,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

//ignore: must_be_immutable
class CustomDialogBox extends StatefulWidget {
  String pointType;
  String points;
  String title;
  String image;
  bool buyGiftSuccess;
  Future<void> Function() assignGift;

  CustomDialogBox({
    Key? key,
    required this.pointType,
    required this.points,
    required this.title,
    required this.image,
    required this.buyGiftSuccess,
    required this.assignGift,
  }) : super(key: key);

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p7.w,
                vertical: AppPadding.p5.h,
              ),
              margin: EdgeInsets.only(top: AppMargin.m14.w),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: ColorManager.dark,
                border: Border.all(
                  width: AppSize.s2,
                  color: ColorManager.white,
                ),
                borderRadius: BorderRadius.circular(AppSize.s20),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.white,
                    blurRadius: AppSize.s10,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: AppSize.s6.h),
                  Card(
                    color: ColorManager.offWhite.withOpacity(AppSize.s015),
                    elevation: AppSize.s5,
                    shadowColor: ColorManager.dark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppPadding.p1_5.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            widget.pointType == 'gem'
                                ? ImageAssets.gemBlueIcon
                                : ImageAssets.flashPurpleIcon,
                          ),
                          SizedBox(width: AppSize.s4.w),
                          Text(
                            widget.points,
                            style: getMediumMPLUSRounded1CStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s16.sp,
                            ),
                          ),
                          SizedBox(width: AppSize.s4.w),
                          const Image(
                            image: AssetImage(ImageAssets.refreshIcon),
                          ),
                          SizedBox(width: AppSize.s4.w),
                          Text(
                            widget.title,
                            style: getMediumMPLUSRounded1CStyle(
                              color: ColorManager.lightBlue,
                              fontSize: AppSize.s17.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s4.h),
                  Text(
                    '${LocaleKeys.aeYouSureTrade.tr()} ${widget.points} ${LocaleKeys.gemFor.tr()} ${widget.title} ?',
                    style: getMediumMPLUSRounded1CStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSize.s3.h),
                ],
              ),
            ),
            SizedBox(height: AppSize.s9.h),
          ],
        ),
        Positioned(
          left: AppPadding.p18.w,
          right: AppPadding.p18.w,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorManager.terracota.withOpacity(AppSize.s02),
                  spreadRadius: AppSize.s7,
                  blurRadius: AppSize.s9,
                  offset: const Offset(AppSize.s3, AppSize.s3M),
                ),
              ],
              border: Border.all(
                width: AppSize.s3,
                color: ColorManager.white,
              ),
              borderRadius: BorderRadius.circular(
                AppSize.s20,
              ),
            ),
            width: AppSize.s27.w,
            height: AppSize.s14.h,
            child: Image.network('${Constants.baseUrl}${widget.image}',
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSize.s20,
                      ),
                      child: Image.asset(
                        ImageAssets.errorImage,
                        fit: BoxFit.fill,
                      ),
                    )),
          ),
        ),
        Positioned(
          top: AppPadding.p39.h,
          right: AppPadding.p10.w,
          left: AppPadding.p10.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  //  setState(() => buyGiftSuccess = false);
                },
                child: SvgPicture.asset(
                  ImageAssets.cancelIcon,
                  width: AppSize.s20.w,
                ),
              ),
              InkWell(
                onTap: () async {
                  await widget.assignGift();
                  //    Navigator.of(context).pop();
                  // setState(() => buyGiftSuccess = true);
                },
                child: SvgPicture.asset(
                  ImageAssets.checkTrueIcon,
                  width: AppSize.s20.w,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = ColorManager.terracota;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height / 2, size.width, 0);
    path.quadraticBezierTo(size.width / 2, -size.height / 2, 0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
