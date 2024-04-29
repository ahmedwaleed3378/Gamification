import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomMatchedItem extends StatelessWidget {
  const CustomMatchedItem(
      {Key? key, required this.text, this.width, required this.color})
      : super(key: key);
  final String text;
  final double? width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppSize.s1.h,
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppSize.s1.h,
        horizontal: AppSize.s1.w,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSize.s15),
      ),
      child: width == null
          ? Text(
              text,
              style: getMediumDINNextStyle(
                color: ColorManager.white,
                fontSize: AppSize.s16.sp,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          : SizedBox(
              width: width,
              child: Text(
                text,
                style: getMediumDINNextStyle(
                  color: ColorManager.white,
                  fontSize: AppSize.s16.sp,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
    );
  }
}
