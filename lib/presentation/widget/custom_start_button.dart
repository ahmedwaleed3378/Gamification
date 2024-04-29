import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//ignore: must_be_immutable
class CustomStartButton extends StatelessWidget {
   CustomStartButton({Key? key, required this.color, required this.onTap, required this.text , this.textColor}) : super(key: key);
final Color color;
final VoidCallback onTap;
final String text;
Color? textColor;
  @override
  Widget build(BuildContext context) {

     return Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: AppSize.s6.h,
          width: AppSize.s91.w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: onTap,
            child: Text(
              text,
              style: getMediumDINNextStyle(
                color:textColor?? ColorManager.dark,
                fontSize: AppSize.s24,
              ),
            ),
          ),
        ),
      );

  }
}
