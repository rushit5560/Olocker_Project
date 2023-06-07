import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/online_deals_screen_controller.dart';
import 'package:olocker/models/home_screen_models/smart_deals_online_model.dart';
import 'package:olocker/screens/online_deals_list_screen/online_deals_list_screen.dart';
import 'package:olocker/screens/online_favourite_deals_screen/online_favourite_deals_screen.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/offline_deals_creen_controller.dart';
import '../../models/home_screen_models/smart_offline_deats_model.dart';

class OfflineDealsScreen extends StatelessWidget {
  OfflineDealsScreen({Key? key}) : super(key: key);
  final offlineDealsListScreenController = Get.put(OfflineDealsListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff052a47),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Text(
          'Offline Deals',
          style: TextStyleConfig.appbarTextStyle(),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => OnlineFavouriteDealsScreen());
            },
            icon: const Icon(
              Icons.favorite_border_rounded,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
      body: offlineDealsListScreenController.smartDealsOfflineList.isEmpty
          ? const Padding(
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Center(
          child: Text(
            "No Online Deals Available",
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
        ),
      )
          : GridView.builder(
        itemCount:
        offlineDealsListScreenController.smartDealsOfflineList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
        ),
        itemBuilder: (context, i) {
          VendorOfflineDealsList singleDeal =
          offlineDealsListScreenController.smartDealsOfflineList[i];
          return _onlineDealsGridTile(singleDeal);
        },
      ).commonAllSidePadding(10),
    );
  }

  Widget _onlineDealsGridTile(VendorOfflineDealsList singleDeal) {
    String imgUrl = "${ApiUrl.apiImagePath}${singleDeal.categoryImage}";
    return GestureDetector(
      onTap: () {
        Get.to(() => OnlineDealsListScreen(), arguments: singleDeal);
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
                    fontSize: 10.sp,
                    fontFamily: "Roboto",
                    color: AppColors.blueDarkColor,
                  ),
                ),
                SizedBox(
                    height: offlineDealsListScreenController.size.height * 0.0006.h),
                Text(
                  "${singleDeal.offLineDeals.length} Deals",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blueDarkColor,
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
