import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/jeweller_jewellery_list_screen_controller.dart';
import 'package:olocker/screens/my_favourites_screen/my_favourites_screen.dart';
import 'package:olocker/screens/my_inquiries_list_screen/my_inquiries_list_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';
import 'package:sliding_switch/sliding_switch.dart';

import 'jeweller_jewellery_list_screen_widgets.dart';

class JewellerJewelleryListScreen extends StatelessWidget {
  JewellerJewelleryListScreen({Key? key}) : super(key: key);
  final jewellerJewelleryListScreenController =
      Get.put(JewellerJewelleryListScreenController());

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
          jewellerJewelleryListScreenController.jewelleryName,
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          /*IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
              color: AppColors.greyColor,
            ),
          ),*/
          IconButton(
            onPressed: () {
              Get.to(
                () => MyFavouritesScreen(),
                arguments: [
                  jewellerJewelleryListScreenController.jewellerId.toString(),
                ],
              );
            },
            icon: const Icon(
              Icons.favorite_outline_rounded,
              color: AppColors.greyColor,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(
                    () => MyInquiriesListScreen(),
                arguments: [
                  jewellerJewelleryListScreenController.jewellerId.toString(),
                ],
              );
            },
            icon: const Icon(
              Icons.mail_outline_rounded,
              color: AppColors.greyColor,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppIcons.filterIcon,
                    height: 26,
                  ),
                  const Text(
                    'SORT BT PRICE',
                  ),
                ],
              ),
              SlidingSwitch(
                value:
                    jewellerJewelleryListScreenController.sortPriceValue.value,
                width:
                    jewellerJewelleryListScreenController.size.width * 0.11.w,
                height: 40,
                onChanged: (bool value) {
                  jewellerJewelleryListScreenController.sortPriceValue.value =
                      !jewellerJewelleryListScreenController
                          .sortPriceValue.value;
                  log('sortPriceValue :${jewellerJewelleryListScreenController.sortPriceValue.value}');
                },
                onSwipe: () {},
                onDoubleTap: () {},
                onTap: () {},
                textOff: 'LOW',
                textOn: 'HIGH',
                background: AppColors.greenColor,
                contentSize: 15,
                colorOff: AppColors.greenColor,
                colorOn: AppColors.greenColor,
                inactiveColor: AppColors.whiteColor,
                buttonColor: AppColors.whiteColor,
              ).commonOnlyPadding(right: 10),
            ],
          ).commonOnlyPadding(bottom: 5),
        ),
      ),
      body: Obx(
        () => jewellerJewelleryListScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : JewelleryGridviewModule(),
      ),
    );
  }
}
