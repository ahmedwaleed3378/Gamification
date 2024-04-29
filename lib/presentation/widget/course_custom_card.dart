import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.length,
    this.data,
    required this.color,
  });

  final int length;
  final dynamic data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.count(
        shrinkWrap: true,
        childAspectRatio: 1.0 / 1.15,
        crossAxisCount: 2,
        children: List.generate(
          length,
              (int index) {
            return AnimationConfiguration.staggeredGrid(
              columnCount: 2,
              position: index,
              duration: Duration(milliseconds: AppSize.s500.toInt()),
              child: ScaleAnimation(
                scale: 0.5,
                child: FadeInAnimation(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      color: color,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p4.w,
                      vertical: AppPadding.p2.h,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: AppPadding.p2.w,
                      vertical: AppPadding.p2.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppSize.s10.h,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(AppSize.s12),
                            border: Border.all(
                              color: ColorManager.orange,
                            ),
                          ),
                          child: SvgPicture.asset(
                            data[index]['image'],
                          ),
                        ),
                        SizedBox(height: AppSize.s1.h),
                        Text(
                          data[index]['title'],
                          style: getBoldOxygenStyle(
                            color: ColorManager.greyIshBrown,
                            fontSize: AppSize.s14.sp,
                          ),
                        ),
                        SizedBox(height: AppSize.s1.h),
                        Text(
                          '${data[index]['video']} Videos, ${data[index]['test']} Tests',
                          style: getBoldOxygenStyle(
                            color: ColorManager.gray400,
                            fontSize: AppSize.s12.sp,
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
    );
  }
}