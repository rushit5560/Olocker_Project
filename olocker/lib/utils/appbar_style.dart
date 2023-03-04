import 'package:flutter/material.dart';
import 'package:olocker/constants/app_colors.dart';

class TextStyleConfig {
  static TextStyle appbarTextStyle({
    Color textColor = AppColors.darkBlue,
    FontWeight fontWeight = FontWeight.w400,
    double fontSize = 15,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
