import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/add_new_jeweller_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';


class RetailerCodeFieldModule extends StatelessWidget {
  RetailerCodeFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddNewJewellerScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.retailerCodeFieldController,
      decoration: const InputDecoration(hintText: 'Retailer Code'),
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
      decoration: const InputDecoration(hintText: 'Enter Referral Code If Any'),
    );
  }
}




class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddNewJewellerScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
