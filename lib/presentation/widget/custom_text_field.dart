import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAuthFormFiled extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final String? labelText;
  final TextInputType keyboardType;
  final void Function(String)? onFieldSubmitted;
  
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final String? hintText;
  final String? upHintText;
  final String? suffixText;
  final String? errorText;
  final TextStyle? suffixTextStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? labelColor;
  final Color? cursorColor;
  final double radius;
  final double? height;

  //final int? maxLines;
  final double horizontalPadding;
  final double verticalPadding;
  final InputBorder? inputBorder;
  final InputBorder? inputEnabledBorder;
  final InputBorder? inputFocusedBorder;
  final InputBorder? inputDisabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final AlignmentGeometry? containerAlignment;
  final BoxConstraints? suffixIconConstraints;
  final bool readOnly;
  final int? maxLength;
  final int? errorMaxLines;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? errorStyle;

  const CustomAuthFormFiled({
    Key? key,
    required this.controller,
    this.validator,
    this.onTap,
    this.labelText,
    required this.keyboardType,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onChanged,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.hintText,
    this.upHintText,
    this.backgroundColor,
    this.height,
    this.radius = 30.0,
    // this.maxLines,
    this.enabled = true,
    this.inputBorder =
        const OutlineInputBorder(borderSide: BorderSide(width: 1)),
    this.inputEnabledBorder,
    this.inputFocusedBorder,
    this.inputDisabledBorder,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.textColor,
    this.labelColor = Colors.white,
    this.contentPadding,
    this.containerAlignment,
    this.suffixText,
    this.suffixTextStyle,
    this.suffixIconConstraints,
    this.readOnly = false,
    this.cursorColor,
    this.maxLength,
    this.errorMaxLines = 2,
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.autofocus = false,
    this.inputFormatters,
    this.errorText,
    this.errorStyle,
  }) : super(key: key);

  @override
  State<CustomAuthFormFiled> createState() => _CustomAuthFormFiledState();
}

class _CustomAuthFormFiledState extends State<CustomAuthFormFiled> {
  Color color = ColorManager.white;

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    widget.controller.addListener(() {
      color = widget.controller.text.isEmpty
          ? ColorManager.steel
          : ColorManager.lightGrey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: ColorManager.black,
      color: ColorManager.dark,
      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
      elevation: 4,
      child: TextFormField(
        inputFormatters: widget.inputFormatters ?? <TextInputFormatter>[],
        // Only numbers can be entered
        autofocus: widget.autofocus,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        readOnly: widget.readOnly,
   
        cursorColor: ColorManager.terracota,
        enabled: widget.enabled,
        textAlignVertical: TextAlignVertical.center,
        textAlign: widget.textAlign,
        //   maxLines: maxLines,
        textDirection: widget.textDirection,
        initialValue: widget.initialValue,
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        onFieldSubmitted: widget.onFieldSubmitted,
        onEditingComplete: widget.onEditingComplete,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        obscureText: widget.obscureText,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontSize: AppSize.s16.sp, color: ColorManager.white),
        decoration: InputDecoration(
          errorStyle: widget.errorStyle,
          counterText: '',
          errorText: widget.errorText,
          suffixStyle: widget.suffixTextStyle,
          fillColor: ColorManager.charcoalGrey80,
          labelStyle: getRegularDINNextStyle(
            color: ColorManager.steel,
            fontSize: AppSize.s16.sp,
          ),
          filled: true,
          suffixText: widget.suffixText,
          errorMaxLines: widget.errorMaxLines,
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppSize.s18,
            horizontal: AppSize.s16,
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          border: InputBorder.none,
          suffixIcon: widget.suffixIcon,
          prefixIconColor: ColorManager.steel,
          suffixIconColor: ColorManager.steel,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.steel,
              width: AppSize.s1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s10),
            ),
          ),

          // focused border style
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.white,
              width: AppSize.s1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s10),
            ),
          ),

          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.red,
              width: AppSize.s1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s10),
            ),
          ),

          // error focused border style
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.white,
              width: AppSize.s1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s10),
            ),
          ),
        ),
      ),
    );
  }
}
