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
import '../../widgets/common_widgets.dart';

class MobileNumberScreen extends StatelessWidget {
  MobileNumberScreen({Key? key}) : super(key: key);

  final mobileNumberScreenController = Get.put(MobileNumberScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
        body: mobileNumberScreenController.isLoading.value
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
                            fontFamily: "Acephimere",
                            color: AppColors.greyDarkColor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Form(
                      key: mobileNumberScreenController.formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: "Acephimere",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          controller:
                              mobileNumberScreenController.numberController,
                          validator: (value) =>
                              FieldValidator().validateMobileNumber(value!),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: "Enter your mobile number",
                            prefix: Text(
                              "+91 - ",
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontFamily: "Acephimere",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: AppColors.greyColor,
                              fontFamily: "Acephimere",
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ).commonSymmetricPadding(
                          horizontal: 10.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    RectangleRoundedButton(
                      buttonColor: AppColors.accentColor,
                      onPressed: () {
                        if (mobileNumberScreenController
                            .termConditionCheckValue.value) {
                          mobileNumberScreenController
                              .userLoginFunction(context);
                        } else {
                          CommonWidgets().showBorderSnackBar(
                            context: context,
                            displayText:
                                "Please accept our terms and conditions to move forward.",
                          );
                        }
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
                              fontFamily: "Acephimere",
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // SizedBox(width: 6.w),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.whiteColor,
                            size: 17.sp,
                          ),
                        ],
                      ),
                    ).commonSymmetricPadding(
                      horizontal: 5.w,
                      vertical: 1.5.h,
                    ),
                    SizedBox(height: 2.h),
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 28,
                              width: 28,

                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(5),
                              //   // border: Border.all(
                              //   //   color: AppColors.blueDarkColor,
                              //   //   width: 1,
                              //   // ),
                              // ),
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => AppColors.accentBGColor),
                                activeColor: AppColors.lightBrownBgColor,
                                checkColor: AppColors.whiteColor,
                                value: mobileNumberScreenController
                                    .termConditionCheckValue.value,
                                onChanged: (value) {
                                  mobileNumberScreenController
                                          .termConditionCheckValue.value =
                                      !mobileNumberScreenController
                                          .termConditionCheckValue.value;
                                  // _isChecked = value!;
                                },
                              ),
                            ),
                            SizedBox(width: 1.5.w),
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
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
              ),
      ),
    );
  }
}
