import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../controllers/mobile_number_screen_controller.dart';

class MobileNumberLoadingWidget extends StatelessWidget {
  MobileNumberLoadingWidget({Key? key}) : super(key: key);

  final mobileNumberScreenController = Get.find<MobileNumberScreenController>();

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
                // height: MobileNumberScreenController.size.height * 0.4,
                width: mobileNumberScreenController.size.width,
                color: AppColors.accentBGColor,
                child: Image.asset(
                  AppImages.mobileNumberTopImage,
                  fit: BoxFit.contain,
                  height: 35.h,
                  // width: 70.w,
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 15,
                    width: 50.w,
                    decoration: const BoxDecoration(color: AppColors.greyColor),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                height: 40,
                decoration: const BoxDecoration(color: AppColors.greyColor),
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(color: AppColors.greyColor),
                    ),
                    SizedBox(width: 2.w),
                    RichText(
                      text: TextSpan(
                        text: "I hereby agree to the ",
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyColor,
                        ),
                        children: [
                          TextSpan(
                            text: "Terms & Conditions",
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  // vertical: 20,
                  horizontal: 6.w,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
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
