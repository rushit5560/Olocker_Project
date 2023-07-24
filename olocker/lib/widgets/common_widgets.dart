import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class CommonWidgets {
  showBorderSnackBar({
    required BuildContext context,
    required String displayText,
  }) {

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            color: AppColors.blackTextColor,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        backgroundColor: AppColors.whiteColor,
        content: Text(
          displayText,
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontFamily: "Roboto",
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        action: SnackBarAction(
          label: "Okay",
          onPressed: () {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
