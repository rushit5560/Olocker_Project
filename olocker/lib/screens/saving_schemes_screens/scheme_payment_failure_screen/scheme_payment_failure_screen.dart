import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/saving_schemes_screens_controllers/scheme_payment_Failure_screen_controller.dart';
import 'package:sizer/sizer.dart';
import '../../../widgets/saving_schemes_widgets.dart';
import 'scheme_payment_failure_screen_widgets.dart';

class SchemePaymentFailureScreen extends StatelessWidget {
  SchemePaymentFailureScreen({Key? key}) : super(key: key);
  final schemePaymentFailureScreenController =
      Get.put(SchemePaymentFailureScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: const Text(
          'Make Payments',
          style: TextStyle(
            fontFamily: "Roboto",
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      bottomNavigationBar: TryAnotherPaymentMethodButton(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            JewellerDetailImageInfoModule(
              imagePath: schemePaymentFailureScreenController.jewellerLogo,
              schemeName: schemePaymentFailureScreenController.schemeName,
              schemeTagLine: schemePaymentFailureScreenController.schemeTagLine,
            ),
            SizedBox(height: 2.h),
            PaymentDetailsWidget(
              monthlyAmount: schemePaymentFailureScreenController
                  .savingSchemeDetails.monthlyAmount,
              maturityAmount: schemePaymentFailureScreenController
                  .savingSchemeDetails.maturityAmount,
              tenure: schemePaymentFailureScreenController
                  .savingSchemeDetails.tenure,
              startDateTime: schemePaymentFailureScreenController
                  .partnerSavingSchemeDetails.startDate,
              endDateTime: schemePaymentFailureScreenController
                  .partnerSavingSchemeDetails.endDate,
            ),
            SizedBox(height: 2.h),
            // SencoGoldContainer(),
            // PaymentDetailForMonthlyContainer(),
            const UnSuccessPaymentWidget(),
          ],
        ),
      ),
    );
  }
}
