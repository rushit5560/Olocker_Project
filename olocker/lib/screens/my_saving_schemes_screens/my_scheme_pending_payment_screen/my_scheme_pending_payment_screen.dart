import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/my_saving_schemes_screens_controllers/my_scheme_pending_payment_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import 'my_scheme_pending_payment_screen_widgets.dart';

class MySchemePendingPaymentScreen extends StatelessWidget {
  MySchemePendingPaymentScreen({Key? key}) : super(key: key);

  final mySchemePendingPaymentScreenController =
      Get.put(MySchemePendingPaymentScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        mySchemePendingPaymentScreenController.pendingBillsSelectedList.clear();
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.lightBrownBgColor,
        appBar: AppBar(
          backgroundColor: Colors.orange.shade100,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              mySchemePendingPaymentScreenController.pendingBillsSelectedList
                  .clear();
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              children: [
                PaymentDetails(),
                SizedBox(height: 2.h),
                PaymentMethods(),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),

        bottomNavigationBar: PayNowButton(),

      ),
    );
  }
}
