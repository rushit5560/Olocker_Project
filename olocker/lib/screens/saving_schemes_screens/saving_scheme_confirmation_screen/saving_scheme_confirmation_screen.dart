import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';

import 'package:olocker/screens/saving_schemes_screens/saving_scheme_confirmation_screen/saving_scheme_confirmation_screen_widgets.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/saving_schemes_screens_controllers/saving_scheme_confirmation_screen_controller.dart';

class SavingSchemeConfirmationScreen extends StatelessWidget {
  SavingSchemeConfirmationScreen({Key? key}) : super(key: key);

  final savingSelectionScreenController =
      Get.put(SavingSchemeConfirmationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.lightBrownBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightBrownBgColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          'Enroll',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      bottomNavigationBar: ProceedToPayButtonModule(),
      body: Column(
        children: [
          JewellerDetailsHeaderModule(),
          SizedBox(height: 2.h),
          AmountDetailsModule(),
        ],
      ).commonAllSidePadding(15),
    );
  }
}
