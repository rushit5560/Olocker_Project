import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/saving_schemes_screens_controllers/saving_scheme_enroll_screen_controller.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import 'saving_scheme_enroll_screen_widgets.dart';

class SavingSchemeEnrollScreen extends StatelessWidget {
  SavingSchemeEnrollScreen({Key? key}) : super(key: key);
  final savingSchemeEnrollScreenController =
      Get.put(SavingSchemeEnrollScreenController());

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
          'Enroll',
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Obx(
        () => savingSchemeEnrollScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : SingleChildScrollView(
                child: Form(
                  key: savingSchemeEnrollScreenController.customerFormKey,
                  child: Column(
                    children: [
                      HeaderModule(),
                      MonthlyAmountModule(),
                      savingSchemeEnrollScreenController.isShow.value
                      ? MaturityAmountModule()
                      : Container(),

                      CustomerDetailsFormModule(),

                      SaveAndMakePaymentButtonModule(),

                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
