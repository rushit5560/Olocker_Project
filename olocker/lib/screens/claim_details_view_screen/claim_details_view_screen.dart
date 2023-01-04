import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/screens/claim_details_view_screen/claim_details_view_screen_widgets.dart';

import 'package:sizer/sizer.dart';
import '../../constants/app_images.dart';
import '../../controllers/claim_details_view_screen_controller.dart';
import '../../widgets/common_loader.dart';

class ClaimDetailsScreen extends StatelessWidget {
  ClaimDetailsScreen({Key? key}) : super(key: key);

  final claimDetailsScreenController =
      Get.put(ClaimDetailsViewScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
        title: Text(
          'Claim Details',
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Obx(
        () => claimDetailsScreenController.isLoading.value
            ? ClaimDetailsLoadingWidget()
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.addRecordingsBgImage,
                      width: double.infinity,
                      height: claimDetailsScreenController.size.height -
                          (claimDetailsScreenController.size.height * 0.1),
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        claimDetailsScreenController.claimdata == null
                            ? Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                child: Text(
                                  "No Claim Data Available",
                                  style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            : YourClaimDetailsModule(),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
