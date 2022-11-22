import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../../controllers/my_uninsured_jewellery_screen_controller.dart';
import 'my_uninsured_jewellery_screen_widgets.dart';

class MyUnInsuredJewelleryScreen extends StatelessWidget {
  MyUnInsuredJewelleryScreen({Key? key}) : super(key: key);

  final unInsuredJewelleryController =
      Get.put(MyUnInsuredJewelleryScreenController());

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
          'My UnInsured Jewellery',
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
        () => unInsuredJewelleryController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    unInsuredJewelleryController.getOrnamentList.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 100),
                            child: Center(
                              child: Text(
                                "No UnInsured Jewellery Available",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          )
                        : UnInsuredJewelleryListModule(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
      ),
    );
  }
}
