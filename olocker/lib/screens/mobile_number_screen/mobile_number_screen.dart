import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/utils/field_validation.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/mobile_number_screen_controller.dart';
import '../../widgets/common_buttons.dart';

class MobileNumberScreen extends StatelessWidget {
  MobileNumberScreen({Key? key}) : super(key: key);

  final mobileNumberScreenController = Get.put(MobileNumberScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
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
            body: SingleChildScrollView(
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
                      Text(
                        "Enter Mobile Number",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Form(
                    key: mobileNumberScreenController.formKey,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      controller: mobileNumberScreenController.numberController,
                      validator: (value) =>
                          FieldValidator().validateMobileNumber(value!),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: "Enter your mobile number",
                        hintStyle: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ).commonSymmetricPadding(
                      horizontal: 10.w,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  RectangleRoundedButton(
                    buttonColor: AppColors.accentColor,
                    onPressed: () {
                      mobileNumberScreenController.submitMobileNumber();
                    },
                    centerChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text(
                          "GET OTP",
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
          mobileNumberScreenController.isLoading.value
              ? CommonLoader().showOverlayLoader(
                  mobileNumberScreenController.isLoading.value)
              : const SizedBox(),
        ],
      ),
    );
  }
}
