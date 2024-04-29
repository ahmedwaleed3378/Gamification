import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomLanguageWidget extends StatelessWidget {
  const CustomLanguageWidget(
      {Key? key,
      required this.backGroundColor,
      required this.borderColor,
      required this.countryFlag,
      required this.countryName,
      required this.showColor,
      required this.onTap})
      : super(key: key);
  final Color backGroundColor;
  final Color borderColor;

  final String countryFlag;
  final String countryName;
  final Color showColor;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: showColor,
      elevation: 3,
      borderRadius: BorderRadius.circular(16),
      color: backGroundColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: ColorManager.gray.withOpacity(.5),
              blurRadius: 1.0,
              offset:
                  const Offset(0, 3), // Positive Y-offset for the bottom shadow
            ),
            const BoxShadow(
              color: Colors.transparent,
              // Use a transparent color for the top shadow
              blurRadius: 1.0,
              offset: Offset(0, 3), // Negative Y-offset for the top shadow
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                width: 1.5,
                color: borderColor,
              ),
            ),
          ),
          onPressed: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.s6.w),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.s2.h),
                  child: SvgPicture.asset(
                    countryFlag,
                    height: AppSize.s3.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: AppSize.s10.w,
                ),
                Text(
                  countryName,
                  style: getRegularDINNextStyle(
                      color: ColorManager.white, fontSize: AppSize.s20.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
