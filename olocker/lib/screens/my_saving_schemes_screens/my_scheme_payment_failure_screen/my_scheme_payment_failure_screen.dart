import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/my_saving_schemes_screens_controllers/my_scheme_payment_failure_screen_controller.dart';
import 'my_scheme_payment_failure_screen_widgets.dart';

class MySchemePaymentFailureScreen extends StatelessWidget {
  MySchemePaymentFailureScreen({Key? key}) : super(key: key);
  final mySchemePaymentFailureScreenController =
      Get.put(MySchemePaymentFailureScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkCreamBgColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.darkCreamBgColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        title: Text(
          'Make Payments',
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Obx(
        () => mySchemePaymentFailureScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    HeaderModule(),
                  ],
                ),
              ),
      ),
    );
  }
}
