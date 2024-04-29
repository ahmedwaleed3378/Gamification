import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/assets_manager.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomPaymentWidget extends StatelessWidget {
  const CustomPaymentWidget(
      {Key? key,
      required this.borderColor,
      required this.paymentImage,
      required this.paymentMethodText})
      : super(key: key);
  final Color borderColor;
  final String paymentImage;
  final String paymentMethodText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s82.w,
      height: AppSize.s10.h,
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.s5.w, vertical: AppSize.s2.h),
      decoration: BoxDecoration(
        color: ColorManager.charcoalGrey,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s5),
            child: Image.asset(
              paymentImage,
              width: AppSize.s4.h,
              height: AppSize.s4.h,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                ImageAssets.errorImage,
                width: AppSize.s4.h,
                height: AppSize.s4.h,
              ),
            ),
          ),
          SizedBox(
            width: AppSize.s3.w,
          ),
          Text(
            paymentMethodText,
            style: getMediumDINNextStyle(
                color: ColorManager.white, fontSize: AppSize.s19.sp),
           )
        ],
      ),
    );
  }
}
