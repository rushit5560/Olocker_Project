import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/my_saving_schemes_screens_controllers/my_scheme_pending_payment_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import 'my_scheme_pending_payment_screen_widgets.dart';

class MySchemePendingPaymentScreen extends StatelessWidget {
  MySchemePendingPaymentScreen({Key? key}) : super(key: key);

  final mySchemePendingPaymentScreenController =
      Get.put(MySchemePendingPaymentScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBrownBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightBrownBgColor,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.blackColor,
        ),
        title: Text(
          "Make Payments",
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ).commonOnlyPadding(left: 50),
      ),
      bottomNavigationBar: PayNowButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PaymentDetails(),
            SizedBox(height: 2.h),
            PaymentMethods(),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
