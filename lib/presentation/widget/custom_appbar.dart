import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:gamification/presentation/widget/flip_icon.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

customAppBar({
  required BuildContext context,
  String? title,
  double? height,
  void Function()? onTap,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height!),
    child: Container(
      color: ColorManager.lightOrange,
      padding: const EdgeInsets.all(AppPadding.p8),
      child: AppBar(
        title: Text(
          title!,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: getBoldOxygenStyle(
            color: ColorManager.black,
            fontSize: AppSize.s16.sp,
          ),
        ),
        backgroundColor: ColorManager.lightOrange,
        shadowColor: Colors.transparent,
        leading: InkWell(
          onTap: onTap,
          child: FlipIcon(
            buildContext: context,
            child: Icon(
              Icons.arrow_circle_right_outlined,
              color: ColorManager.orange,
              size: AppSize.s5.h,
            ),
          ),
        ),
      ),
    ),
  );
}
