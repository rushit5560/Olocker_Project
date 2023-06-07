import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/online_deals_list_screen_controller.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/offline_deals_list_screen_controller.dart';
import 'offline_dealse_list_screen_widgets.dart';

class OfflineDealsListScreen extends StatelessWidget {
  OfflineDealsListScreen({Key? key}) : super(key: key);
  final offlineDealsListScreenController =
      Get.put(OfflineDealsListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Text(
          offlineDealsListScreenController.singleDealList.category,
          style: TextStyleConfig.appbarTextStyle(),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: Container(
        height: offlineDealsListScreenController.size.height,
        decoration: const BoxDecoration(color: Color(0xff052a47)),
        child: Stack(
          children: [
            // PinkBackgroundImageModule(),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AllOfflineDealsHeaderModule(),
                  SizedBox(
                    height:
                        offlineDealsListScreenController.size.height * 0.001.h,
                  ),
                  offlineDealsListScreenController
                          .singleDealList.offLineDeals.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 100),
                          child: Center(
                            child: Text(
                              "No Online Deals Available",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        )
                      : AllOfflineDealsListModule(),
                ],
              ).commonAllSidePadding(10),
            ).commonAllSidePadding(10),
          ],
        ),
      ),
    );
  }
}
