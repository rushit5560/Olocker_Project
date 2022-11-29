import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/screens/saving_schemes_screens/scheme_choose_payment_method_screen/scheme_choose_payment_method_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/api_url.dart';
import '../../../controllers/saving_schemes_screens_controllers/saving_scheme_confirmation_screen_controller.dart';



class AmountDetailsModule extends StatelessWidget {
  AmountDetailsModule({Key? key}) : super(key: key);

  final savingSelectionScreenController =
      Get.find<SavingSchemeConfirmationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Thank You for choosing our scheme.\n Your details are as follows',
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Monthly Amount",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 2.h),
                                Text(
                                  "₹ ${savingSelectionScreenController.savingSchemeDetails.monthlyAmount}",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tenure",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${savingSelectionScreenController.savingSchemeDetails.tenure}",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 0.4.h),
                                Text(
                                  "months",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.accentColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Our Contribution",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "₹ ${savingSelectionScreenController.savingSchemeDetails.ourContribution}",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: AppColors.accentColor,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Maturity Amount",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "₹ ${savingSelectionScreenController.savingSchemeDetails.maturityAmount}",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: AppColors.accentColor,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProceedToPayButtonModule extends StatelessWidget {
  ProceedToPayButtonModule({Key? key}) : super(key: key);

  final savingSelectionScreenController =
      Get.find<SavingSchemeConfirmationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: savingSelectionScreenController.size.height * 0.18,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    value: savingSelectionScreenController
                        .termConditionCheckValue.value,
                    onChanged: (value) {
                      savingSelectionScreenController
                              .termConditionCheckValue.value =
                          !savingSelectionScreenController
                              .termConditionCheckValue.value;
                      // _isChecked = value!;
                    },
                  ),
                ),
                SizedBox(width: 1.5.w),
                Expanded(
                  flex: 9,
                  child: Text(
                    """I have read the terms & conditions and I agree that I am making payment to (jeweller) & olocker is not responsible fpr delivery & other issues.""",
                    overflow: TextOverflow.clip,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blueDarkColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 2.h),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (savingSelectionScreenController
                    .termConditionCheckValue.value) {
                  Get.to(
                    () => SchemeChoosePaymentMethodScreen(),
                    arguments: [
                      savingSelectionScreenController.schemeImagePath,
                      savingSelectionScreenController.schemeName,
                      savingSelectionScreenController.schemeTagLine,
                      savingSelectionScreenController.savingSchemeDetails,
                      savingSelectionScreenController
                          .partnerSavingSchemeDetails,
                    ],
                  );
                } else {
                  CommonWidgets().showBorderSnackBar(
                    context: context,
                    displayText:
                        "Please accept our terms and conditions to move forward.",
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  "PROCEED TO PAY",
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
          ),
          // Container(
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: Colors.redAccent),
          //   child: Center(
          //     child: Text(
          //       "PROCEED TO PAY",
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 16.sp,
          //           color: AppColors.whiteColor),
          //     ).commonSymmetricPadding(vertical: 15),
          //   ),
          // )
        ],
      ),
    );
  }
}
