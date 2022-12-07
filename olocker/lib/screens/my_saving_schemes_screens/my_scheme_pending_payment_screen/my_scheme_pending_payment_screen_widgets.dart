import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/constants/enum.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import '../../../controllers/my_saving_schemes_screens_controllers/my_scheme_pending_payment_screen_controller.dart';
import '../../../models/my_saving_schemes_models/get_pending_bills_model/get_pending_bills_list_model.dart';
import '../../../widgets/common_loader.dart';
import '../my_scheme_payment_success_screen/my_scheme_payment_success_screen.dart';

class PayNowButton extends StatelessWidget {
  PayNowButton({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePendingPaymentScreenController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (screenController.paymentTypeEnum == null) {
            CommonWidgets().showBorderSnackBar(
              context: context,
              displayText:
                  "Please select any payment method to continue payment.",
            );
          } else if (screenController.paymentTypeEnum == PaymentTypeEnum.visa) {
            // Here call Razorpay payment intent
            screenController.createRazorPaymentSheet();
          } else {
            screenController.makePaymentsApiFunction();
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            "PAY NOW",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              fontFamily: "Roboto-Medium",
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

class PaymentDetails extends StatelessWidget {
  PaymentDetails({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePendingPaymentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${screenController.pendingBillsSelectedList.length} Invoices",
            style: TextStyle(
              color: AppColors.accentColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1.h),
          const Divider(color: AppColors.accentColor),
          // SizedBox(height: 1.h),
          ListView.separated(
            itemCount: screenController.pendingBillsSelectedList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var singleData = screenController.pendingBillsSelectedList[index];
              return SingleBillShowWidget(
                pendingBillData: singleData,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 1.5.h);
            },
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Late payment fee ₹ 100",
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SingleBillShowWidget extends StatelessWidget {
  SingleBillShowWidget({
    Key? key,
    required this.pendingBillData,
  }) : super(key: key);

  final GetPendingBillData pendingBillData;

  final screenController = Get.find<MySchemePendingPaymentScreenController>();

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd-MM-yyyy');

    var parsedDate =
        dateFormat.parse(pendingBillData.insatllmentDate.trim()).toString();

    // log("get parsedDate is : : $parsedDate");

    var dateFormatSet = DateFormat('dd MMM yyyy');
    var formattedDate = dateFormatSet.format(DateTime.parse(parsedDate));

    // selectedOrnamentPurchaseDate.value = formattedDate.replaceAll("-", "/");

    log("formattedDate is:: $formattedDate");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Get.size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pendingBillData.invoiceNo,
              style: const TextStyle(
                  color: Color(0xFF052a45),
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            Text("₹ ${pendingBillData.installmentAmount.floor()}",
                style: const TextStyle(
                    color: Color(0xFF052a45),
                    fontWeight: FontWeight.bold,
                    fontSize: 18))
          ],
        ),
        SizedBox(
          height: Get.size.height * 0.01,
        ),
        const Text(
          "Invoice number",
          style: TextStyle(color: Colors.black54),
        ),
        SizedBox(height: Get.size.height * 0.01),
        Row(
          children: [
            const Text(
              "Billing Date",
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(
              width: Get.size.width * 0.04,
            ),
            Text(
              formattedDate,
              style: const TextStyle(
                color: const Color(0xFF052a45),
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class PaymentMethods extends StatelessWidget {
  PaymentMethods({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePendingPaymentScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => screenController.isLoading.value
          ? CommonLoader().showCircularLoader()
          : Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Payable",
                          style: TextStyle(
                            color: AppColors.blueDarkColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "₹ ${screenController.totalEmiPaymentAmount}",
                          style: TextStyle(
                            color: AppColors.accentColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      "Payment methods",
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Column(
                      children: [
                        RadioListTile<PaymentTypeEnum>(
                            title: Row(
                              children: [
                                SizedBox(
                                  height: Get.size.height * 0.025,
                                  child: Image.asset(
                                    AppImages.paytmImage,
                                  ),
                                ),
                              ],
                            ),
                            value: PaymentTypeEnum.paytm,
                            groupValue: screenController.paymentTypeEnum,
                            onChanged: (val) {
                              // setState(() {
                              screenController.isLoading(true);
                              screenController.paymentTypeEnum = val!;
                              screenController.isLoading(false);
                              // });
                            }),
                        RadioListTile<PaymentTypeEnum>(
                            title: Row(
                              children: [
                                SizedBox(
                                    height: Get.size.height * 0.025,
                                    child: Image.asset(
                                      AppImages.gpayImage,
                                    )),
                              ],
                            ),
                            value: PaymentTypeEnum.googlepay,
                            groupValue: screenController.paymentTypeEnum,
                            onChanged: (val) {
                              // setState(() {
                              screenController.isLoading(true);
                              screenController.paymentTypeEnum = val!;
                              screenController.isLoading(false);
                              // });
                            }),
                        RadioListTile<PaymentTypeEnum>(
                            title: Row(
                              children: [
                                SizedBox(
                                  height: Get.size.height * 0.025,
                                  child: Image.asset(
                                    AppImages.amoZonImage,
                                  ),
                                ),
                              ],
                            ),
                            value: PaymentTypeEnum.amazonpay,
                            groupValue: screenController.paymentTypeEnum,
                            onChanged: (val) {
                              // setState(() {
                              screenController.isLoading(true);
                              screenController.paymentTypeEnum = val!;
                              screenController.isLoading(false);
                              // });
                            }),
                        RadioListTile<PaymentTypeEnum>(
                            title: Row(
                              children: [
                                SizedBox(
                                  height: Get.size.height * 0.025,
                                  child: Image.asset(
                                    AppImages.visaImage,
                                  ),
                                ),
                              ],
                            ),
                            value: PaymentTypeEnum.visa,
                            groupValue: screenController.paymentTypeEnum,
                            onChanged: (val) {
                              // setState(() {
                              screenController.isLoading(true);
                              screenController.paymentTypeEnum = val!;
                              screenController.isLoading(false);
                              // });
                            }),
                        RadioListTile<PaymentTypeEnum>(
                          title: Row(
                            children: [
                              SizedBox(
                                  height: Get.size.height * 0.025,
                                  child: Image.asset(
                                    AppImages.cashImage,
                                  )),
                            ],
                          ),
                          value: PaymentTypeEnum.cashondelivery,
                          groupValue: screenController.paymentTypeEnum,
                          onChanged: (val) {
                            // setState(() {
                            screenController.isLoading(true);
                            screenController.paymentTypeEnum = val!;
                            screenController.isLoading(false);
                            // });
                          },
                        ),
                        SizedBox(height: 1.h),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
