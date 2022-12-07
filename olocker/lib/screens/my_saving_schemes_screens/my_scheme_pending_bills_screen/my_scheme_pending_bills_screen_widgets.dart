import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/screens/my_saving_schemes_screens/my_scheme_pending_payment_screen/my_scheme_pending_payment_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import '../../../controllers/my_saving_schemes_screens_controllers/my_scheme_pending_bills_screen_controller.dart';
import '../../../models/my_saving_schemes_models/get_pending_bills_model/get_pending_bills_list_model.dart';

class PayNowBottomButton extends StatelessWidget {
  PayNowBottomButton({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePendingBillsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          var selectedCount = 0;
          for (int i = 0;
              i < screenController.getPendingBillsList.length;
              i++) {
            if (screenController.getPendingBillsList[i].isSelected == true) {
              selectedCount += 1;
              screenController.selectedPendingBillsList
                  .add(screenController.getPendingBillsList[i]);
            } else {}
          }

          if (selectedCount == 0) {
            CommonWidgets().showBorderSnackBar(
                context: context,
                displayText: "Please select at least one bill to pay.");
          } else {
            Get.to(
              () => MySchemePendingPaymentScreen(),
              arguments: [
                screenController.selectedPendingBillsList,
              ],
            );
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
              fontFamily: "Roboto-Medium",
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

class MyBillsModule extends StatelessWidget {
  MyBillsModule({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePendingBillsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height * 0.18,
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 30, top: 20, bottom: 20, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Bills",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      "Total due payments",
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 10.sp,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      NumberFormat.currency(
                        symbol: '₹ ',
                        locale: "HI",
                        decimalDigits: 2,
                      ).format(double.parse(
                          screenController.selectedAmountTotal.value)),
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Image.asset(
                AppImages.pendingBillsImage,
                fit: BoxFit.cover,
                height: Get.size.height * 0.18,
                width: Get.size.width * 0.45,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PandingBillsSelectModule extends StatelessWidget {
  PandingBillsSelectModule({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemePendingBillsScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: screenController.getPendingBillsList.length,
      itemBuilder: (context, index) {
        var singlePendingItem = screenController.getPendingBillsList[index];

        return SinglePendingItem(
          singlePendingItem: singlePendingItem,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 1.h);
      },
    );
  }
}

class SinglePendingItem extends StatelessWidget {
  SinglePendingItem({
    Key? key,
    required this.singlePendingItem,
  }) : super(key: key);

  final GetPendingBillData singlePendingItem;

  final screenController = Get.find<MySchemePendingBillsScreenController>();

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd-MM-yyyy');

    var parsedDate =
        dateFormat.parse(singlePendingItem.insatllmentDate.trim()).toString();

    // log("get parsedDate is : : $parsedDate");

    var dateFormatSet = DateFormat('dd MMM yyyy');
    var formattedDate = dateFormatSet.format(DateTime.parse(parsedDate));

    // selectedOrnamentPurchaseDate.value = formattedDate.replaceAll("-", "/");

    log("formattedDate is:: $formattedDate");

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Column(
            children: [
              Text(
                formattedDate.split(" ")[0],
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(
                width: 24,
                child: Text(
                  formattedDate.split(" ")[1].toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 8.5.sp,
                  ),
                ),
              ),
              Text(
                formattedDate.substring(
                    formattedDate.length - 4, formattedDate.length),
                style: TextStyle(
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 8.5.sp,
                ),
              ),
            ],
          ),
          SizedBox(width: 4.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                singlePendingItem.invoiceNo,
                style: TextStyle(
                  color: AppColors.blueDarkColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(height: 5),
              Text(
                "Invoice number",
                style: TextStyle(
                  color: AppColors.greyTextColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: 1.h),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: Checkbox(
                  value: singlePendingItem.isSelected,
                  fillColor: MaterialStateProperty.resolveWith(
                      (states) => AppColors.accentColor),
                  activeColor: AppColors.accentColor,
                  checkColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onChanged: (value) {
                    // setState(() {
                    screenController.isLoading(true);
                    singlePendingItem.isSelected = value!;
                    screenController.isLoading(false);
                    // });
                  },
                ),
              ),
              SizedBox(height: 1.5.h),
              Text(
                "₹ ${singlePendingItem.installmentAmount.floor()}",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
