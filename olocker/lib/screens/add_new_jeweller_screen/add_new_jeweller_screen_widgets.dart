import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/add_new_jeweller_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/utils/field_validation.dart';
import 'package:sizer/sizer.dart';

class RetailerCodeFieldModule extends StatelessWidget {
  RetailerCodeFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddNewJewellerScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: screenController.retailerCodeFieldController,
        readOnly: screenController.isTypeEnable.value,
        validator: (val) => FieldValidator().validateRetailerCodeNumber(val!),
        decoration: const InputDecoration(hintText: 'Retailer Code'),
      ),
    );
  }
}

class ReferralCodeFieldModule extends StatelessWidget {
  ReferralCodeFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddNewJewellerScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.referralCodeFieldController,
      validator: (val) => FieldValidator().validateRefferalCodeNumber(val!),
      decoration: const InputDecoration(hintText: 'Enter Referral Code If Any'),
      onChanged: (value) {
        screenController.isLoading(true);
        if (value.isEmpty) {
          screenController.isTypeEnable.value = false;
        } else if (value.isNotEmpty) {
          screenController.isTypeEnable.value = true;
          screenController.retailerCodeFieldController.clear();

          if (screenController.referralCodeFieldController.text.contains('-')) {
            List codeList =
                screenController.referralCodeFieldController.text.split('-');
            screenController.refferalCode = codeList[0];
            screenController.retailerCodeFieldController.text = codeList[1];
            log('refferalCode :${screenController.refferalCode}');
            log('retailorCode :${screenController.retailerCodeFieldController.text}');
          }
        }
        screenController.isLoading(false);
      },
    );
  }
}

class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddNewJewellerScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await screenController.addMyJewellerFunction(),
      child: Container(
        // width: screenController.size.width * 0.70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.accentColor,
        ),
        child: Text(
          'SUBMIT',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ).commonSymmetricPadding(vertical: 8, horizontal: 120),
      ),
    );
    /*return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: -16,
          child: Container(
            width: screenController.size.width * 0.70,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.accentColor,
            ),
            child: Center(
              child: const Text(
                'SUBMIT',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ).commonSymmetricPadding(vertical: 10),
            ),
          ),
        ),
      ],
    );*/
  }
}
