import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/my_jewellers_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';

import 'my_jewellers_screen_widgets.dart';

class MyJewellersScreen extends StatelessWidget {
  MyJewellersScreen({Key? key}) : super(key: key);
  final myJewellersScreenController = Get.put(MyJewellersScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
        title: const Text(
            'My Jewellers',
          style: TextStyle(
            color: AppColors.blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
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
          BackGroundModule(),

          Column(
            children: [
              BannerSliderModule(),

              Expanded(child: AllJewellersListModule().commonAllSidePadding(10)),
            ],
          ),
        ],
      ),
    );
  }
}
