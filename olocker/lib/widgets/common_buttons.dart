import 'package:flutter/material.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/utils/extensions.dart';

import 'package:sizer/sizer.dart';

class RectangleRoundedButton extends StatelessWidget {
  const RectangleRoundedButton({
    Key? key,
    this.onPressed,
    required this.centerChild,
    required this.buttonColor,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget centerChild;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          // vertical: 20,
          horizontal: 6.w,
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: centerChild,
        ),
      ),
    );
  }
}
