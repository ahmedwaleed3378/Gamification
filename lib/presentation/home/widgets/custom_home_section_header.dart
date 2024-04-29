
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.mainTitle,
    required this.subTitle,
  required  this.onTap,
  });
  final String mainTitle;
  final String subTitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          mainTitle,
          style: getSemiBoldDINNextStyle(
              color: ColorManager.blue, fontSize: AppSize.s21.sp
              // .h
              ),
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration:  BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color:  ColorManager.maize,
                    ),
                  ),
                ),
                child: Text(
                  subTitle,
                  style: getMediumInterStyle(
                      color:onTap==null?ColorManager.greyDark : ColorManager.maize,
                      fontSize: AppSize.s16.sp,
                       ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
