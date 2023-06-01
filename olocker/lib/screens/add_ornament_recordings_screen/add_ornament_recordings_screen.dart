import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/utils/appbar_style.dart';
import '../../controllers/add_ornament_recordings_screen_controller.dart';
import 'add_ornament_recordings_screen_widgets.dart';

class AddOrnamentRecordingsScreen extends StatelessWidget {
  AddOrnamentRecordingsScreen({Key? key}) : super(key: key);
  final addOrnamentRecordingsController =
      Get.put(AddOrnamentRecordingsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBrownBgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        titleSpacing: 0,
        title: Text(
          'Add Ornament Recording',
          style: TextStyleConfig.appbarTextStyle(),
        ),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Obx(
        () => addOrnamentRecordingsController.isLoading.value
            ? AddRecordingsLoadingWidget()
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.addRecordingsBgImage,
                      width: addOrnamentRecordingsController.size.width,
                      height: addOrnamentRecordingsController.size.height -
                          (addOrnamentRecordingsController.size.height * 0.1),
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: const [
                        SizedBox(height: 10),
                        AddRecordingDetailsFormModule(),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
