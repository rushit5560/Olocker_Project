import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_loyalty_point_screen_controller.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

class JewellerLoyaltyPointScreen extends StatelessWidget {
  JewellerLoyaltyPointScreen({Key? key}) : super(key: key);
  final jewellerLoyaltyPointScreenController = Get.put(JewellerLoyaltyPointScreenController());

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
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),

      body: Obx(
          ()=> jewellerLoyaltyPointScreenController.isLoading.value
              ? CommonLoader().showCircularLoader()
              : jewellerLoyaltyPointScreenController.loyaltyPointList.isEmpty
              ? Center(
              child: Text(
                'No Loyalty Points Records Found',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 12.sp,
                ),
              ),
          )
              : Container()
      ),
    );
  }
}
