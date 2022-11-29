import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import '../../../controllers/saving_schemes_screens_controllers/scheme_payment_Failure_screen_controller.dart';

class TryAnotherPaymentMethodButton extends StatelessWidget {
  TryAnotherPaymentMethodButton({Key? key}) : super(key: key);

  final screenController = Get.find<SchemePaymentFailureScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.back();
          //
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            "TRY ANOTHER PAYMENT METHOD",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: AppColors.whiteColor,
              fontStyle: FontStyle.italic,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ),
    );
  }
}

class UnSuccessPaymentWidget extends StatelessWidget {
  const UnSuccessPaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            "Your payment is unsuccessful  !",
            style: TextStyle(
              fontSize: 15.sp,
              color: AppColors.accentColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2.h),
          SizedBox(
            height: Get.size.height * 0.20,
            child: Image.asset(
              AppImages.declinedCardimage,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            "Try again",
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.greyDarkColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            "Payment has been declined",
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.greyDarkColor,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
