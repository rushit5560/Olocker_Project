import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/add_new_jeweller_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import 'add_new_jeweller_screen_widgets.dart';

class AddNewJewellerScreen extends StatelessWidget {
  AddNewJewellerScreen({Key? key}) : super(key: key);
  final addNewJewellerScreenController =
      Get.put(AddNewJewellerScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackColor,
          ),
        ),
        title: const Text(
          'Add Jeweller',
          style: TextStyle(
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            // height: addNewJewellerScreenController.size.height,
            // width: addNewJewellerScreenController.size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.addJewelleryImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: addNewJewellerScreenController.size.height * 0.036.h,
            child: Column(
              children: [
                Expanded(
                  flex: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.whiteColor,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey, spreadRadius: 1, blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'RETAILER CODE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                        RetailerCodeFieldModule(),
                        ReferralCodeFieldModule(),
                      ],
                    ).commonAllSidePadding(10),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: SubmitButtonModule(),
                ),
              ],
            ),
          ).commonSymmetricPadding(horizontal: 15, vertical: 150),
        ],
      ),
    );
  }
}
