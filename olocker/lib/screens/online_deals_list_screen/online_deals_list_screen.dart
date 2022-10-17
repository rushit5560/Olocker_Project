import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/online_deals_list_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import 'online_deals_list_screen_widgets.dart';

class OnlineDealsListScreen extends StatelessWidget {
  OnlineDealsListScreen({Key? key}) : super(key: key);
  final onlineDealsListScreenController =
      Get.put(OnlineDealsListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Text(
          onlineDealsListScreenController.singleDealList.category,
          style: const TextStyle(color: AppColors.blackColor),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
      ),
      body: Container(
        height: onlineDealsListScreenController.size.height,
        decoration: const BoxDecoration(color: Color(0xff052a47)),
        child: Stack(
          children: [
            PinkBackgroundImageModule(),

            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AllDealsHeaderModule(),
                  SizedBox(height: onlineDealsListScreenController.size.height * 0.001.h),
                  AllDealsListModule(),
                ],
              ).commonAllSidePadding(10),
            ).commonAllSidePadding(10),

          ],
        ),
      ),
    );
  }
}
