import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CustomPlanItem extends StatelessWidget {
  const CustomPlanItem({Key? key, required this.price, required this.duration, required this.borderColor}) : super(key: key);
 final double price;
 final String duration;
 final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s82.w,
      height: AppSize.s12.h,
      padding: EdgeInsets.symmetric(horizontal: AppSize.s5.w , vertical: AppSize.s1.h),
      decoration: BoxDecoration(
          color: ColorManager.charcoalGrey,
          borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderColor ,
          width: 1
        ),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Text(duration , style: getMediumDINNextStyle(color:  ColorManager.white,
          fontSize: AppSize.s20.sp
            ),),
          const Spacer(),
          Text('\$ ${price.toStringAsFixed(2)}' , style: getMediumDINNextStyle(color:  ColorManager.green,
          fontSize: AppSize.s19.sp
          ))
        ],
      ),
    );
  }
}
