import 'package:flutter/material.dart';
import 'package:gamification/presentation/common/functions.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: !Functions.isRTL(context)
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          left: AppPadding.p1.w,
          right: AppPadding.p2.w,
        ),
        child: IconButton(
          icon: Icon(
           Functions.isRTL(context)
                ? MdiIcons.chevronRight
                : MdiIcons.chevronLeft,
            color: ColorManager.terracota,
            size: AppSize.s28.sp,
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
