import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:olocker/screens/saving_schemes_screens/saving_scheme_payment_screen/saving_scheme_payment_screen_widgets.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';

class SavingSchemeConPaymentScreen extends StatelessWidget {
  const SavingSchemeConPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.lightBrownBgColor,

      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     width: double.infinity,
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(10), color: Colors.redAccent),
      //     child: Center(
      //       child: Text(
      //         "PAY NOW",
      //         style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 16.sp,
      //             color: AppColors.whiteColor),
      //       ).commonSymmetricPadding(vertical: 15),
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightBrownBgColor,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.blackColor,
        ),
        title: const Text(
          "Make Payment",
          style: TextStyle(
            color: AppColors.blackColor,
          ),
        ).commonOnlyPadding(left: 50),
      ),

      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.redAccent),
        child: Center(
          child: Text(
            "PAY NOW",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: AppColors.whiteColor),
          ).commonSymmetricPadding(vertical: 15),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SencoPaymentImageModule(),
            SizedBox(height: 2.h),
            AmountDetailsModule(),
            SizedBox(height: 2.h),
          ],
        ).commonAllSidePadding(12),
      ),
    );
  }
}
