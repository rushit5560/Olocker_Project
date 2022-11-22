import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/my_favourites_controller.dart';
import 'package:olocker/widgets/common_loader.dart';
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
        titleSpacing: 0,
        title: Text(
          'My Favourites',
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Obx(
        () => myFavouritesScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    myFavouritesScreenController.favouriteProductsList.isEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Center(
                              child: Text(
                                "No Favourite Products Available",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        : FavouritesListModule(),
                  ],
                ),
              ),
      ),
    );
  }
}
