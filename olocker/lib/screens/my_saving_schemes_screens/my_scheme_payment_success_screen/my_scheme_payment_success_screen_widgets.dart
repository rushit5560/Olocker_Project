import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/my_saving_schemes_screens_controllers/my_saving_schemes_list_screen_controller.dart';
import 'package:olocker/controllers/my_saving_schemes_screens_controllers/my_schemes_details_screen_controller.dart';

import 'package:sizer/sizer.dart';

import '../../../controllers/my_saving_schemes_screens_controllers/my_scheme_payment_success_screen_controller.dart';

class PaymentSuccessContainerWidget extends StatelessWidget {
  PaymentSuccessContainerWidget({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePaymentSuccessScreenController>();

  @override
  Widget build(BuildContext context) {
    // log("Order date  1111 : ${screenController.transactionsList[0].transactionDate.split(" ")[0]}");
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            "Your payment is successful !",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.accentBGColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 3.h),
          Image.asset(
            AppImages.paymentSuccessimage,
            height: 10.h,
          ),
          SizedBox(height: 3.h),
          Text(
            // "Order date : ${screenController.transactionsList[0].transactionDate.split(" ")[0]}",
            "Order date : ",
            style: TextStyle(
              color: AppColors.blueDarkColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            "PAYMENT REFERENCE NUMBER",
            style: TextStyle(
              color: AppColors.blueDarkColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 1.h),
          PaymenTInvoiceNoListview(),
          SizedBox(height: 2.h),
          Image.asset(
            AppImages.pdfImage,
            height: 7.h,
          ),
          // SizedBox(height: 1.h),
        ],
      ),
    );
  }
}

class PaymenTInvoiceNoListview extends StatelessWidget {
  PaymenTInvoiceNoListview({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePaymentSuccessScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: screenController.transactionsList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Text(
          screenController.transactionsList[index].invoiceNo,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.blueDarkColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 0.5.h);
      },
    );
  }
}

class ImageShowWidget extends StatelessWidget {
  ImageShowWidget({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePaymentSuccessScreenController>();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.paymentDoneCardimage,
      height: 22.h,
      width: 90.w,
      fit: BoxFit.contain,
    );
  }
}

class GoBackToSchemeDetailsButton extends StatelessWidget {
  GoBackToSchemeDetailsButton({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePaymentSuccessScreenController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.back();
          Get.back();
          Get.back();

          bool ifSavingSchemesDetailsController =
              Get.isRegistered<MySchemesDetailsScreenController>();

          log("ifSavingSchemesDetailsController is refreshing is :: $ifSavingSchemesDetailsController");

          if (ifSavingSchemesDetailsController) {
            Get.back();
            // final mySchemesDetailsScreenController =
            //     Get.find<MySchemesDetailsScreenController>();
            // mySchemesDetailsScreenController.getMySavingSchemeDetailsFunction();
            bool ifSavingSchemesListController =
                Get.isRegistered<MySavingSchemesListScreenController>();

            log("ifSavingSchemesListController is refreshing is :: $ifSavingSchemesListController");
            if (ifSavingSchemesListController) {
              final mySavingSchemesListScreenController =
                  Get.find<MySavingSchemesListScreenController>();
              mySavingSchemesListScreenController
                  .getCustomerSavingSchemesListFunction();
            }
            // final mySavingSchemesListPutController =
            //     Get.lazyPut(() => MySavingSchemesListScreenController);
            // final mySchemesDetailsPutController =
            //     Get.lazyPut(() => MySchemesDetailsScreenController);
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            "GO BACK TO SCHEME DETAILS",
            style: TextStyle(
              fontFamily: "Roboto-Medium",
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              color: AppColors.whiteColor,
              fontStyle: FontStyle.italic,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
