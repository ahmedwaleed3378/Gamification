
import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//ignore: must_be_immutable
class CustomDialogButton extends StatefulWidget {
  CustomDialogButton({
    Key? key,
    required this.backGroundColor,
    required this.borderColor,
    required this.title,
    required this.shadowColor,
    this.onTap,
    this.icon,
    this.iconColor,
    required this.textColor,
    this.style,
    this.height,
    this.widget,
    this.fontSize,
    this.borderWidth=1,
    this.width,
  }) : super(key: key);
  final Color backGroundColor;
  final Color borderColor;

  final String title;
  final Color shadowColor;
  Function? onTap;
  final Color textColor;
  IconData? icon;
  Color? iconColor;
  TextStyle? style;
  double? height;
  Widget? widget;
  double? fontSize;
  double? width;
  final double borderWidth ;
  @override
  State<CustomDialogButton> createState() => _CustomDialogButtonState();
}

class _CustomDialogButtonState extends State<CustomDialogButton> {
  bool isExpanded = false;

  void expandAndShrink() {
    // setState(() {
    //   isExpanded = true;
    // });
    //
    // Timer(const Duration(milliseconds: 300), () {
    //   setState(() {
    //     isExpanded = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      height: isExpanded ? AppSize.s5.h : widget.height ?? AppSize.s6.h,
      width: isExpanded ? AppSize.s82.w : widget.width ?? AppSize.s91.w,
      child: Material(
        shadowColor:
        widget.onTap != null ? widget.shadowColor : ColorManager.brownGrey,
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        color: widget.onTap != null
            ? widget.backGroundColor
            : ColorManager.brownGrey,
        child: ElevatedButton(

          style: ElevatedButton.styleFrom(
            backgroundColor: widget.backGroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                width:widget.borderWidth,
                color: widget.onTap != null
                    ? widget.borderColor
                    : ColorManager.brownGrey,
              ),
            ),
          ),
          onPressed: widget.onTap != null
              ? () {
            expandAndShrink();
            widget.onTap!();
          }
              : null,
          child: widget.widget ??
              (widget.icon != null
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    color: widget.iconColor ?? ColorManager.white,
                    size: AppSize.s2.h,
                  ),
                  SizedBox(
                    width: AppSize.s1.w,
                  ),
                  Text(
                    widget.title,
                    style: getRegularDINNextStyle(
                        color: widget.textColor,
                        fontSize: AppSize.s18.sp),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
                  : Text(
                widget.title,
                style: widget.style ??
                    getRegularDINNextStyle(
                      color: widget.textColor,
                      fontSize: widget.fontSize ?? AppSize.s19.sp,
                    ),
                textAlign: TextAlign.center,
              )),
        ),
      ),
    );
  }
}
