import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/constants/enum.dart';
import 'package:olocker/controllers/jeweller_details_screen_controller.dart';
import 'package:olocker/models/jeweller_details_screen_model/best_seller_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/client_testimonials_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/jewellery_type_model.dart';
import 'package:olocker/screens/jeweller_feedback_screen/jeweller_feedback_screen.dart';
import 'package:olocker/screens/jeweller_jewellery_details_screen/jeweller_jewellery_details_screen.dart';
import 'package:olocker/screens/jeweller_jewellery_list_screen/jeweller_jewellery_list_screen.dart';
import 'package:olocker/screens/refer_and_earn_screen/refer_and_earn_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../models/jeweller_details_screen_model/announcement_offer_model.dart';
import '../about_us_screen/about_us_screen.dart';
import '../jeweller_loyalty_points_screen/jeweller_loyalty_points_screen.dart';
import '../my_favourites_screen/my_favourites_screen.dart';
import '../offers_jewellery_list_screen/offers_jewellery_list_screen.dart';
import '../saving_schemes_screens/saving_schemes_list_screen/saving_schemes_list_screen.dart';

class JewellerFeaturesModule extends StatelessWidget {
  JewellerFeaturesModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.greyTextColor.withOpacity(0.35),
          ),
          bottom: BorderSide(
            color: AppColors.greyTextColor.withOpacity(0.35),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: ApiUrl.apiImagePath +
                        screenController.specialFeaturesList[0].iconUrl,
                    color: AppColors.accentColor,
                    height: 20.sp,
                    width: 20.sp,
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Text(
                      screenController.specialFeaturesList[0].feature
                          .toString(),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: ApiUrl.apiImagePath +
                        screenController.specialFeaturesList[1].iconUrl,
                    color: AppColors.accentColor,
                    height: 20.sp,
                    width: 20.sp,
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Text(
                      screenController.specialFeaturesList[1].feature
                          .toString(),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: ApiUrl.apiImagePath +
                        screenController.specialFeaturesList[2].iconUrl,
                    color: AppColors.accentColor,
                    height: 20.sp,
                    width: 20.sp,
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Text(
                      screenController.specialFeaturesList[2].feature
                          .toString(),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 11),
                    ),
                  ),
                ],
              ),
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
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CarouselSlider.builder(
          itemCount: screenController.announcementOfferList.length,
          itemBuilder: (context, i, realIndex) {
            GetPushOfferItem oneOffer =
                screenController.announcementOfferList[i];
            return _imageModule(
              singleOffer: oneOffer,
            ) /*.commonSymmetricPadding(horizontal: 5)*/;
          },
          options: CarouselOptions(
            onPageChanged: ((index, reason) {
              screenController.bannerCurrentIndex.value = index;
            }),
            height: 240,
            autoPlay: true,
            viewportFraction: 1,
            // autoPlayAnimationDuration: const Duration(seconds: 10),
            autoPlayInterval: const Duration(seconds: 4),
          ),
        ).commonSymmetricPadding(vertical: 8),
        Obx(
          () => Padding(
            padding: const EdgeInsets.only(right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: screenController.announcementOfferList.map((url) {
                int index = screenController.announcementOfferList.indexOf(url);
                return Container(
                  width: screenController.bannerCurrentIndex.value == index
                      ? 16
                      : 11,
                  height: screenController.bannerCurrentIndex.value == index
                      ? 16
                      : 11,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width:
                            screenController.bannerCurrentIndex.value == index
                                ? 2
                                : 0,
                        color:
                            screenController.bannerCurrentIndex.value == index
                                ? AppColors.whiteColor
                                : Colors.transparent),
                    color: screenController.bannerCurrentIndex.value == index
                        ? AppColors.blueDarkColor
                        : AppColors.greyColor,
                  ),
                );
              }).toList(),
            ),
          ),
        ).commonOnlyPadding(right: 1.h),
      ],
    );
  }

  Widget _imageModule({required GetPushOfferItem singleOffer}) {
    String imgUrl = ApiUrl.apiImagePath + singleOffer.imageurl;
    return GestureDetector(
      onTap: () {
        if (singleOffer.isClickable == true) {
          Get.to(
            () => OffersJewelleryListScreen(),
            arguments: [
              singleOffer.srNo.split(".")[0],
              screenController.jewellerId.toString(),
              screenController.collectionNameList,
              SearchCategory.offerType,
            ],
          );
        }
      },
      child: SizedBox(
        // height: 25.h,
        // width: double.infinity,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        //   color: AppColors.greyTextColor,
        //   image: DecorationImage(
        //     image: NetworkImage(imgUrl),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) {
              return Image.asset(AppImages.noLogoImage);
            },
          ),
        ),
      ).commonSymmetricPadding(horizontal: 6),
    );
  }
}

class FourFunctionalModule extends StatelessWidget {
  FourFunctionalModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SizedBox(
        // height: screenController.size.height * 0.015.h,
        height: 80,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => MyFavouritesScreen(),
                    arguments: [
                      screenController.jewellerId.toString(),
                    ],
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      'My \nFavourites',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GestureDetector(
                onTap: () => Get.to(
                  () => JewellerLoyaltyPointScreen(),
                  arguments: [
                    screenController.jewellerName,
                  ],
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      'Loyalty \nPoints',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GestureDetector(
                onTap: () => Get.to(
                  () => AboutUsScreen(),
                  arguments: [
                    screenController.jewellerId,
                    screenController.jewellerName,
                  ],
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      'About us',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (screenController.isFeedbackValue.value == false) {
                    Get.to(
                      () => JewellerFeedbackScreen(),
                      arguments: screenController.jewellerId,
                    )!
                        .then((value) {
                      screenController.isLoading(true);
                      screenController.isLoading(false);
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: screenController.isFeedbackValue.value == false
                        ? AppColors.accentColor
                        : AppColors.accentColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      'Feedback',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewArrivalListModule extends StatelessWidget {
  NewArrivalListModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.newArrivalList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        String imgUrl =
            ApiUrl.apiMainUrl + screenController.newArrivalList[i].imageurl;
        return GestureDetector(
          onTap: () {
            Get.to(
              () => JewellerJewelleryListScreen(),
              arguments: [
                screenController.newArrivalList[i].name,
                screenController.newArrivalList[i].srNo.toString(),
                screenController.jewellerId.toString(),
                JewelleryListType.categoryId,
                screenController.collectionNameList,
                SearchCategory.collectionType,
              ],
            );
          },
          child: Container(
            // height: screenController.size.height * 0.027.h,
            height: 170,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.greyTextColor.withOpacity(0.5),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.fill,
              ),
            ),
          ).commonSymmetricPadding(horizontal: 5, vertical: 5),
        );
      },
    );
  }
}

class JewelleryFirstCategoryListModule extends StatelessWidget {
  JewelleryFirstCategoryListModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    log("screenController.jewelleryCategoryList.length111  ${screenController.jewelleryCategoryList.length}");
    return ListView.builder(
      itemCount: screenController.jewelleryCategoryList.length <= 2
          ? screenController.jewelleryCategoryList.length
          : 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        String imgUrl = ApiUrl.apiImagePath + screenController.jewelleryCategoryList[i].imageurl;
        return GestureDetector(
          onTap: () {
            Get.to(
              () => JewellerJewelleryListScreen(),
              arguments: [
                screenController.jewelleryCategoryList[i].name,
                screenController.jewelleryCategoryList[i].srNo.toString(),
                screenController.jewellerId.toString(),
                JewelleryListType.categoryId,
                screenController.collectionNameList,
                SearchCategory.categoryType,
              ],
            );
          },
          child: Container(
            height: 170,
            // height: screenController.size.height * 0.027.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.greyTextColor.withOpacity(0.5),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.fill,
              ),
            ),
          ).commonSymmetricPadding(horizontal: 5, vertical: 2),
        );
      },
    );
  }
}

class JewellerySubCategoryListModule extends StatelessWidget {
  JewellerySubCategoryListModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.jewellerysubCategoryList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        String imgUrl = ApiUrl.apiImagePath +
            screenController.jewellerysubCategoryList[i].imageurl;
        log("screenController.jewellerysubCategoryList.imgUrl 222222 $imgUrl");

        return GestureDetector(
          onTap: () {
            Get.to(
              () => JewellerJewelleryListScreen(),
              arguments: [
                screenController.jewellerysubCategoryList[i].name,
                screenController.jewellerysubCategoryList[i].srNo.toString(),
                screenController.jewellerId.toString(),
                JewelleryListType.categoryId,
                screenController.collectionNameList,
                SearchCategory.categoryType,
              ],
            );
          },
          child: imgUrl.isNotEmpty
              ? Container(
                  height: 170,

                  // height: screenController.size.height * 0.027.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.greyTextColor.withOpacity(0.5),
                    image: DecorationImage(
                      image: NetworkImage(imgUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ).commonSymmetricPadding(horizontal: 5, vertical: 2)
              : Container(),
        );
      },
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
          // height: screenController.size.height * 0.038.h,
          height: 230,

          width: double.infinity,
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
        Container(
          width: screenController.size.width,
          decoration: BoxDecoration(color: headerBgColor),
          child: Text(
            headerName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 21,
              fontFamily: "Brandregular",
              letterSpacing: 2,
            ),
          ).commonSymmetricPadding(vertical: 14),
        ),
      ],
    );
  }

  Widget _jewelleryListTile(ProductTypeItem singleItem) {
    String imgUrl = ApiUrl.apiImagePath + singleItem.image;
    return GestureDetector(
      onTap: () {
        Get.to(() => JewellerJewelleryListScreen(), arguments: [
          singleItem.name,
          singleItem.name,
          screenController.jewellerId.toString(),
          JewelleryListType.categoryName,
          screenController.collectionNameList,
          SearchCategory.productType,
        ]);
        // Get.to(()=> JewellerJewelleryListScreen(),
        //     arguments: [
        //       singleItem.name,
        //       singleItem.,
        //       screenController.jewellerId.toString(),
        //     ]);
      },
      child: Container(
        // height: screenController.size.height * 0.020.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.cover,
                errorWidget: (context, str, dyn) {
                  return Image.asset(
                    AppImages.noLogoImage,
                    fit: BoxFit.cover,
                  );
                },
              ).commonAllSidePadding(20),
            ),
            Expanded(
              flex: 2,
              child: Text(
                singleItem.name,
                style: TextStyle(fontSize: 12.sp, fontFamily: "Acephimere"),
              ),
            ),
          ],
        ),
      ),
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
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => ReferAndEarnScreen(),
                  arguments: [
                    screenController.jewellerId,
                  ],
                );
              },
              child: Container(
                // height: screenController.size.height * 0.036.h,
                height: 235,
                decoration: BoxDecoration(
                  color: AppColors.creamBgColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade700, blurRadius: 12.0),
                  ],
                  image: const DecorationImage(
                    image: AssetImage(AppImages.referOffer1Image),
                    fit: BoxFit.fill,
                  ),
                ),
              ).commonOnlyPadding(top: 10, bottom: 10, left: 14, right: 7),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => SavingSchemesListScreen(),
                  arguments: [
                    screenController.jewellerId,
                    screenController.jewellerName,
                  ],
                );
              },
              child: Container(
                // height: screenController.size.height * 0.036.h,
                height: 235,

                decoration: BoxDecoration(
                  color: AppColors.creamBgColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade700,
                      blurRadius: 12.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.referOffer2Image),
                    fit: BoxFit.fill,
                  ),
                ),
              ).commonOnlyPadding(top: 8, bottom: 8, right: 14, left: 7),
            ),
          ),
        ],
      ).commonSymmetricPadding(vertical: 5),
    );
  }
}

class BestSellersListModule extends StatelessWidget {
  BestSellersListModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    // log("screenController.bestSellerList.length: ${screenController.bestSellerList.length}");
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.bestSellerBgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "BEST SELLERS",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Acephimere",
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: 0.6,
            ),
          ).commonSymmetricPadding(vertical: 14),
          SizedBox(
            height: 220,
            child: GridView.builder(
              itemCount: screenController.bestSellerList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                childAspectRatio: 1.40,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                FavProductList singleItem = screenController.bestSellerList[i];
                String imgUrl = "";
                // if (singleItem.productImage.isNotEmpty) {
                imgUrl = "${ApiUrl.apiImagePath}${singleItem.productImage}";
                // }
                // String newImgUrl = imgUrl.replaceAll("\\", "/");
                return _bestSellerListTile(singleItem, imgUrl);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _bestSellerListTile(FavProductList singleItem, imgUrl) {
    log("imgUrl1212 : $imgUrl");
    return GestureDetector(
      onTap: () {
        log('singleItem.productsrno : ${singleItem.srNo}');
        Get.to(
          () => JewellerJewelleryDetailsScreen(),
          arguments: [
            screenController.jewellerId.toString(),
            singleItem.srNo,
            singleItem.itemName,
            singleItem.productImage,
            singleItem.productImage,
          ],
        );
      },
      child: Container(
        // height: screenController.size.height * 0.020.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 85,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  fit: BoxFit.cover,
                  // width: 18.w,
                  // height: 18.w,
                  errorWidget: (context, url, error) {
                    return Image.asset(
                      AppImages.noLogoImage,
                      fit: BoxFit.cover,
                      // width: 18.w,
                      // height: 18.w,
                    );
                  },
                ),
              ).commonOnlyPadding(bottom: 0),

              /*singleItem.productimages.isNotEmpty
                  ? CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.cover,
                // width: 18.w,
                // height: 18.w,
                errorWidget: (context, url, error) {
                  return Image.asset(
                    AppImages.noLogoImage,
                    fit: BoxFit.cover,
                    // width: 18.w,
                    // height: 18.w,
                  );
                },
              ).commonAllSidePadding(20)
                  : Image.asset(
                      AppImages.noLogoImage,
                      fit: BoxFit.cover,
                    ).commonAllSidePadding(20),*/
              /*child: CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.cover,
                errorWidget: (context, str, dyn) {
                  return Image.asset(
                    AppImages.noLogoImage,
                    fit: BoxFit.cover,
                  );
                },
              ).commonAllSidePadding(20),*/
            ),
            Expanded(
              flex: 15,
              child: Center(
                child: Text(
                  NumberFormat.currency(
                    symbol: '₹ ',
                    locale: "HI",
                    decimalDigits: 2,
                  ).format(double.parse(singleItem.productPrice)),
                  style: const TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerSpeakModule extends StatelessWidget {
  CustomerSpeakModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    log("screenController.clientTestimonialsList.length ${screenController.clientTestimonialsList.length}");
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.customerSpeakBgImage,
              width: double.infinity,
              height: 45,
              fit: BoxFit.fill,
            ),
            Center(
              child: Row(
                children: [
                  const Text(
                    "CUSTOMER'S SPEAK",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "latoregular",
                      color: AppColors.whiteColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.6,
                    ),
                  ).commonSymmetricPadding(horizontal: 8),
                ],
              ),
            ),
          ],
        ),
        screenController.clientTestimonialsList.length == 1
            ? SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: screenController.clientTestimonialsList.length,
                    itemBuilder: (context, i) {
                      Testimonial singleItem =
                          screenController.clientTestimonialsList[i];
                      return Container(
                        width: Get.width * 0.96,
                        // margin: const EdgeInsets.only( right: 15,),
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
                                  // height: screenController.size.width * 0.030.w,
                                  // width: screenController.size.width * 0.030.w,
                                  width: 45,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.whiteColor,
                                    // image: DecorationImage(
                                    //   image: NetworkImage(
                                    //       "${ApiUrl.apiImageUrlPath}/images/JewelleryApp/2020/5/9e926966718148acaedc690e4a55d5f8_1.png"), //   // AssetImage(AppImages.aboutTileBGImage),
                                    // ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "${ApiUrl.apiImagePath}/images/JewelleryApp/2020/5/9e926966718148acaedc690e4a55d5f8_1.png",
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) {
                                        return Image.asset(
                                          AppImages.noLogoImage,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 18),
                                Text(
                                  singleItem.clientName,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 17,
                                    fontFamily: "Acephimere",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  singleItem.testimonials,
                                  // maxLines: 3,
                                  textAlign: TextAlign.left,
                                  // overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 12.sp,
                                    fontFamily: "Acephimere",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ).commonSymmetricPadding(horizontal: 20, vertical: 15),
                      );
                    }).commonSymmetricPadding(vertical: 8, horizontal: 8),
              )
            : CarouselSlider.builder(
                itemCount: screenController.clientTestimonialsList.length,
                itemBuilder: (context, i, realIndex) {

                  Testimonial singleItem = screenController.clientTestimonialsList[i];
                  return _customerSpeakListTile(singleItem);
                },
                options: CarouselOptions(
                  // height: 150,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 4),
                ),
              ).commonSymmetricPadding(vertical: 8)
      ],
    );
  }

  Widget _customerSpeakListTile(Testimonial singleItem) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
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
                // height: screenController.size.width * 0.030.w,
                // width: screenController.size.width * 0.030.w,
                width: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteColor,
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //       "${ApiUrl.apiImageUrlPath}/images/JewelleryApp/2020/5/9e926966718148acaedc690e4a55d5f8_1.png"), //   // AssetImage(AppImages.aboutTileBGImage),
                  // ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: CachedNetworkImage(
                    imageUrl:
                        "${ApiUrl.apiImagePath}/images/JewelleryApp/2020/5/9e926966718148acaedc690e4a55d5f8_1.png",
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Image.asset(
                        AppImages.noLogoImage,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Text(
                singleItem.clientName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 17,
                  fontFamily: "Acephimere",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                singleItem.testimonials,
                // maxLines: 3,
                textAlign: TextAlign.left,
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 12.sp,
                  fontFamily: "Acephimere",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ).commonSymmetricPadding(horizontal: 20, vertical: 15),
    );
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
                // width: screenController.size.width * 0.020.w,
                // height: screenController.size.width * 0.020.w,
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              const Text(
                'Gold Price',
                style: TextStyle(
                  fontSize: 19,
                  color: AppColors.darkBlack,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Acephimere",
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          screenController.goldPriceList.isEmpty
              ? Container()
              : GridView.builder(
                  itemCount: 3,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
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
                            ).commonOnlyPadding(
                                top: 10, bottom: 35, left: 25, right: 25),
                          ),
                          Text(
                            i == 0
                                ? screenController.goldPrice1 == "0"
                                    ? "--"
                                    : NumberFormat.currency(
                                        symbol: '₹ ',
                                        locale: "HI",
                                        decimalDigits: 0,
                                      ).format(double.parse(
                                        screenController.goldPrice1))
                                : i == 1
                                    ? screenController.goldPrice2 == "0"
                                        ? "--"
                                        : NumberFormat.currency(
                                            symbol: '₹ ',
                                            locale: "HI",
                                            decimalDigits: 0,
                                          ).format(double.parse(
                                            screenController.goldPrice2))
                                    : screenController.goldPrice3 == "0"
                                        ? "--"
                                        : NumberFormat.currency(
                                            symbol: '₹ ',
                                            locale: "HI",
                                            decimalDigits: 0,
                                          ).format(double.parse(
                                            screenController.goldPrice3)),
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              fontFamily: "Roboto",
                            ),
                          ).commonOnlyPadding(
                              left: 7, right: 7, top: 7, bottom: 12)
                        ],
                      ),
                    );
                  },
                ).commonSymmetricPadding(vertical: 15),
        ],
      ),
    ).commonSymmetricPadding(vertical: 10, horizontal: 12);
  }
}

class JewellerDetailsLoadingShimmer extends StatelessWidget {
  JewellerDetailsLoadingShimmer({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade50,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.greyTextColor.withOpacity(0.35),
                    ),
                    bottom: BorderSide(
                      color: AppColors.greyTextColor.withOpacity(0.35),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.greyColor,
                                shape: BoxShape.circle,
                              ),
                              height: 20.sp,
                              width: 20.sp,
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: Container(
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: AppColors.greyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.greyColor,
                                shape: BoxShape.circle,
                              ),
                              height: 20.sp,
                              width: 20.sp,
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: Container(
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: AppColors.greyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.greyColor,
                                shape: BoxShape.circle,
                              ),
                              height: 20.sp,
                              width: 20.sp,
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: Container(
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: AppColors.greyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ).commonAllSidePadding(10),
              ),
              Container(
                height: 28.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.greyColor,
                ),
              ).commonSymmetricPadding(horizontal: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: SizedBox(
                  height: screenController.size.height * 0.015.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.greyColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.greyColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.greyColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.greyColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Container(
                    height: screenController.size.height * 0.023.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greyColor,
                    ),
                  ).commonSymmetricPadding(horizontal: 5, vertical: 5);
                },
              ),
            ],
          ),
        ),
      ),
    ).commonOnlyPadding(top: 20);
  }
}
