import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/saving_schemes_screens_controllers/saving_scheme_enroll_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/saving_schemes_screens_controllers/scheme_payment_success_screen_controller.dart';
import 'scheme_payment_success_screen_widgets.dart';

class SchemePaymentSuccessScreen extends StatelessWidget {
  SchemePaymentSuccessScreen({Key? key}) : super(key: key);
  final schemePaymentSuccessScreenController =
      Get.put(SchemePaymentSuccessScreenController());

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
            "GO BACK TO MY SAVING SCHEMES",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                color: AppColors.whiteColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SencoPaymentSuccessImageModule(),
            SizedBox(height: 2.h),
            const PaymentSuccessDetailsModule(),
            SizedBox(height: 2.h),
            const PaymentSuccessfulModule()
          ],
        ).commonAllSidePadding(12),
      ),
    );
  }
}
