import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class MySpaceShimmer extends StatelessWidget {
  const MySpaceShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(top: AppPadding.p2.h),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      childAspectRatio: 1.0 / 1.15,
      crossAxisCount: AppSize.s2.toInt(),
      mainAxisSpacing: AppSize.s22,
      crossAxisSpacing: AppSize.s16,
      children: List.generate(
        6,
        (int index) {
          return AnimationConfiguration.staggeredGrid(
            columnCount: AppSize.s2.toInt(),
            position: index,
            duration: Duration(milliseconds: AppSize.s500.toInt()),
            child: ScaleAnimation(
              scale: AppSize.s05,
              child: FadeInAnimation(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    color: ColorManager.paleGrey,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p12,
                  ).copyWith(top: AppPadding.p2.h),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppSize.s10.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(AppSize.s16)),
                        ),
                        SizedBox(height: AppSize.s1.h),
                        Container(
                          height: AppSize.s14,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(AppSize.s16)),
                        ),
                        SizedBox(height: AppSize.s1.h),
                        Container(
                          height: AppSize.s10,
                          width: AppSize.s10.h,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(AppSize.s16)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _body() {
    return Column(children: [
      Container(
        height: AppSize.s220,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSize.s16)),
      ),
      const SizedBox(
        height: AppSize.s12,
      ),
      Container(
        height: AppSize.s30,
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSize.s8)),
      ),
    ]);
  }
}
