import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/saving_schemes_screens_controllers/scheme_payment_success_screen_controller.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/saving_schemes_widgets.dart';
import 'scheme_payment_success_screen_widgets.dart';

class SchemePaymentSuccessScreen extends StatelessWidget {
  SchemePaymentSuccessScreen({Key? key}) : super(key: key);

  final schemePaymentSuccessScreenController =
      Get.put(SchemePaymentSuccessScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        CommonWidgets().showBorderSnackBar(
          context: context,
          displayText: "You can not go back from this page.",
        );

        // can not go back if false
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.lightBrownBgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.lightBrownBgColor,
          leading: IconButton(
            onPressed: () {
              CommonWidgets().showBorderSnackBar(
                context: context,
                displayText: "You can not go back from this page.",
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Make Payment",
            style: TextStyle(
              color: AppColors.blackColor,
            ),
          ).commonOnlyPadding(left: 50),
        ),
        bottomNavigationBar: GoBackSavingSchemeButton(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              JewellerDetailImageInfoModule(
                imagePath: schemePaymentSuccessScreenController.schemeImagePath,
                schemeName: schemePaymentSuccessScreenController.schemeName,
                schemeTagLine:
                    schemePaymentSuccessScreenController.schemeTagLine,
              ),
              SizedBox(height: 2.h),
              PaymentDetailsWidget(
                monthlyAmount: schemePaymentSuccessScreenController
                    .savingSchemeDetails.monthlyAmount,
                maturityAmount: schemePaymentSuccessScreenController
                    .savingSchemeDetails.maturityAmount,
                tenure: schemePaymentSuccessScreenController
                    .savingSchemeDetails.tenure,
                startDateTime: schemePaymentSuccessScreenController
                    .partnerSavingSchemeDetails.startDate,
                endDateTime: schemePaymentSuccessScreenController
                    .partnerSavingSchemeDetails.endDate,
              ),
              SizedBox(height: 2.h),
              PaymentSuccessDetailsModule()
            ],
          ).commonAllSidePadding(12),
        ),
      ),
    );
  }
}
