import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/generated/locale_keys.g.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/routes_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CashCodeView extends StatefulWidget {
  const CashCodeView(
      {Key? key,
      required this.image,
      required this.id,
      this.subDescrition,
      required this.description})
      : super(key: key);
  final String image;
  final int id;
  final String description;
  final String? subDescrition;

  @override
  State<CashCodeView> createState() => _CashCodeViewState();
}

class _CashCodeViewState extends State<CashCodeView> {
  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: AppSize.s10.h,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            size: AppSize.s3.h,
            color: ColorManager.terracota,
          ),
        ),
        title: Text(
          LocaleKeys.payment.tr(),
          style: getRegularDINNextStyle(
              color: ColorManager.terracota, fontSize: AppSize.s22.sp),
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
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p8.w,
                vertical: AppPadding.p4.h,
              ).copyWith(top: AppSize.s10.h),
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSize.s8.w, vertical: AppSize.s4.h),
                  decoration: BoxDecoration(
                      color: ColorManager.charcoalGrey,
                      borderRadius: BorderRadius.circular(AppSize.s20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(AppSize.s5),
                            child: Image.asset(
                              widget.image,
                              width: AppSize.s3_5.h,
                              height: AppSize.s3_5.h,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                ImageAssets.errorImage,
                                width: AppSize.s3_5.h,
                                height: AppSize.s3_5.h,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppSize.s2.w,
                          ),
                          Text(
                            LocaleKeys.codeRecieved.tr(),
                            style: getMediumDINNextStyle(
                                color: ColorManager.blue,
                                fontSize: AppSize.s19.sp),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s2.h,
                      ),
                      Text(
                        widget.description,
                        style: getMediumDINNextStyle(
                                color: ColorManager.white,
                                fontSize: AppSize.s19.sp)
                            .copyWith(height: AppSize.s1_5),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: AppSize.s3.h,
                      ),
                      if (widget.subDescrition != null)
                        Text(
                          widget.subDescrition!,
                          style: getMediumDINNextStyle(
                                  color: ColorManager.yellow,
                                  fontSize: AppSize.s19.sp)
                              .copyWith(height: AppSize.s1_5),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  )),
            ),
          ),
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
            /// TODO : CONTINUE AFTER RECIEVED CODE
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.homeRoute, (route) => false);
          },
          height: AppSize.s7.h,
          shadowColor: ColorManager.terracota,
          borderColor: ColorManager.terracota,
          backGroundColor: ColorManager.terracota,
          title: LocaleKeys.ok.tr(),
          style: getMediumDINNextStyle(
            color: ColorManager.white,
            fontSize: AppSize.s21.sp,
          ),
          fontSize: AppSize.s21.sp,

          textColor: ColorManager.dark,
        ),
      ),
    );
  }
}
