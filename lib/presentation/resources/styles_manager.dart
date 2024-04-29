import 'package:flutter/material.dart';
import 'package:gamification/presentation/resources/font_manager.dart';

TextStyle _getTextStyle(
    String fontFamily, double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color);
}

TextStyle getSemiBoldDINNextStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.dINNext,
  );
}
TextStyle getRegularDINNextStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? height,
}) {
  return TextStyle(
    height: height,
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.dINNext,
  );
}

TextStyle getMediumDINNextStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.medium,
    fontFamily: FontConstants.dINNext,
  );
}

TextStyle getRegularFeatherStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.feather,
  );
}

TextStyle getBoldFeatherStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.feather,
  );
}

TextStyle getRegularSegoeStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.segoeFontFamily,
  );
}

TextStyle getBoldSegoeStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.segoeFontFamily,
  );
}

TextStyle getRegularInterStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.interFontFamily,
  );
}

TextStyle getRegularPoppinsStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.poppinsFontFamily,
  );
}

TextStyle getRegularDMSansStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.dMSans,
  );
}

TextStyle getMediumInterStyle({
  double fontSize = FontSize.s12,
  required Color color,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.medium,
    fontFamily: FontConstants.interFontFamily,
    decoration: decoration,
  );
}

TextStyle getMediumMPLUSRounded1CStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.medium,
    fontFamily: FontConstants.mPLUSRounded1c,
  );
}

TextStyle getMediumSFProDisplayCStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.medium,
    fontFamily: FontConstants.sFProDisplay,
  );
}
TextStyle getSemiBoldSFProDisplayCStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.sFProDisplay,
  );
}

TextStyle getSemiBoldInterStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.interFontFamily,
  );
}

TextStyle getSemiBoldPoppinsStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.poppinsFontFamily,
  );
}

TextStyle getRegularOpenSansStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.openSansFontFamily,
  );
}

TextStyle getSemiBoldOpenSansStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.openSansFontFamily,
  );
}

TextStyle getBoldOpenSansStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.openSansFontFamily,
  );
}

TextStyle getBoldOxygenStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.oxygenFontFamily,
    wordSpacing: wordSpacing,
    letterSpacing: letterSpacing,
    height: height,
  );
}

TextStyle getRegularOxygenStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.oxygenFontFamily,
  );
}

TextStyle getLightOxygenStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.light,
    fontFamily: FontConstants.oxygenFontFamily,
  );
}
