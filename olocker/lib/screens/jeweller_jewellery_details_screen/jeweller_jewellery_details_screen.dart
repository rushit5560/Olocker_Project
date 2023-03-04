import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/jeweller_jewellery_details_screen_controller.dart';
import 'package:olocker/controllers/my_favourites_controller.dart';
import 'package:olocker/screens/product_enquire_screen/product_enquire_screen.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:sizer/sizer.dart';

import '../jewellery_details_screen/jewellery_details_screen_widgets.dart';
import 'jeweller_jewellery_details_screen_widgets.dart';

class JewellerJewelleryDetailsScreen extends StatelessWidget {
  JewellerJewelleryDetailsScreen({Key? key}) : super(key: key);
  final jewellerJewelleryDetailsScreenController =
      Get.put(JewellerJewelleryDetailsScreenController());
  final myFavouritesController =
      Get.lazyPut(() => MyFavouritesScreenController());

  final myFavouritesScreenController = Get.find<MyFavouritesScreenController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        myFavouritesScreenController.getFavouriteProductsFunction();

        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: AppColors.blueDarkColor,
        appBar: AppBar(
          backgroundColor: AppColors.lightBrownBgColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
              myFavouritesScreenController.getFavouriteProductsFunction();
            },
            icon: const Icon(Icons.arrow_back_ios,
                color: AppColors.blackTextColor),
          ),
          title: Text(
            jewellerJewelleryDetailsScreenController.jewelleryTypeName,
                       style: TextStyleConfig.appbarTextStyle(),

          ),
        ),
        body: Obx(
          () => jewellerJewelleryDetailsScreenController.isLoading.value
              ? const JewelleryDetailsLoadingWidget()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(
                            AppImages.jewelleryProductBgShapeImage,
                            width: double.infinity,
                            height: jewellerJewelleryDetailsScreenController
                                    .size.height *
                                0.37,
                            fit: BoxFit.cover,
                          ),
                          jewellerJewelleryDetailsScreenController
                                  .productDetailsData.productimages!.isEmpty
                              ? Center(
                                  child: Text(
                                    "No Product Images Available",
                                    style: TextStyle(
                                      color: AppColors.blackTextColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : JewellerProductImagesSliderModule(),
                          JewellerFavouriteButtonModule(),
                          JewellerShareButtonModule(),
                        ],
                      ),
                      Column(
                        children: [
                          JewellerJewelleryApproxPriceModule(),
                          JewellerProductDescriptionModule(),
                          jewellerJewelleryDetailsScreenController
                                  .specialFeaturesList.isEmpty
                              ? const SizedBox()
                              : JewellerJewellerFeaturesAvailableModule(),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                jewellerJewelleryDetailsScreenController.size.width * 0.2,
            vertical: 2.h,
          ),
          child: SizedBox(
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(
                      () => ProductEnquireScreen(),
                      arguments: [
                        jewellerJewelleryDetailsScreenController.partnerSrNo,
                        jewellerJewelleryDetailsScreenController.productSrNo,
                        "",
                      ],
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.accentColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(28),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "enquire now".toUpperCase(),
                        style: TextStyle(
                          fontFamily: "Acephimere",
                          color: AppColors.whiteColor,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                /*Container(
                  decoration: const BoxDecoration(
                    color: AppColors.waGreenColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      jewelleryDetailsController.launchWhatsappChat(
                        mobileNumber: "+91",
                        msg:
                            "share this jewellery to a person https://example.com",
                      );
                    },
                    color: AppColors.whiteColor,
                    icon: Icon(
                      Icons.whatsapp_rounded,
                      size: 20.sp,
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
