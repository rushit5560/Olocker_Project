import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/my_inquiries_list_screen_controller.dart';
import 'my_inquiries_list_screen_widgets.dart';

class MyInquiriesListScreen extends StatelessWidget {
  MyInquiriesListScreen({Key? key}) : super(key: key);
  final myInquiriesListScreenController =
      Get.put(MyInquiriesListScreenController());

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
          'My Enquiries',
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Obx(
        () => myInquiriesListScreenController.isLoading.value
            ? const MyInquiriesLoadingWidget()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    myInquiriesListScreenController
                            .getInquiryNotificationList.isEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Center(
                              child: Text(
                                "No Enquiries Found",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        : InquiriesListModule(),
                  ],
                ),
              ),
      ),
    );
  }
}
