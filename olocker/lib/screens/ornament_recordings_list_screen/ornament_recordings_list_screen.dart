import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/ornament_recordings_list_screen_controller.dart';
import 'package:olocker/screens/ornament_recordings_list_screen/ornament_recordings_list_screen_widgets.dart';
import 'package:olocker/utils/appbar_style.dart';
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
          style: TextStyleConfig.appbarTextStyle(),
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
          Obx(
            () => ornamentRecordingsListScreenController.isLoading.value
                ? const OrnamentRecordingsListLoadingWidget()
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrnamentDetailsModule(),
                          const SizedBox(height: 20),
                          AddRecordingButton(),
                          const SizedBox(height: 20),
                          ornamentRecordingsListScreenController
                                  .ornamentHistoryDetailList.isEmpty
                              ? const SizedBox()
                              : OrnamentRecordingDetailsList(),
                        ],
                      ).commonAllSidePadding(10),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
