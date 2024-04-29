import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class RequestShimmer extends StatelessWidget {
  const RequestShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
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
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
          ),
          SizedBox(height: AppSize.s1.h),
        ],
      ),
    );
  }
}
