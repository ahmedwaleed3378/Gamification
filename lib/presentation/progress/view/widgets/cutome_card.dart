import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCard extends StatelessWidget {
 final String title;
 final String icon;
final  String value;
 final Color color;

 const CustomCard(this.title, this.icon, this.value, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Expanded(
      child: Container(
        height: AppSize.s12.h,
        padding: EdgeInsets.only(
         top: AppSize.s3.w,
         left: AppSize.s1.w,
        right: AppSize.s1.w,
         bottom: AppSize.s3.w,
         ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s15),
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: getMediumDINNextStyle(
                color: ColorManager.white,
                fontSize: AppSize.s17.sp,
              ),
              overflow: TextOverflow.clip,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  width: AppSize.s5.w,
                  height: AppSize.s7.w,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  width: AppSize.s1_5.w,
                ),
                Text(
                  value,
                  style: getRegularDINNextStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s18.sp,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  
  }
}
