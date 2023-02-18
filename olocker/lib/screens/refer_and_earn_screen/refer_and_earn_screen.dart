import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/screens/refer_and_earn_screen/refer_and_earn_screen_widgets.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/refer_and_earn_screen_controller.dart';

class ReferAndEarnScreen extends StatelessWidget {
  ReferAndEarnScreen({Key? key}) : super(key: key);

  final referAndEarnScreenController = Get.put(ReferAndEarnScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        titleSpacing: 0,
        title: Text(
          'Refer & Earn',
          style: TextStyle(
            fontFamily: "Acephimere",
            color: AppColors.greyColor,
            letterSpacing: 0.5,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Obx(
        () => referAndEarnScreenController.isLoading.value
            ? const ReferEarnLoadingWidget()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 2.h),
                    ReferAndEarnDetailsModule(),
                    SizedBox(height: 1.h),
                    ShareButtonModule(),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
      ),
    );
  }
}
