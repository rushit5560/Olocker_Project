import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/saving_schemes_screens_controllers/scheme_payment_Failure_screen_controller.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

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
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      bottomNavigationBar:const TryAnotherPaymentMethod(),
      body: Column(
        children:const [
          SencoGoldContainer(),
          PaymentDetailForMonthlyContainer(),
          UnSuccessPaymentContainer(),
        ],
      ),
    );
  }
}
