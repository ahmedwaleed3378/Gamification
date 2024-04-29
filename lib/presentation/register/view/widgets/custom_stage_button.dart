import 'package:flutter/material.dart';
import 'package:gamification/presentation/widget/custom_animated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';
import '../../viewmodel/register_viewmodel.dart';

class StageButton extends StatelessWidget {
  const StageButton(
      {super.key,
      required this.arName,
      required this.imagePath,
      required this.id,
      required this.viewModel,
      required this.color,
      required this.onTap,
      required this.bgColor});

  final int id;
  final String arName;
  final String imagePath;
  final RegisterViewModel viewModel;
  final VoidCallback? onTap;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedButtonWidget(
      onTap: onTap,
      backGroundColor: bgColor,
      borderColor: color,
      shadowColor: ColorManager.steel50,
      textColor: ColorManager.white,
      borderWidth: AppSize.s1.w,
      title: arName,
      color: color,
      imagePath:imagePath ,
    );
  }
}
