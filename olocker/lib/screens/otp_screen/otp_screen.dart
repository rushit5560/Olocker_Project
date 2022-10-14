import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/otp_screen_controller.dart';
import 'package:olocker/screens/otp_screen/otp_screen_widgets.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/utils/field_validation.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/common_buttons.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);

  final otpScreenController = Get.put(OtpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentBGColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
      ),
      body: Obx(
        () => otpScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 2.h,
                        left: 6.w,
                        right: 6.w,
                        bottom: 3.h,
                      ),
                      // height: otpScreenController.size.height * 0.4,
                      width: otpScreenController.size.width,
                      color: AppColors.accentBGColor,
                      child: Image.asset(
                        AppImages.otpTopImage,
                        fit: BoxFit.contain,
                        height: 35.h,
                        width: 70.w,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Enter 6 digit code sent for you",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2.h),
                    OtpEnterForm(),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't receive the OTP ? ",
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "RESEND OTP",
                          style: TextStyle(
                            color: AppColors.accentTextColor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    RectangleRoundedButton(
                      buttonColor: AppColors.accentColor,
                      onPressed: () {
                        otpScreenController.validateOtpNumberFunction(context);
                      },
                      centerChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Text(
                            "Verify & Proceed",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // SizedBox(width: 6.w),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.whiteColor,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ).commonSymmetricPadding(
                      horizontal: 3.w,
                      vertical: 1.5.h,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
