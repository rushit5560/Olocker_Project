import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/screens/product_enquire_screen/product_enquire_screen.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/jewellery_details_screen_controller.dart';
import 'jewellery_details_screen_widgets.dart';

class JewelleryDetailsScreen extends StatelessWidget {
  JewelleryDetailsScreen({Key? key}) : super(key: key);
  final jewelleryDetailsController =
      Get.put(JewelleryDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueDarkColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightBrownBgColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackTextColor,
          ),
        ),
        title: Text(
          '${jewelleryDetailsController.jewelleryTypeName}',
          textAlign: TextAlign.center,
          style: TextStyleConfig.appbarTextStyle(),
        ),
      ),
      body: Obx(
        () => jewelleryDetailsController.isLoading.value
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
                          height: jewelleryDetailsController.size.height * 0.37,
                          fit: BoxFit.cover,
                        ),
                        jewelleryDetailsController
                                .productDetailsData.productImageList.isEmpty
                            ? Center(
                                child: Text(
                                  "No Product Images Available",
                                  style: TextStyle(
                                      color: AppColors.blackTextColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Acephimere"),
                                ),
                              )
                            : ProductImagesSliderModule(),
                        FavouriteButtonModule(),
                        ShareButtonModule(),
                      ],
                    ),
                    Column(
                      children: [
                        JewelleryApproxPriceModule(),
                        ProductDescriptionModule(),
                        jewelleryDetailsController.specialFeaturesList.isEmpty
                            ? const SizedBox()
                            : JewellerFeaturesAvailableModule(),
                      ],
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: jewelleryDetailsController.size.width * 0.2,
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
                      jewelleryDetailsController.partnerSrNo,
                      jewelleryDetailsController.productSrNo,
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
                        color: AppColors.whiteColor,
                        fontSize: 13.sp,
                        fontFamily: "Acephimere",
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
    );
  }
}
