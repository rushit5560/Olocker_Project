import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/add_new_jeweller_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/utils/field_validation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_images.dart';

class RetailerCodeFormModule extends StatelessWidget {
  RetailerCodeFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddNewJewellerScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: screenController.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RETAILER CODE',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            TextFormField(
              controller: screenController.retailerCodeFieldController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.blackColor,
                fontFamily: "Roboto",
              ),
              validator: (val) => FieldValidator().validateRetailerCode(val!),
              readOnly: screenController.isTypeEnable.value,
              decoration: InputDecoration(
                hintText: 'Retailer code',
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.greyTextColor,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            TextFormField(
              controller: screenController.referralCodeFieldController,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (val) =>
              //     FieldValidator().validateRefferalCodeNumber(val!),
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.blackColor,
                fontFamily: "Roboto",
              ),
              decoration: InputDecoration(
                hintText: 'Enter Referral Code If Any',
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.greyTextColor,
                  fontFamily: "Roboto",
                ),
              ),
              onChanged: (value) {
                screenController.isLoading(true);

                // If referral code field contain any value then retailer code field disable.
                if (value.isEmpty) {
                  screenController.isTypeEnable.value = false;
                } else if (value.isNotEmpty) {
                  screenController.isTypeEnable.value = true;
                  screenController.retailerCodeFieldController.clear();

                  if (screenController.referralCodeFieldController.text
                      .contains('-')) {
                    List codeList = screenController
                        .referralCodeFieldController.text
                        .split('-');
                    screenController.refferalCode = codeList[0];
                    screenController.retailerCodeFieldController.text =
                        codeList[1];
                    log('refferalCode :${screenController.refferalCode}');
                    log('retailerCode :${screenController.retailerCodeFieldController.text}');
                  }
                }

                screenController.isLoading(false);
              },
            ),
            // RetailerCodeFieldModule(),
            // ReferralCodeFieldModule(),
            const SizedBox(height: 25),
          ],
        ).commonSymmetricPadding(horizontal: 16, vertical: 15),
      ),
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddNewJewellerScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await screenController.addMyJewellerFunction();
      },
      child: Container(
        height: 35,
        width: screenController.size.width * 0.78,
        padding: EdgeInsets.symmetric(
          // vertical: 20,
          horizontal: 6.w,
        ),
        decoration: const BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
        ),
        child: Center(
          child: Text(
            "SUBMIT",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 13.sp,
              fontFamily: "Roboto",
              // fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class AddJewellerLoadingWidget extends StatelessWidget {
  AddJewellerLoadingWidget({Key? key}) : super(key: key);
  final screenController = Get.find<AddNewJewellerScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.addJewelleryImage),
                fit: BoxFit.fill,
              ),
            ),
          )),
    );
  }
}
