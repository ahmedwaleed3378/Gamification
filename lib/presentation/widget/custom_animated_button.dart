import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//ignore: must_be_immutable
class CustomAnimatedButtonWidget extends StatefulWidget {
  CustomAnimatedButtonWidget({
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
    this.borderWidth = 1,
    this.width, required this.color, required this.imagePath,
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
  final double borderWidth;
  final Color color;
  final String imagePath;
  @override
  State<CustomAnimatedButtonWidget> createState() => _CustomAnimatedButtonWidgetState();
}

class _CustomAnimatedButtonWidgetState extends State<CustomAnimatedButtonWidget> {
  bool isExpanded = false;

  void expandAndShrink() {
    setState(() {
      isExpanded = true;
    });

    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        isExpanded = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: AppMargin.m1.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: widget.color, width: AppSize.s3),
              left: BorderSide(color: widget.color, width: AppSize.s0),
              right: BorderSide(color: widget.color, width: AppSize.s0),
              top: BorderSide(color: widget.color, width: AppSize.s0),
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.transparent,
                blurRadius: 0,
                spreadRadius: 0.5,
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(AppSize.s16),
          ),
          child: AnimatedContainer(
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
                      width: widget.borderWidth,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: AppSize.s6.w,
                    ),
                    Expanded(
                      child: Text(
                          widget.title,
                          style: widget.style ??
                          getRegularDINNextStyle(
                          color: widget.textColor,
                          fontSize: widget.fontSize ?? AppSize.s19.sp,
                          ),
                          textAlign: TextAlign.center,
                          ),
                    ),
                    SvgPicture.asset(
                      widget.imagePath,
                      width: AppSize.s7.w,
                      height: AppSize.s7.w,
                    ),
                    SizedBox(
                      width: AppSize.s4.w,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
