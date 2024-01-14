import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color primaryBackgroundColor = hexToColor('#E5E5E5');
  static Color primaryBlue = hexToColor('#3498DB');
  static Color textColor = hexToColor('#3C3C43');
  static Color green = hexToColor('#2ECC71');
  static Color secondaryDarkAppColor = Colors.white;
  static Color yellowBackgroundText = hexToColor('#0A0203');
  static Color blackBackgroundText = hexToColor('#FFCB04');
  static Color blackBackgroundDimmedText = hexToColor('#f2d566');
  static Color deactivatedBlackButton = hexToColor('#616161');
  static Color greyBorder = hexToColor('#6A6868');
}
