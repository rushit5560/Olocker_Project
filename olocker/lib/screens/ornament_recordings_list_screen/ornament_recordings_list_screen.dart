import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/ornament_recordings_list_screen_controller.dart';
import 'package:olocker/models/home_screen_models/smart_deals_online_model.dart';
import 'package:olocker/screens/online_deals_list_screen/online_deals_list_screen.dart';
import 'package:olocker/screens/online_favourite_deals_screen/online_favourite_deals_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

class OrnamentRecordingsListScreen extends StatelessWidget {
  OrnamentRecordingsListScreen({Key? key}) : super(key: key);
  final ornamentRecordingsListScreenController =
      Get.put(OrnamentRecordingsListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        titleSpacing: 0,
        title: Text(
          'Ornament Recordings',
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppImages.ornamentBgShapeImage,
            ),
          ),
          Column(
            children: [],
          ).commonAllSidePadding(10),
        ],
      ),
    );
  }
}
