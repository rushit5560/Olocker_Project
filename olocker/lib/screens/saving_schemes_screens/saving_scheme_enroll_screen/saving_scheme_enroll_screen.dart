import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/saving_schemes_screens_controllers/saving_scheme_enroll_screen_controller.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/saving_schemes_widgets.dart';
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
        backgroundColor: AppColors.darkCreamBgColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          'Enroll',
          style: TextStyleConfig.appbarTextStyle(),
        ),
      ),
      body: Obx(
        () => savingSchemeEnrollScreenController.isLoading.value
            ? const SchemEnrollScreenLoadingWidget()
            : SingleChildScrollView(
                child: Form(
                  key: savingSchemeEnrollScreenController.customerFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: JewellerDetailImageInfoModule(
                          imagePath: savingSchemeEnrollScreenController.jewellerLogo,
                          schemeName: savingSchemeEnrollScreenController.jewellerName,
                          schemeTagLine: savingSchemeEnrollScreenController.savingSchemeData.schemeName,
                          // schemeName: savingSchemeEnrollScreenController.savingSchemeData.schemeName,
                          // schemeTagLine: savingSchemeEnrollScreenController.savingSchemeData.schemeTagLine,
                        ),
                      ),
                      Container(height: 10),
                      MonthlyAmountModule(),
                      savingSchemeEnrollScreenController.isShow.value
                          ? MaturityAmountModule()
                          : Container(height: 10),
                      CustomerDetailsFormModule(),
                      SaveAndMakePaymentButtonModule(),
                      SizedBox(height: 1.h),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
