import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/offers_jewellery_list_screen_controller.dart';
import 'package:olocker/screens/my_favourites_screen/my_favourites_screen.dart';
import 'package:olocker/screens/my_inquiries_list_screen/my_inquiries_list_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../jeweller_jewellery_list_screen/jeweller_jewellery_list_screen_widgets.dart';
import 'offers_jewellery_list_screen_widgets.dart';
// import 'package:sliding_switch/sliding_switch.dart';

class OffersJewelleryListScreen extends StatelessWidget {
  OffersJewelleryListScreen({Key? key}) : super(key: key);
  final offersJewelleryListScreenController =
      Get.put(OffersJewelleryListScreenController());

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
        title: Obx(
          () => offersJewelleryListScreenController.isLoading.value
              ? Container()
              : Text(
                  offersJewelleryListScreenController
                      .offerDetailResultModeldata!.offerType,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackTextColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
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
          Obx(
            () => offersJewelleryListScreenController.isLoading.value
                ? Container()
                : IconButton(
                    onPressed: () {
                      Get.to(
                        () => MyFavouritesScreen(),
                        arguments: [
                          offersJewelleryListScreenController.jewellerId
                              .toString(),
                        ],
                      );
                    },
                    icon: const Icon(
                      Icons.favorite_outline_rounded,
                      color: AppColors.greyColor,
                    ),
                  ),
          ),
          Obx(
            () => offersJewelleryListScreenController.isLoading.value
                ? Container()
                : IconButton(
                    onPressed: () {
                      Get.to(
                        () => MyInquiriesListScreen(),
                        arguments: [
                          offersJewelleryListScreenController.jewellerId
                              .toString(),
                        ],
                      );
                    },
                    icon: const Icon(
                      Icons.mail_outline_rounded,
                      color: AppColors.greyColor,
                    ),
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
                    height: 18.sp,
                  ),
                  const Text(
                    'SORT BT PRICE',
                  ),
                ],
              ),
              Obx(
                () => FlutterToggleTab(
                  height: 5.h,
                  width: 10.w,
                  marginSelected: const EdgeInsets.all(3),
                  borderRadius: 28,
                  selectedIndex: offersJewelleryListScreenController
                      .selectedSortingIndex.value,
                  unSelectedBackgroundColors: const [
                    AppColors.greenColor,
                  ],
                  selectedBackgroundColors: const [
                    AppColors.whiteColor,
                  ],
                  selectedTextStyle: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                    color: AppColors.greenColor,
                  ),
                  unSelectedTextStyle: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteColor,
                  ),
                  labels: const [
                    "LOW",
                    "HIGH",
                  ],
                  selectedLabelIndex: (index) {
                    offersJewelleryListScreenController.isLoading(true);
                    offersJewelleryListScreenController
                        .selectedSortingIndex.value = index;
                    offersJewelleryListScreenController.isLoading(false);
                    log('selected sorting index :: ${offersJewelleryListScreenController.selectedSortingIndex.value}');

                    offersJewelleryListScreenController.changeSortOption();
                  },
                ),
              ),
            ],
          ).commonOnlyPadding(bottom: 5, left: 10),
        ),
      ),
      body: Obx(
        () => offersJewelleryListScreenController.isLoading.value
            ? const JewelleryListScreenLoadingWidget()
            : offersJewelleryListScreenController.jewelleryList.isEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Center(
                      child: Text(
                        "No Jewellery Found",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                : OfferJewelleryGridviewModule(),
      ),
    );
  }
}
