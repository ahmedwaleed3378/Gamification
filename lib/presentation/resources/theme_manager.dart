import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/color_manager.dart';
import 'package:gamification/presentation/resources/font_manager.dart';
import 'package:gamification/presentation/resources/styles_manager.dart';
import 'package:gamification/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    /// main colors
    primaryColor: ColorManager.dark,
    primaryColorLight: ColorManager.dark,
    disabledColor: ColorManager.coolGrey,
    splashColor: ColorManager.dark,

    /// card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.coolGrey,
      elevation: AppSize.s1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s2.dp),
        ),
      ),
    ),

    // /// divider theme
    // dividerTheme: const DividerThemeData(
    //     endIndent: AppSize.s16,
    //     indent: AppSize.s16,
    //     space: AppSize.s16),

    /// app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.dark,
      elevation: AppSize.s4,
      shadowColor: ColorManager.coolGrey,
      titleTextStyle: getBoldSegoeStyle(
        fontSize: FontSize.s10.sp,
        color: ColorManager.white,
      ),
    ),

    /// button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.coolGrey,
      buttonColor: ColorManager.dark,
      splashColor: ColorManager.azure,
    ),

    /// elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularSegoeStyle(
          color: ColorManager.white,
          fontSize: FontSize.s10.sp,
        ),
        backgroundColor: ColorManager.dark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s02.dp),
        ),
      ),
    ),

    /// text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldInterStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16.sp,
      ),
      displayMedium: getSemiBoldInterStyle(
        color: ColorManager.black,
        fontSize: FontSize.s22.sp,
      ),
      displaySmall: getSemiBoldInterStyle(
        color: ColorManager.black,
        fontSize: FontSize.s24.sp,
      ),
      headlineMedium: getSemiBoldInterStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s18.sp,
      ),
      titleMedium: getRegularInterStyle(
        color: ColorManager.warmGrey,
        fontSize: FontSize.s12.sp,
      ),
      titleSmall: getRegularInterStyle(
        color: ColorManager.black,
        fontSize: FontSize.s14.sp,
      ),
      bodySmall: getRegularOpenSansStyle(color: ColorManager.coolGrey),
    ),

    /// input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorManager.white,
      filled: true,

      /// content padding
      contentPadding: EdgeInsets.all(AppPadding.p024.dp),
      hintStyle: getRegularInterStyle(
        color: ColorManager.coolGrey,
        fontSize: FontSize.s14.sp,
      ),
      labelStyle: getRegularInterStyle(
        color: ColorManager.warmGrey3,
        fontSize: FontSize.s16.sp,
      ),
      errorStyle: getRegularInterStyle(color: ColorManager.red),

      /// enabled
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.paleGrey,
          width: AppSize.s006.dp,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s02.dp),
        ),
      ),

      /// focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.dark,
          width: AppSize.s006.dp,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s02.dp),
        ),
      ),

      /// error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.red,
          width: AppSize.s006.dp,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s02.dp),
        ),
      ),

      /// error focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.orange,
          width: AppSize.s006.dp,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSize.s02.dp),
        ),
      ),
    ),
  );
}
