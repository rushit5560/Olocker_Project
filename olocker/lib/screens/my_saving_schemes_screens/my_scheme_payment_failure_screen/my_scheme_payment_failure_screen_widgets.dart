import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/my_saving_schemes_screens_controllers/my_scheme_payment_failure_screen_controller.dart';
import '../../../controllers/saving_schemes_screens_controllers/scheme_payment_Failure_screen_controller.dart';

class HeaderModule extends StatelessWidget {
  HeaderModule({Key? key}) : super(key: key);
  final screenController = Get.find<MySchemePaymentFailureScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Container(),
          ),
          Expanded(
            flex: 75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Senco Gold',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  'Swaarna Sanchay Scheme',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    // color: AppColors.accentColor,
                    // fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ).commonSymmetricPadding(horizontal: 15, vertical: 20),
    ).commonSymmetricPadding(vertical: 10, horizontal: 15);
  }
}
