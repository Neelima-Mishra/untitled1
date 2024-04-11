import 'package:flutter/material.dart';

import 'colors_manager.dart';

BoxDecoration get boxDecorationWithShadow => BoxDecoration(
        color: ColorManager.colorWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.colorOffWhiteShadow, width: 1),
        boxShadow: [
          BoxShadow(
            color: ColorManager.colorOffWhiteShadow,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: const Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ]);
BoxDecoration get boxDecorationRadioSelect => BoxDecoration(
        color: ColorManager.colorLiteYellowBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.primary, width: 1),
        boxShadow: [
          BoxShadow(
            color: ColorManager.colorOffWhiteShadow,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: const Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ]);

BoxDecoration get boxDecorationSelectRadio => BoxDecoration(
      color: ColorManager.primary,
      borderRadius: BorderRadius.circular(50),
    );
BoxDecoration get boxDecorationUnSelectRadio => BoxDecoration(
      color: ColorManager.colorGreyText,
      borderRadius: BorderRadius.circular(50),
    );
BoxDecoration get boxDecorationBorderRadio => BoxDecoration(
      color: ColorManager.colorWhite,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: ColorManager.colorGreyText, width: 1),
    );
BoxDecoration get boxDecorationSquareImage => BoxDecoration(
      color: ColorManager.primary,
      borderRadius: BorderRadius.circular(10),
    );
