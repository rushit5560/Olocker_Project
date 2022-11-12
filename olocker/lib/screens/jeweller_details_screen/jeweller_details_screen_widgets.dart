import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/jeweller_details_screen_controller.dart';
import 'package:olocker/models/jeweller_details_screen_model/best_seller_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/client_testimonials_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/jewellery_type_model.dart';
import 'package:olocker/screens/jeweller_feedback_screen/jeweller_feedback_screen.dart';
import 'package:olocker/screens/jeweller_loyalty_point_screen/jeweller_loyalty_point_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

class JewellerFeaturesModule extends StatelessWidget {
  JewellerFeaturesModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              screenController.specialFeaturesList[0].feature.toString(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 10.sp),
            ),
          ),
          Expanded(
            child: Text(
              screenController.specialFeaturesList[1].feature.toString(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 10.sp),
            ),
          ),
          Expanded(
            child: Text(
              screenController.specialFeaturesList[2].feature.toString(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 10.sp),
            ),
          ),
        ],
      ).commonAllSidePadding(10),
    );
  }
}

class JewellerBannerModule extends StatelessWidget {
  JewellerBannerModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: screenController.announcementOfferList.length,
      itemBuilder: (context, i, realIndex) {
        String imgUrl = ApiUrl.apiMainPath +
            screenController.announcementOfferList[i].imageurl;
        return _imageModule(imgUrl) /*.commonSymmetricPadding(horizontal: 5)*/;
      },
      options: CarouselOptions(
        height: screenController.size.height * 0.040.h,
        autoPlay: true,
        viewportFraction: 1,
        // autoPlayAnimationDuration: const Duration(seconds: 10),
        autoPlayInterval: const Duration(seconds: 10),
      ),
    ).commonSymmetricPadding(vertical: 8);
  }

  Widget _imageModule(String imgUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
      ),
    ).commonSymmetricPadding(horizontal: 5);
  }
}

class FourFunctionalModule extends StatelessWidget {
  FourFunctionalModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: screenController.size.height * 0.015.h,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'My \nFavourite',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ).commonAllSidePadding(5),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => Get.to(()=>
                    JewellerLoyaltyPointScreen(),
                    transition: Transition.zoom),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'Loyalty \nPoints',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ).commonAllSidePadding(5),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'About us',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ).commonAllSidePadding(5),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => Get.to(()=>
                    JewellerFeedbackScreen(),
                    arguments: screenController.jewellerId,
                    transition: Transition.zoom),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'Feedback',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ).commonAllSidePadding(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JewelleryCategoryListModule extends StatelessWidget {
  JewelleryCategoryListModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.jewelleryCategoryList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        String imgUrl = ApiUrl.apiMainPath +
            screenController.jewelleryCategoryList[i].imageurl;
        return Container(
          height: screenController.size.height * 0.023.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
            image:
                DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
          ),
        ).commonSymmetricPadding(horizontal: 5, vertical: 5);
      },
    );
  }
}

class ReferAndJewellerEmiModule extends StatelessWidget {
  ReferAndJewellerEmiModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.referOfferBgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: screenController.size.height * 0.033.h,
              decoration: BoxDecoration(
                color: AppColors.creamBgColor,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage(AppImages.referOffer1Image),
                  fit: BoxFit.cover,
                ),
              ),
            ).commonSymmetricPadding(vertical: 8, horizontal: 14),
          ),
          Expanded(
            child: Container(
              height: screenController.size.height * 0.033.h,
              decoration: BoxDecoration(
                color: AppColors.creamBgColor,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage(AppImages.referOffer2Image),
                  fit: BoxFit.cover,
                ),
              ),
            ).commonSymmetricPadding(vertical: 8, horizontal: 14),
          ),
        ],
      ),
    );
  }
}

class MenWomenJewelleryListModule extends StatelessWidget {
  final String headerName;
  final Color headerBgColor;
  final String bgImage;
  final List<ProductTypeItem> typeList;

  MenWomenJewelleryListModule({
    Key? key,
    required this.headerName,
    required this.headerBgColor,
    required this.bgImage,
    required this.typeList,
  }) : super(key: key);

  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenController.size.width,
          decoration: BoxDecoration(color: headerBgColor),
          child: Text(
            headerName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ).commonSymmetricPadding(vertical: 10),
        ),
        Container(
          height: screenController.size.height * 0.035.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.fill,
            ),
          ),
          child: GridView.builder(
            itemCount: typeList.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              // crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.30,
            ),
            scrollDirection: Axis.horizontal,
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              ProductTypeItem singleItem = typeList[i];
              return i == 0 ? Container() : _jewelleryListTile(singleItem);
            },
          ).commonSymmetricPadding(vertical: 10),
        ),
      ],
    );
  }

  Widget _jewelleryListTile(ProductTypeItem singleItem) {
    String imgUrl = ApiUrl.apiImagePath + singleItem.image;
    return Container(
      // height: screenController.size.height * 0.020.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ).commonAllSidePadding(20),
          ),
          Expanded(
            flex: 2,
            child: Text(
              singleItem.name,
              style: TextStyle(
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellersListModule extends StatelessWidget {
  BestSellersListModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenController.size.height * 0.042.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.bestSellerBgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text(
            "BEST SELLERS",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ).commonSymmetricPadding(vertical: 12),
          SizedBox(
            height: screenController.size.height * 0.030.h,
            child: GridView.builder(
              itemCount: screenController.bestSellerList.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                // crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.30,
              ),
              scrollDirection: Axis.horizontal,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                ListOfProduct singleItem = screenController.bestSellerList[i];
                return _bestSellerListTile(singleItem);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _bestSellerListTile(ListOfProduct singleItem) {
    // String imgUrl = ApiUrl.apiImagePath + singleItem.productimages[0].imageLocation;
    // log('imgUrl111 : $imgUrl');

    return Container(
      // height: screenController.size.height * 0.020.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
                    /*decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imgUrl.trim()),
                  fit: BoxFit.cover,
                ),
              ),*/
                    )
                .commonAllSidePadding(20),
          ),
          Expanded(
            flex: 2,
            child: Text(
              NumberFormat.currency(
                symbol: '₹ ',
                locale: "HI",
                decimalDigits: 2,
              ).format(double.parse(singleItem.price)),
              style: TextStyle(
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomerSpeakModule extends StatelessWidget {
  CustomerSpeakModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.customerSpeakBgImage,
              width: double.infinity,
              height: 35,
              fit: BoxFit.fill,
            ),
            Center(
              child: Row(
                children: [
                  Text(
                    "CUSTOMER'S SPEAK",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ).commonSymmetricPadding(horizontal: 8),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenController.size.height * 0.022.h,
          child: GridView.builder(
            itemCount: screenController.clientTestimonialsList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              childAspectRatio: 0.38,
            ),
            itemBuilder: (context, i) {
              Testimonial singleItem =
                  screenController.clientTestimonialsList[i];
              return _customerSpeakListTile(singleItem);
            },
          ),
        ).commonSymmetricPadding(vertical: 8),
      ],
    );
  }

  Widget _customerSpeakListTile(Testimonial singleItem) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lightCoffeeColor,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenController.size.width * 0.030.w,
                width: screenController.size.width * 0.030.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteColor,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                singleItem.clientName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                singleItem.testimonials,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ),
        ],
      ).commonSymmetricPadding(horizontal: 10, vertical: 5),
    ).commonSymmetricPadding(horizontal: 5);
  }
}

class GoldPriceModule extends StatelessWidget {
  GoldPriceModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: screenController.size.height * 0.035.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                AppImages.goldNameIconImage,
                width: screenController.size.width * 0.020.w,
                height: screenController.size.width * 0.020.w,
              ),
              const SizedBox(width: 10),
              Text(
                'Gold Price',
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          GridView.builder(
            itemCount: 3,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              childAspectRatio: 0.9,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.goldColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              screenController.goldCaratImagesList[i],
                            ),
                            // fit: BoxFit.fill,
                          ),
                        ),
                      ).commonSymmetricPadding(vertical: 20, horizontal: 30),
                    ),
                    Text(
                      i == 0
                          ? NumberFormat.currency(
                              symbol: '₹ ',
                              locale: "HI",
                              decimalDigits: 0,
                            ).format(double.parse(screenController.goldPrice1))
                          : i == 1
                              ? NumberFormat.currency(
                                  symbol: '₹ ',
                                  locale: "HI",
                                  decimalDigits: 0,
                                ).format(
                                  double.parse(screenController.goldPrice2))
                              : NumberFormat.currency(
                                  symbol: '₹ ',
                                  locale: "HI",
                                  decimalDigits: 0,
                                ).format(
                                  double.parse(screenController.goldPrice3)),
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ).commonAllSidePadding(5),
                  ],
                ),
              );
            },
          ).commonSymmetricPadding(vertical: 15),

          /*  Row(
            children: [

              Expanded(
                child: Container(
                  height: screenController.size.height * 0.025.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.goldColor,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(AppImages.goldIcon24Image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).commonAllSidePadding(20),
                      ),

                      Expanded(
                        flex: 3,
                        child: Text(
                          NumberFormat.currency(
                            symbol: '₹ ',
                            locale: "HI",
                            decimalDigits: 2,
                          ).format(double.parse(screenController.goldPrice1)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ).commonAllSidePadding(5),

              Expanded(
                child: Container(
                  height: screenController.size.height * 0.03.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.goldColor,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.goldIcon22Image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 3,
                        child: Text(
                          NumberFormat.currency(
                            symbol: '₹ ',
                            locale: "HI",
                            decimalDigits: 2,
                          ).format(double.parse(screenController.goldPrice2)),
                        ),
                      ),
                    ],
                  ),
                ),
              ).commonAllSidePadding(5),

              Expanded(
                child: Container(
                  height: screenController.size.height * 0.03.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.goldColor,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.goldIcon18Image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 3,
                        child: Text(
                          NumberFormat.currency(
                            symbol: '₹ ',
                            locale: "HI",
                            decimalDigits: 2,
                          ).format(double.parse(screenController.goldPrice3)),
                        ),
                      ),
                    ],
                  ),
                ),
              ).commonAllSidePadding(5),

            ],
          ),*/
        ],
      ),
    ).commonSymmetricPadding(vertical: 10, horizontal: 5);
  }
}
