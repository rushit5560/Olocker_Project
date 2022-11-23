import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/my_saving_schemes_screens_controllers/my_scheme_pending_installment_screen_controller.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import 'my_scheme_pending_installment_screen_widgets.dart';

class MySchemePendingInstallmentScreen extends StatelessWidget {
  MySchemePendingInstallmentScreen({Key? key}) : super(key: key);
  final mySchemePendingInstallmentScreenController =
      Get.put(MySchemePendingInstallmentScreenController());

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
        () => mySchemePendingInstallmentScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : SingleChildScrollView(
                child: Form(
                  key: mySchemePendingInstallmentScreenController
                      .customerFormKey,
                  child: Column(
                    children: [
                      HeaderModule(),
                      MonthlyAmountModule(),
                      mySchemePendingInstallmentScreenController.isShow.value
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
