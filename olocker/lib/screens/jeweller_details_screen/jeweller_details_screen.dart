import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/jeweller_details_screen_controller.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:olocker/utils/extensions.dart';
import '../my_inquiries_list_screen/my_inquiries_list_screen.dart';
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
          style: TextStyleConfig.appbarTextStyle(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => MyInquiriesListScreen(),
                arguments: [
                  jewellerDetailsScreenController.jewellerId,
                ],
              );
            },
            icon: const Icon(
              Icons.mail_outline_rounded,
              color: AppColors.accentColor,
            ),
          ),
        ],
      ),
      body: Obx(
        () => /*jewellerDetailsScreenController.isSpecialFeaturesLoading.value  ||
                jewellerDetailsScreenController.isAnnouncementOfferLoading.value  ||
                jewellerDetailsScreenController.isJewelleryPushToAppDataLoading.value  ||
                jewellerDetailsScreenController.isJewelleryTypeLoading.value  ||
                jewellerDetailsScreenController.isBestSellerLoading.value  ||
                jewellerDetailsScreenController.isTestimonialLoading.value  ||
                jewellerDetailsScreenController.isGoldPriceLoading.value  ||
                jewellerDetailsScreenController.isAboutYourSelfLoading.value  ||*/
            jewellerDetailsScreenController.isLoading.value
                ? JewellerDetailsLoadingShimmer()
                : SingleChildScrollView(
                    controller:
                        jewellerDetailsScreenController.scrollController,
                    child: Column(
                      children: [
                        jewellerDetailsScreenController
                                .specialFeaturesList.isEmpty
                            ? Container()
                            : JewellerFeaturesModule(),

                        jewellerDetailsScreenController
                                .announcementOfferList.isEmpty
                            ? Container()
                            : JewellerBannerModule(),

                        FourFunctionalModule(),
                        // JewelleryFirstCategoryListModule(),
                        jewellerDetailsScreenController
                                .jewelleryCategoryList.isNotEmpty
                            ? JewelleryFirstCategoryListModule()
                            : Container(),
                        ReferAndJewellerEmiModule(),
                        jewellerDetailsScreenController
                                .jewellerysubCategoryList.isNotEmpty
                            ? JewellerySubCategoryListModule()
                            : Container(),

                        /// Below all module in 2nd phase
                        Column(
                          children: [
                            jewellerDetailsScreenController
                                    .newArrivalList.isEmpty
                                ? Container()
                                : NewArrivalListModule(),
                            jewellerDetailsScreenController
                                    .womenTypeList.isEmpty
                                ? Container()
                                : MenWomenJewelleryListModule(
                                    headerName: "WOMEN'S JEWELLERY",
                                    headerBgColor: AppColors.darkPeachColor,
                                    bgImage: AppImages.womenJewelleryImage,
                                    typeList: jewellerDetailsScreenController
                                        .womenTypeList,
                                  ),
                            jewellerDetailsScreenController.menTypeList.isEmpty
                                ? Container()
                                : MenWomenJewelleryListModule(
                                    headerName: "MEN'S JEWELLERY",
                                    headerBgColor: AppColors.darkCoffeeColor,
                                    bgImage: AppImages.menJewelleryImage,
                                    typeList: jewellerDetailsScreenController
                                        .menTypeList,
                                  ),
                            jewellerDetailsScreenController.kidsTypeList.isEmpty
                                ? Container()
                                : MenWomenJewelleryListModule(
                                    headerName: "KID'S JEWELLERY",
                                    headerBgColor:
                                        AppColors.lightNewCoffeeColor,
                                    bgImage: AppImages.kidsJewelleryImage,
                                    typeList: jewellerDetailsScreenController
                                        .kidsTypeList,
                                  ),
                            jewellerDetailsScreenController
                                    .bestSellerList.isEmpty
                                ? Container()
                                : BestSellersListModule(),
                            jewellerDetailsScreenController
                                    .clientTestimonialsList.isEmpty
                                ? Container()
                                : CustomerSpeakModule(),
                            jewellerDetailsScreenController
                                    .goldPriceList.isEmpty
                                ? Container()
                                : GoldPriceModule(),
                          ],
                        ),
                        jewellerDetailsScreenController.hasMore.value
                            // ? JewellerDetailsLoadingShimmer()
                            ? const CircularProgressIndicator()
                                .commonAllSidePadding(15)
                            : Container(),
                        // const SizedBox(height: 20),
                      ],
                    ),
                  ),
      ),
    );
  }
}
