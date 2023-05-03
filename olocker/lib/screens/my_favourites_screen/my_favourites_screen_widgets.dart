import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/screens/jeweller_jewellery_details_screen/jeweller_jewellery_details_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/my_favourites_controller.dart';
import '../../models/favourites_model/categorize_fav_products_model.dart';
import '../../models/favourites_model/favourites_model.dart';

class FavouritesCategoriesListModule extends StatelessWidget {
  FavouritesCategoriesListModule({Key? key}) : super(key: key);

  final favouritesController = Get.find<MyFavouritesScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      itemCount: favouritesController.categorizedProductsList.length,
      itemBuilder: (context, index) {
        var single = favouritesController.categorizedProductsList[index];
        return FavouriteProductsListModule(
          singleCatProduct: single,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 2.h);
      },
    );
  }
}

class FavouriteProductsListModule extends StatelessWidget {
  FavouriteProductsListModule({Key? key, required this.singleCatProduct})
      : super(key: key);

  final CategorizedProduct singleCatProduct;

  final favouritesController = Get.find<MyFavouritesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              singleCatProduct.itemTypeName,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 15.sp,
                color: AppColors.blackColor,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8),
            itemCount: singleCatProduct.favProductsList.length,
            itemBuilder: (context, index) {
              var singleProd = singleCatProduct.favProductsList[index];
              return FavouriteListItem(
                index: index,
                singleProd: singleProd,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class FavouriteListItem extends StatelessWidget {
  FavouriteListItem({
    Key? key,
    required this.index,
    required this.singleProd,
  }) : super(key: key);

  int index;
  final FavProduct singleProd;
  final favouritesController = Get.find<MyFavouritesScreenController>();

  @override
  Widget build(BuildContext context) {
    log("1111");
    log("single images:  ${ApiUrl.apiImagePath}${singleProd.productDetails.productImageList[0].imageLocation}");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: favouritesController.size.width * 0.81,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyTextColor,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: favouritesController.size.width * 0.12),
                    SizedBox(
                      width: favouritesController.size.width * 0.46,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            singleProd.productDetails.itemTypeName,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackTextColor,
                            ),
                          ),
                          SizedBox(height: 0.3.h),
                          Text(
                            "SKU Code: ${singleProd.productDetails.productSku}",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackTextColor,
                            ),
                          ),
                          SizedBox(height: 0.3.h),
                          singleProd.productDetails.price.toString() !=
                                  "PRICE ON REQUEST"
                              ? const SizedBox(height: 8)
                              : Text(
                                  singleProd.productDetails.price
                                          .toString()
                                          .contains("PRICE ON REQUEST")
                                      ? "PRICE ON REQUEST"
                                      : NumberFormat.currency(
                                          symbol: '₹ ',
                                          locale: "HI",
                                          decimalDigits: 2,
                                        ).format(
                                          double.parse(favouritesController
                                              .favouriteProductsList[index]
                                              .productDetails
                                              .price),
                                        ),
                                  // singleProd
                                  //     .productDetails.price,
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackTextColor,
                                  ),
                                ),
                          SizedBox(height: 0.3.h),
                          Text(
                            singleProd.partnerName,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackTextColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: favouritesController.size.height * 0.08,
              width: favouritesController.size.height * 0.08,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 8,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyTextColor,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(60),
                ),
                child: CachedNetworkImage(
                  imageUrl: singleProd.productDetails.productImageList.isEmpty
                      // : "${ApiUrl.apiImagePath}${singleProd.productDetails.productImageList[0].imageLocation.replaceAll(r'\', "/")}/${singleProd.productDetails.productImageList[0].imageName}",
                      ? "https://demo.olocker.in/images/ProductImages/2021/9/kdnl2428343_1.jpg"
                      : "${ApiUrl.apiImagePath}${singleProd.productDetails.productImageList[0].imageLocation.replaceAll(r'\', "/")}",
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Center(
                      child: Text(
                        "No Image",
                        style: TextStyle(
                          fontSize: 8.sp,
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Center(
                      child: Text(
                        "No Image",
                        style: TextStyle(
                          fontSize: 8.sp,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    favouritesController.deleteFavouriteProductFunction(
                      id: singleProd.id,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(
                      Icons.delete,
                      color: AppColors.redColor,
                    ),
                  ),
                ),
                SizedBox(height: favouritesController.size.height * 0.02),
                GestureDetector(
                  onTap: () {
                    log("singleProd.partnerSrNo :${singleProd.partnerSrNo}");
                    Get.to(
                      () => JewellerJewelleryDetailsScreen(),
                      arguments: [
                        singleProd.partnerSrNo.toString(),
                        singleProd.productDetails.srNo,
                        singleProd.productDetails.itemTypeName,
                        // index,
                      ],
                    );
                  },
                  child: Container(
                    height: favouritesController.size.height * 0.04,
                    width: favouritesController.size.width * 0.22,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: AppColors.accentColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColors.whiteColor,
                          size: 15.sp,
                        ),
                        SizedBox(width: 1.5.w),
                        Text(
                          "View",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            color: AppColors.whiteColor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyFavouritesJewelleryLoadingWidget extends StatelessWidget {
  MyFavouritesJewelleryLoadingWidget({Key? key}) : super(key: key);

  final screenController = Get.find<MyFavouritesScreenController>();

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
              const SizedBox(height: 10),
              Container(
                height: 18.h,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              Container(
                height: 18.h,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              Container(
                height: 18.h,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
