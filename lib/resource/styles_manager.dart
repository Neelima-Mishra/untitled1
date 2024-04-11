import 'package:flutter/material.dart';

import 'colors_manager.dart';
import 'fonts_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

TextStyle get getBorderButtonStyle => _getTextStyle(FontSize.s16,
    FontConstants.fontFamily, FontWeightManager.semiBold, ColorManager.primary);

TextStyle get getFillButtonStyle => _getTextStyle(
    FontSize.s16,
    FontConstants.fontFamily,
    FontWeightManager.semiBold,
    ColorManager.colorWhite);

TextStyle get getTabBar12SelectedStyle => _getTextStyle(FontSize.s16,
    FontConstants.fontFamily, FontWeightManager.regular, ColorManager.primary);

TextStyle get getContentTextStyle => _getTextStyle(
    FontSize.s16,
    FontConstants.fontFamily,
    FontWeightManager.semiBold,
    ColorManager.colorContentText);

TextStyle get getTabBar12DefaultStyle => _getTextStyle(
    FontSize.s16,
    FontConstants.fontFamily,
    FontWeightManager.semiBold,
    ColorManager.colorGrey);

TextStyle get getEditTextStyle => _getTextStyle(
    FontSize.s14,
    FontConstants.fontFamily,
    FontWeightManager.semiBold,
    ColorManager.colorDescriptionText);

TextStyle get getEditTextHintStyle => _getTextStyle(
    FontSize.s14,
    FontConstants.fontFamily,
    FontWeightManager.regular,
    ColorManager.colorDescriptionText);

TextStyle get getRadioButtonTextStyle => _getTextStyle(
    FontSize.s14,
    FontConstants.fontFamily,
    FontWeightManager.medium,
    ColorManager.colorGreyText);
TextStyle get getRadioButtonTextSelectStyle => _getTextStyle(FontSize.s14,
    FontConstants.fontFamily, FontWeightManager.medium, ColorManager.primary);

TextStyle get getHeaderToolBarStyle => _getTextStyle(
    FontSize.s20,
    FontConstants.fontFamily,
    FontWeightManager.regular700,
    ColorManager.colorHeadingText);

TextStyle get getHeaderTitleStyle => _getTextStyle(
    FontSize.s30,
    FontConstants.fontFamily,
    FontWeightManager.regular700,
    ColorManager.colorHeadingText);
TextStyle get getTabBarStepperNormalStyle => _getTextStyle(
    FontSize.s12,
    FontConstants.fontFamily,
    FontWeightManager.semiBold,
    ColorManager.colorDescriptionText);

TextStyle get getTabBarStepperSelectedStyle => _getTextStyle(FontSize.s12,
    FontConstants.fontFamily, FontWeightManager.semiBold, ColorManager.primary);
