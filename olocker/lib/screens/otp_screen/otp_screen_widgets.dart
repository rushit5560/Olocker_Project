import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/otp_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../utils/field_validation.dart';

class OtpEnterForm extends StatelessWidget {
  OtpEnterForm({Key? key}) : super(key: key);

  final otpScreenController = Get.find<OtpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: otpScreenController.formKey,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.blackColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 4.w,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
        ],
        controller: otpScreenController.otpController,
        validator: (value) => FieldValidator().validateOtpNumber(value!),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Enter Otp",
          hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
          ),
        ),
      ).commonSymmetricPadding(
        horizontal: 10.w,
      ),
    );
  }
}

class OtpScreenLoadingWidget extends StatelessWidget {
  OtpScreenLoadingWidget({Key? key}) : super(key: key);

  final otpScreenController = Get.find<OtpScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SingleChildScrollView(
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
                  Container(
                    height: 15,
                    width: 60.w,
                    decoration:const BoxDecoration(color: AppColors.greyColor),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                height: 45,
                decoration:const BoxDecoration(color: AppColors.greyColor),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 2.w),
                  RichText(
                    text: TextSpan(
                      text: "Don't receive the OTP? ",
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: "RESEND OTP",
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 4.h),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  // vertical: 20,
                  horizontal: 6.w,
                ),
                decoration:const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius:  BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
