import 'package:flutter/material.dart';

class ColorManager {
  //primary color
  static Color primary = HexColor.fromHex("#FFB627");
  static Color primaryOpacity95 = HexColor.fromHex("#10FFB627");
  static Color primaryOpacity50 = HexColor.fromHex("#50F0124C");
  static Color primaryOpacity40 = HexColor.fromHex("#40F0124C");
  static Color primaryOpacity20 = HexColor.fromHex("#20F0124C");
  static Color primaryCircularBg = HexColor.fromHex("#FFD9E3");

  //secondary color
  static Color secondary = HexColor.fromHex("#001957");
  static Color secondaryOpacity95 = HexColor.fromHex("#95001957");
  static Color secondaryOpacity50 = HexColor.fromHex("#50001957");
  static Color secondaryOpacity40 = HexColor.fromHex("#40001957");
  static Color secondaryOpacity20 = HexColor.fromHex("#20001957");

  static Color colorWhite = HexColor.fromHex("#ffffff");
  static Color colorGrey = HexColor.fromHex("#7A7E89");
  static Color colorGreen = HexColor.fromHex("#00A53D");
  static Color colorBlack = HexColor.fromHex("#000000");
  static Color colorDescriptionText = HexColor.fromHex("#7A7E89");
  static Color colorContentText = HexColor.fromHex("#0B3757");
  static Color colorHeadingText = HexColor.fromHex("#001B41");
  static Color colorOffWhiteShadow = HexColor.fromHex("#F6F6F6");
  static Color colorGreyText = HexColor.fromHex("#7C818A");
  static Color colorShadowDropDown = HexColor.fromHex("#D7D3CB");
  static Color colorUIBackground = HexColor.fromHex("#F8F8FC");

  static Color colorLiteGreenBackground = HexColor.fromHex("#E8F0EF");
  static Color colorLiteYellowBackground = HexColor.fromHex("#FFF0D4");
  static Color primaryButtonOpacity10 = HexColor.fromHex("#10FFB627");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
