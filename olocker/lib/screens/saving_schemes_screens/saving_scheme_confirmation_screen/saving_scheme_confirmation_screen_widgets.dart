import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/saving_schemes_screens_controllers/saving_scheme_confirmation_screen_controller.dart';

class JewellerDetailsHeaderModule extends StatelessWidget {
  JewellerDetailsHeaderModule({Key? key}) : super(key: key);

  final savingSelectionScreenController =
      Get.find<SavingSchemeConfirmationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Image.asset(
            AppImages.diamondsIocn,
            fit: BoxFit.cover,
            width: 18.w,
          ),
          SizedBox(width: 2.h),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Senco Gold",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Senco Gold dfd gsd ghd h",
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ).commonAllSidePadding(20),
    );
  }
}

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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor,
              ),
              child: Column(
                children: [
                  Text(
                    'Thank You jbb ujb uihuh uhuih uihuih fgeg ewgergb weg ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            SizedBox(height: 1.5.h),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 2.h),
                                Text(
                                  "₹ 2200",
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
                            SizedBox(height: 2.5.h),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "12",
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
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
                                fontSize: 14.sp,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 11.sp,
                            ),
                            Text(
                              "₹ 2500",
                              style: TextStyle(
                                fontSize: 22.sp,
                                color: AppColors.accentColor,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Maturity Amount",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 11.sp,
                            ),
                            Text(
                              "₹ 32500",
                              style: TextStyle(
                                fontSize: 22.sp,
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
      height: savingSelectionScreenController.size.height * 0.22,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.blackColor, width: 2)),
                child: Checkbox(
                  activeColor: AppColors.lightBrownBgColor,
                  checkColor: AppColors.blackColor,
                  value: true,
                  onChanged: (value) {
                    // _isChecked = value!;
                  },
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                flex: 9,
                child: Text(
                  """I have read the terms & conditions""",
                  overflow: TextOverflow.clip,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 3.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent),
            child: Center(
              child: Text(
                "PROCEED TO PAY",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: AppColors.whiteColor),
              ).commonSymmetricPadding(vertical: 15),
            ),
          )
        ],
      ),
    );
  }
}
