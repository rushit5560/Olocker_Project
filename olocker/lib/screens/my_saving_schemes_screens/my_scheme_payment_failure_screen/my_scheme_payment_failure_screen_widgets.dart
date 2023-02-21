import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/my_saving_schemes_screens_controllers/my_scheme_payment_failure_screen_controller.dart';

import 'package:sizer/sizer.dart';

class PaymentUnSuccessContainerWidget extends StatelessWidget {
  PaymentUnSuccessContainerWidget({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePaymentFailureScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            "Your payment is unsuccessful !",
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.accentBGColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          Image.asset(
            AppImages.paymentUnSuccessimage,
            height: 10.h,
          ),
          SizedBox(height: 4.h),
          Text(
            "Try again",
            style: TextStyle(
              fontSize: 15.sp,
              color: AppColors.blackColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 1.5.h),
          Text(
            "Payment has been declined",
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.greyDarkColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          // SizedBox(height: 5.h),
        ],
      ),
    );
  }
}

class ImageShowWidget extends StatelessWidget {
  ImageShowWidget({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePaymentFailureScreenController>();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.declinedCardimage,
      height: 25.h,
      width: 90.w,
      fit: BoxFit.contain,
    );
  }
}

class TryAnotherMethodButton extends StatelessWidget {
  TryAnotherMethodButton({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePaymentFailureScreenController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.back();

          // screenController.makePaymentsApiFunction();
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
              fontFamily: "Roboto-Medium",
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
