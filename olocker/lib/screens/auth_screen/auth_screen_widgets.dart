import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton({
    Key? key,
    this.onPressed,
    required this.centerChild,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget centerChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 10.h,
        ),
        child: Center(
          child: centerChild,
        ),
      ),
    );
  }
}
