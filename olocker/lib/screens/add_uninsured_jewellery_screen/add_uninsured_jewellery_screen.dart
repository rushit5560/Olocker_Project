import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';

import 'package:sizer/sizer.dart';

import '../../controllers/add_uninsured_jewellery_screen_controller.dart';
import '../../widgets/common_loader.dart';
import 'add_uninsured_jewellery_screen_widgets.dart';

class AddUnInsuredJewelleryScreen extends StatelessWidget {
  AddUnInsuredJewelleryScreen({Key? key}) : super(key: key);
  final addUnInsuredJewelleryScreenController =
      Get.put(AddUnInsuredJewelleryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBrownBgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        titleSpacing: 0,
        title: Text(
          'Add Uninsured Jewellery',
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
        () => addUnInsuredJewelleryScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.unInsuredBgImage,
                      width: addUnInsuredJewelleryScreenController.size.width,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        ProductDetailsFormModule(),
                        MetalDetailsFormModule(),
                        StoneDetailsFormModule(),
                        DecorativeItemDetailsFormModule(),
                        UploadImageFileFormModule(),
                        SubmitCancelFormModule(),
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
