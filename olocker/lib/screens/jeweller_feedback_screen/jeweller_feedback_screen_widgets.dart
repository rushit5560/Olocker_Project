import 'package:flutter/material.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

class JewellerCollectionModule extends StatelessWidget {
  const JewellerCollectionModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkCreamBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Hot was our Jewellery Colection?',
            style: TextStyle(
              fontSize: 12.sp,

            ),
          ).commonAllSidePadding(10),
        ],
      ),
    );
  }
}
