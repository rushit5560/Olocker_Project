import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/all_loyalty_point_screen_controller.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:sizer/sizer.dart';

import 'all_loyalty_points_screen_widgets.dart';

class AllLoyaltyPointScreen extends StatelessWidget {
  AllLoyaltyPointScreen({Key? key}) : super(key: key);
  final allLoyaltyPointScreenController =
      Get.put(AllLoyaltyPointScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueDarkColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        title: Text(
          'Loyalty Points',
          style: TextStyleConfig.appbarTextStyle(),
        ),
      ),
      body: Obx(
        () => allLoyaltyPointScreenController.isLoading.value
            ? const AllLoyaltyPointsLoadingWidget()
            : allLoyaltyPointScreenController.loyaltyPointList.isEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Center(
                      child: Text(
                        "No Loyalty Points Records Found",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                : AllLoyaltyPointListModule(),
      ),
    );
  }
}
