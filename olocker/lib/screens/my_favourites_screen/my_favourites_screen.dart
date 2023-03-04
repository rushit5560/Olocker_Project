import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/my_favourites_controller.dart';
import 'package:olocker/screens/my_inquiries_list_screen/my_inquiries_list_screen.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import 'my_favourites_screen_widgets.dart';

class MyFavouritesScreen extends StatelessWidget {
  MyFavouritesScreen({Key? key}) : super(key: key);

  final myFavouritesScreenController = Get.put(MyFavouritesScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueDarkColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => MyInquiriesListScreen(),
                arguments: [
                  myFavouritesScreenController.jewellerId,
                ],
              );
            },
            icon: const Icon(
              Icons.mail_outline_rounded,
              color: AppColors.accentColor,
            ),
          ),
        ],
        titleSpacing: 0,
        title: Text(
          'My Favourites',
          style: TextStyleConfig.appbarTextStyle(),
        ),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Obx(
        () => myFavouritesScreenController.isLoading.value
            ? MyFavouritesJewelleryLoadingWidget()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    myFavouritesScreenController.favouriteProductsList.isEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Center(
                              child: Text(
                                "No Favourite Jewellery Available",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        : FavouritesCategoriesListModule(),
                  ],
                ),
              ),
      ),
    );
  }
}
