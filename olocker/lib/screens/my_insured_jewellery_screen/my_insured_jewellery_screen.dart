import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/my_insured_jewellery_screen_controller.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import 'my_insured_jewellery_screen_widgets.dart';

class MyInsuredJewelleryScreen extends StatelessWidget {
  MyInsuredJewelleryScreen({Key? key}) : super(key: key);

  final myInsuredJewelleryScreenController =
      Get.put(MyInsuredJewelleryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueDarkColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        titleSpacing: 0,
        title: Text(
          'My Insured Jewellery',
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Obx(
        () => myInsuredJewelleryScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    myInsuredJewelleryScreenController
                            .getInsuredOrnamentList.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 100),
                            child: Center(
                              child: Text(
                                "No Insured Jewellery Available",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          )
                        : InsuredJewelleryListModule(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
      ),
    );
  }
}
