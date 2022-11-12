import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/widgets/common_buttons.dart';

import 'package:sizer/sizer.dart';

import '../../controllers/jewellery_details_screen_controller.dart';
import 'jewellery_details_screen_widgets.dart';

class JewelleryDetailsScreen extends StatelessWidget {
  JewelleryDetailsScreen({Key? key}) : super(key: key);
  final jewelleryDetailsController =
      Get.put(JewelleryDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueDarkColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightBrownBgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        title: Text(
          '${jewelleryDetailsController.jewelleryTypeName}',
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Obx(
        () => jewelleryDetailsController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          AppImages.jewelleryProductBgShapeImage,
                          width: double.infinity,
                          height: jewelleryDetailsController.size.height * 0.4,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 15,
                          top: 10,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.favorite_border,
                              color: AppColors.accentColor,
                              size: 24,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 15,
                          top: 10,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.share_outlined,
                              color: AppColors.accentColor,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        JewelleryApproxPriceModule(),
                      ],
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: jewelleryDetailsController.size.width * 0.25,
          vertical: 2.h,
        ),
        child: SizedBox(
          height: 45,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: AppColors.accentColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
            ),
            child: Center(
              child: Text(
                "enquire now".toUpperCase(),
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
