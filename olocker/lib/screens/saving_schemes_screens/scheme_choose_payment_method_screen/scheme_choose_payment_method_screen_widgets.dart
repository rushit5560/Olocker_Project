import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:olocker/widgets/common_widgets.dart';

import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/enum.dart';
import '../../../controllers/saving_schemes_screens_controllers/scheme_choose_payment_method_screen_controller.dart';

class PaymentMethods extends StatelessWidget {
  PaymentMethods({Key? key}) : super(key: key);

  final screenController =
      Get.find<SchemeChoosePaymentMethodScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => screenController.isLoading.value
          ? CommonLoader().showCircularLoader()
          : Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Payable",
                          style: TextStyle(
                            color: AppColors.blueDarkColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "₹ ${screenController.savingSchemeDetails.monthlyAmount}",
                          style: TextStyle(
                            color: AppColors.accentColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      "Payment methods",
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // SizedBox(height: 0.5.h),
                    Column(
                      children: [
                        RadioListTile<PaymentTypeEnum>(
                            title: Row(
                              children: [
                                SizedBox(
                                  height: Get.size.height * 0.025,
                                  child: Image.asset(
                                    AppImages.paytmImage,
                                  ),
                                ),
                              ],
                            ),
                            value: PaymentTypeEnum.paytm,
                            groupValue: screenController.paymentTypeEnum,
                            onChanged: (val) {
                              // setState(() {

                              screenController.isLoading(true);
                              screenController.paymentTypeEnum = val;
                              screenController.isLoading(false);
                              // });
                            }),
                        RadioListTile<PaymentTypeEnum>(
                            title: Row(
                              children: [
                                SizedBox(
                                  height: Get.size.height * 0.025,
                                  child: Image.asset(
                                    AppImages.gpayImage,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                            value: PaymentTypeEnum.googlepay,
                            groupValue: screenController.paymentTypeEnum,
                            onChanged: (val) {
                              screenController.isLoading(true);
                              screenController.paymentTypeEnum = val;
                              screenController.isLoading(false);
                            }),
                        RadioListTile<PaymentTypeEnum>(
                            title: Row(
                              children: [
                                SizedBox(
                                  height: Get.size.height * 0.025,
                                  child: Image.asset(
                                    AppImages.amoZonImage,
                                  ),
                                ),
                              ],
                            ),
                            value: PaymentTypeEnum.amazonpay,
                            groupValue: screenController.paymentTypeEnum,
                            onChanged: (val) {
                              screenController.isLoading(true);
                              screenController.paymentTypeEnum = val;
                              screenController.isLoading(false);
                            }),
                        RadioListTile<PaymentTypeEnum>(
                            title: Row(
                              children: [
                                SizedBox(
                                  height: Get.size.height * 0.025,
                                  child: Image.asset(
                                    AppImages.visaImage,
                                  ),
                                ),
                              ],
                            ),
                            value: PaymentTypeEnum.visa,
                            groupValue: screenController.paymentTypeEnum,
                            onChanged: (val) {
                              screenController.isLoading(true);
                              screenController.paymentTypeEnum = val;
                              screenController.isLoading(false);
                            }),
                        RadioListTile<PaymentTypeEnum>(
                          title: Row(
                            children: [
                              SizedBox(
                                height: Get.size.height * 0.025,
                                child: Image.asset(
                                  AppImages.cashImage,
                                ),
                              ),
                            ],
                          ),
                          value: PaymentTypeEnum.cashondelivery,
                          groupValue: screenController.paymentTypeEnum,
                          onChanged: (val) {
                            screenController.isLoading(true);
                            screenController.paymentTypeEnum = val;
                            screenController.isLoading(false);
                          },
                        ),
                        SizedBox(height: 1.h),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class PayNowCustomButton extends StatelessWidget {
  PayNowCustomButton({Key? key}) : super(key: key);

  final screenController =
      Get.find<SchemeChoosePaymentMethodScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (screenController.paymentTypeEnum == null) {
            CommonWidgets().showBorderSnackBar(
              context: context,
              displayText:
                  "Please select any payment method to continue payment.",
            );
          } else if(screenController.paymentTypeEnum == PaymentTypeEnum.visa) {
            // Here call Razorpay payment intent
            screenController.createRazorPaymentSheet();
          } else {
            screenController.paymentSavingSchemeFunction();
          }

          // if (screenController
          //     .termConditionCheckValue.value) {
          //   Get.to(
          //     () => SchemeChoosePaymentMethodScreen(),
          //     arguments: [
          //       savingSelectionScreenController.schemeImagePath,
          //       savingSelectionScreenController.schemeName,
          //       savingSelectionScreenController.schemeTagLine,
          //       savingSelectionScreenController.savingSchemeDetails,
          //       savingSelectionScreenController
          //           .partnerSavingSchemeDetails,
          //     ],
          //   );
          // } else {
          //   CommonWidgets().showBorderSnackBar(
          //     context: context,
          //     displayText:
          //         "Please accept our terms and conditions to move forward.",
          //   );
          // }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            "PAY NOW",
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
