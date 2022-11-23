import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/my_saving_schemes_screens_controllers/my_scheme_pending_payment_screen_controller.dart';
import 'package:olocker/screens/saving_schemes_screens/scheme_choose_payment_method_screen/scheme_choose_payment_method_screen_widgets.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';

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
        title: const Text(
          "Make Payment",
          style: TextStyle(
            color: AppColors.blackColor,
          ),
        ).commonOnlyPadding(left: 50),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.redAccent),
        child: Center(
          child: Text(
            "PAY NOW",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: AppColors.whiteColor),
          ).commonSymmetricPadding(vertical: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SencoPaymentImageModule(),
            SizedBox(height: 2.h),
            AmountDetailsModule(),
            SizedBox(height: 2.h),
          ],
        ).commonAllSidePadding(12),
      ),
    );
  }
}
