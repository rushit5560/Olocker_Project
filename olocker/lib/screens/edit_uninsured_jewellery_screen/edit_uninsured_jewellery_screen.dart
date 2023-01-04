import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';

import 'package:sizer/sizer.dart';

import '../../controllers/edit_uninsured_jewellery_screen_controller.dart';
import '../../widgets/common_loader.dart';
import 'edit_uninsured_jewellery_screen_widgets.dart';

class EditUnInsuredJewelleryScreen extends StatelessWidget {
  EditUnInsuredJewelleryScreen({Key? key}) : super(key: key);
  final editUnInsuredJewelleryScreenController =
      Get.put(EditUnInsuredJewelleryScreenController());

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
          'Edit Uninsured Jewellery',
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Obx(
        () => editUnInsuredJewelleryScreenController.isLoading.value
            ? EditUninsuredJewelleryLoadingWidget()
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/uninsured_bg.png",
                      width: editUnInsuredJewelleryScreenController.size.width,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        ProductDetailsFormModule(),
                        MetalDetailsFormModule(),
                        StoneDetailsFormModule(),
                        DecorativeItemDetailsFormModule(),
                        UploadImageFileFormModule(),
                        SubmitCancelButtonsModule(),
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
