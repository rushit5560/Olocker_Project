import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/screens/about_us_screen/about_us_screen_widgets.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_colors.dart';
import '../../controllers/about_us_screen_controller.dart';
import '../my_inquiries_list_screen/my_inquiries_list_screen.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({Key? key}) : super(key: key);

  final aboutUsPageController = Get.put(AboutUsPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blueDarkColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios,
                color: AppColors.blackTextColor),
          ),
          title: Text(
            '${aboutUsPageController.jewellerName}',
            style: TextStyle(
              color: AppColors.blackTextColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(
                  () => MyInquiriesListScreen(),
                  arguments: [
                    aboutUsPageController.partnerSrno,
                  ],
                );
              },
              icon: const Icon(
                Icons.mail_outline_rounded,
                color: AppColors.accentColor,
              ),
            ),
          ],
        ),
        body: Obx(
          () => aboutUsPageController.isLoading.value
              ? CommonLoader().showCircularLoader()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      AboutUsDetailsModule(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
