import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/jeweller_details_screen_controller.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import 'jeweller_details_screen_widgets.dart';

class JewellerDetailsScreen extends StatelessWidget {
  JewellerDetailsScreen({Key? key}) : super(key: key);
  final jewellerDetailsScreenController =
      Get.put(JewellerDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
          const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        title: Text(
          '${jewellerDetailsScreenController.jewellerName}',
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mail_outline_rounded,
              color: AppColors.accentColor,
            ),
          ),
        ],
      ),
      body: Obx(
        ()=> jewellerDetailsScreenController.isLoading.value
          ? CommonLoader().showCircularLoader()
        : SingleChildScrollView(
          child: Column(
            children: [
              JewellerFeaturesModule(),
              jewellerDetailsScreenController.announcementOfferList.isEmpty
              ? Container() : JewellerBannerModule(),
              FourFunctionalModule(),
              JewelleryCategoryListModule(),
              // NecklaceBannerModule(),
              // BanglesBannerModule(),
              ReferAndJewellerEmiModule(),
              jewellerDetailsScreenController.womenTypeList.isEmpty
              ? Container()
              : MenWomenJewelleryListModule(
                headerName: "WOMEN'S JEWELLERY",
                headerBgColor: AppColors.darkPeachColor,
                bgImage: AppImages.womenJewelleryImage,
                typeList: jewellerDetailsScreenController.womenTypeList,
              ),

              jewellerDetailsScreenController.menTypeList.isEmpty
              ? Container()
              : MenWomenJewelleryListModule(
                headerName: "MEN'S JEWELLERY",
                headerBgColor: AppColors.darkCoffeeColor,
                bgImage: AppImages.menJewelleryImage,
                typeList: jewellerDetailsScreenController.menTypeList,
              ),

              jewellerDetailsScreenController.bestSellerList.isEmpty
              ? Container() : BestSellersListModule(),

              jewellerDetailsScreenController.clientTestimonialsList.isEmpty
              ? Container() : CustomerSpeakModule(),

              GoldPriceModule(),

              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
