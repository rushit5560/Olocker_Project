import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/online_favourite_deals_list_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import 'online_favourite_deals_list_screen_widgets.dart';

class OnlineFavouriteDealsListScreen extends StatelessWidget {
  OnlineFavouriteDealsListScreen({Key? key}) : super(key: key);
  final onlineFavouriteDealsListScreenController =
      Get.put(OnlineFavouriteDealsListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Text(
          onlineFavouriteDealsListScreenController.singleDealList.category,
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
      ),
      body: Container(
        height: onlineFavouriteDealsListScreenController.size.height,
        decoration: const BoxDecoration(color: Color(0xff052a47)),
        child: Stack(
          children: [
            FavPinkBackgroundImageModule(),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FavAllDealsHeaderModule(),
                  SizedBox(
                      height:
                          onlineFavouriteDealsListScreenController.size.height *
                              0.001.h),
                  AllFavDealsListModule(),
                ],
              ).commonAllSidePadding(10),
            ).commonAllSidePadding(10),
          ],
        ),
      ),
    );
  }
}
