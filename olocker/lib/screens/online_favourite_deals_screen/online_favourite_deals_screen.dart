import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/online_favourite_deals_screen_controller.dart';
import 'package:olocker/models/online_favourite_deals_screen_model/get_favourite_deals_model.dart';
import 'package:olocker/screens/online_favourite_deals_list_screen/online_favourite_deals_list_screen.dart';
import 'package:olocker/screens/online_favourite_deals_screen/online_favourite_deals_screen_widgets.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

class OnlineFavouriteDealsScreen extends StatelessWidget {
  OnlineFavouriteDealsScreen({Key? key}) : super(key: key);
  final onlineFavouriteDealsScreenController =
      Get.put(OnlineFavouriteDealsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff052a47),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Text(
          'Favourite Deals',
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
      ),
      body: Obx(
        () => onlineFavouriteDealsScreenController.isLoading.value
            ? FavouritesDealsListLoadingWidget()
            : onlineFavouriteDealsScreenController.favouriteDealsList.isEmpty
                ? Center(
                    child: Text(
                      "No Favourite Deals Found",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : GridView.builder(
                    itemCount: onlineFavouriteDealsScreenController
                        .favouriteDealsList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 18,
                    ),
                    itemBuilder: (context, i) {
                      VendorDealsList1 singleDeal =
                          onlineFavouriteDealsScreenController
                              .favouriteDealsList[i];
                      return _onlineDealsGridTile(singleDeal);
                    },
                  ).commonAllSidePadding(10),
      ),
    );
  }

  Widget _onlineDealsGridTile(VendorDealsList1 singleDeal) {
    String imgUrl = singleDeal.categoryImage;
    return GestureDetector(
      onTap: () {
        Get.to(
          () => OnlineFavouriteDealsListScreen(),
          arguments: singleDeal,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  singleDeal.category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(
                    height: onlineFavouriteDealsScreenController.size.height *
                        0.0006.h),
                Text(
                  "${singleDeal.onLineDeals.length} Deals",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontFamily: "Roboto",
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ).commonAllSidePadding(8),
          ],
        ),
      ),
    );
  }
}
