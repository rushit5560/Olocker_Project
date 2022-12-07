import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/screens/saving_schemes_screens/scheme_choose_payment_method_screen/scheme_choose_payment_method_screen_widgets.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import '../../../controllers/saving_schemes_screens_controllers/scheme_choose_payment_method_screen_controller.dart';
import '../../../widgets/saving_schemes_widgets.dart';

class SchemeChoosePaymentMethodScreen extends StatelessWidget {
  SchemeChoosePaymentMethodScreen({Key? key}) : super(key: key);

  final schemeChoosePaymentMethodScreenController =
      Get.put(SchemeChoosePaymentMethodScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBrownBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightBrownBgColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        titleSpacing: 0,
        title: Text(
          'Make Payments',
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      bottomNavigationBar: PayNowCustomButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            JewellerDetailImageInfoModule(
              imagePath:
                  schemeChoosePaymentMethodScreenController.schemeImagePath,
              schemeName: schemeChoosePaymentMethodScreenController.schemeName,
              schemeTagLine:
                  schemeChoosePaymentMethodScreenController.schemeTagLine,
            ),
            SizedBox(height: 2.h),
            PaymentDetailsWidget(
              monthlyAmount: schemeChoosePaymentMethodScreenController
                  .savingSchemeDetails.monthlyAmount,
              maturityAmount: schemeChoosePaymentMethodScreenController
                  .savingSchemeDetails.maturityAmount,
              tenure: schemeChoosePaymentMethodScreenController
                  .savingSchemeDetails.tenure,
              startDateTime: schemeChoosePaymentMethodScreenController
                  .partnerSavingSchemeDetails.startDate,
              endDateTime: schemeChoosePaymentMethodScreenController
                  .partnerSavingSchemeDetails.endDate,
            ),
            SizedBox(height: 2.h),
            PaymentMethods(),
            SizedBox(height: 2.h),
          ],
        ).commonAllSidePadding(15),
      ),
    );
  }
}
