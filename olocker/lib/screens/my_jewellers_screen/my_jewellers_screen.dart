import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/my_jewellers_screen_controller.dart';
import 'package:olocker/utils/appbar_style.dart';
import '../my_favourites_screen/my_favourites_screen.dart';
import 'my_jewellers_screen_widgets.dart';

class MyJewellersScreen extends StatelessWidget {
  MyJewellersScreen({Key? key}) : super(key: key);
  final myJewellersScreenController = Get.put(MyJewellersScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBrownBgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        titleSpacing: 0,
        title: Text(
          'My Jewellers',
          style: TextStyleConfig.appbarTextStyle(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => MyFavouritesScreen(),
                arguments: [myJewellersScreenController.activeIndex.toString()],
              );
            },
            icon: const Icon(
              Icons.favorite_border_rounded,
              color: AppColors.greyColor,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Stack(
        children: [
          // const BackGroundModule(),
          Column(
            children: [
              myJewellersScreenController.bannerList.isEmpty
                  ? Container()
                  : BannerSliderModule(),
              myJewellersScreenController.allJewellersList.isEmpty
                  ? Container()
                  : Expanded(
                      child: AllJewellersListModule(),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
