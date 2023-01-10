import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/screens/my_saving_schemes_screens/my_schemes_details_screen/my_schemes_details_screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/my_saving_schemes_screens_controllers/my_saving_schemes_list_screen_controller.dart';
import '../../../models/my_saving_schemes_models/get_saving_schemes_list_model/get_saving_scheme_list_model.dart';
import '../my_scheme_pending_bills_screen/my_scheme_pending_bills_screen.dart';

class MySchemesListViewModule extends StatelessWidget {
  MySchemesListViewModule({Key? key}) : super(key: key);

  final mySavingSchemesListScreenController =
      Get.find<MySavingSchemesListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount:
          mySavingSchemesListScreenController.getCustomerSchemeslist.length,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        GetCustomerPurchaseSavingSchemeData singleSchemeData =
            mySavingSchemesListScreenController.getCustomerSchemeslist[index];

        // matured and unmatured logic to display
        //singleSchemeData.status == "UNMATURED"

        return singleSchemeData.status == "UNMATURED"
            ? SingleSchemeItemModule(
                schemeData: singleSchemeData,
              )
            : MaturedSchemeItemModule(
                schemeData: singleSchemeData,
              );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 2.h);
      },
    );
  }
}

class SingleSchemeItemModule extends StatelessWidget {
  const SingleSchemeItemModule({
    Key? key,
    required this.schemeData,
  }) : super(key: key);

  final GetCustomerPurchaseSavingSchemeData schemeData;

  @override
  Widget build(BuildContext context) {
    var format = DateFormat("dd MMM yyyy");
    var totalAmount = schemeData.maturityAmount + schemeData.totalPaid;

    var total = ((schemeData.totalPaid * 100) / totalAmount);

    var percentage = total / 100;

    var finalPer = percentage.toStringAsFixed(1);

    var finalPer2 = double.parse(finalPer);

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.whiteColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      color: AppColors.greenTintColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "Folio Number",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    schemeData.folioNo,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => MySchemesDetailsScreen(),
                        arguments: [
                          schemeData.partnerSavingSchemeSrNo,
                          schemeData,
                        ],
                      );
                    },
                    child: Image.asset(
                      AppIcons.rightSideImage,
                      height: 25,
                      width: 25,
                    ),
                  )
                ],
              ),
              SizedBox(height: 2.h),
              const Divider(
                color: AppColors.lightBrownBgColor,
                thickness: 1,
                height: 5,
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          schemeData.partnerName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.5.h),
                    SavingDetailsTextCustom(
                      text: "Start date",
                      textValue: format.format(schemeData.startDate),
                    ),
                    SizedBox(height: 1.h),
                    SavingDetailsTextCustom(
                      text: "Maturity date",
                      textValue: format.format(schemeData.maturityDate),
                    ),
                    SizedBox(height: 1.h),
                    SavingDetailsTextCustom(
                      text: "Next payment date",
                      textValue: format.format(schemeData.nextPaymentDate),
                    ),
                    SizedBox(height: 2.5.h),
                    LinearPercentIndicator(
                      animation: true,
                      lineHeight: 10,
                      animationDuration: 2000,
                      percent: finalPer2,
                      barRadius: const Radius.circular(10),
                      progressColor: AppColors.greenTintColor,
                    ),
                    SizedBox(height: 2.5.h),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AmountDetailsColoredColumn(
                      price: "₹ ${schemeData.maturityAmount.floor()}",
                      text: "Maturity amount",
                      color: AppColors.blueDarkColor,
                    ),
                    AmountDetailsColoredColumn(
                      price: "₹ ${schemeData.totalPaid.floor()}",
                      text: "Total paid",
                      color: AppColors.orangeColor,
                    ),
                    AmountDetailsColoredColumn(
                      price: "₹ ${schemeData.monthlyAmount.floor()}",
                      text: "Monthly amount",
                      color: AppColors.waGreenColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  ColoredCustomButton(
                    color: AppColors.greenTintColor,
                    text: "MAKE PAYMENT",
                    onPressed: () {
                      Get.to(
                        () => MySchemePendingBillsScreen(),
                        arguments: [
                          schemeData.savingSchemeSrNo,
                        ],
                      );
                    },
                  ),
                  SizedBox(width: 3.w),
                  ColoredCustomButton(
                    color: AppColors.orangeColor,
                    text: "REFUND",
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 1.h),
            ],
          ),
        ),
      ],
    );
  }
}

class MaturedSchemeItemModule extends StatelessWidget {
  const MaturedSchemeItemModule({
    Key? key,
    required this.schemeData,
  }) : super(key: key);

  final GetCustomerPurchaseSavingSchemeData schemeData;

  @override
  Widget build(BuildContext context) {
    var format = DateFormat("dd MMM yyyy");
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.whiteColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      color: AppColors.accentColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "Folio Number",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    schemeData.folioNo,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => MySchemesDetailsScreen(),
                        arguments: [
                          schemeData.savingSchemeSrNo,
                          schemeData,
                        ],
                      );
                    },
                    child: Image.asset(
                      AppIcons.rightSideImage,
                      height: 25,
                      width: 25,
                    ),
                  )
                ],
              ),
              SizedBox(height: 2.h),
              const Divider(
                color: AppColors.lightBrownBgColor,
                thickness: 1,
                height: 5,
              ),
              SizedBox(height: 2.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          schemeData.partnerName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.5.h),
                    SavingDetailsTextCustom(
                      text: "Start date",
                      textValue: format.format(schemeData.startDate),
                    ),
                    SizedBox(height: 1.h),
                    SavingDetailsTextCustom(
                      text: "Maturity date",
                      textValue: format.format(schemeData.maturityDate),
                    ),
                    SizedBox(height: 2.5.h),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  const Divider(
                    color: AppColors.accentColor,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 30.w,
                      height: 4.h,
                      // padding:
                      //     EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: Center(
                        child: Text(
                          "MATURED",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AmountDetailsColoredColumn(
                    price: "₹ ${schemeData.maturityAmount.floor()}",
                    text: "Maturity amount",
                    color: AppColors.blueDarkColor,
                  ),
                  AmountDetailsColoredColumn(
                    price: "₹ ${schemeData.totalPaid.floor()}",
                    text: "Total paid",
                    color: AppColors.orangeColor,
                  ),
                  AmountDetailsColoredColumn(
                    price: "₹ ${schemeData.monthlyAmount.floor()}",
                    text: "Monthly amount",
                    color: AppColors.waGreenColor,
                  ),
                ],
              ),
              SizedBox(height: 1.h),
            ],
          ),
        ),
      ],
    );
  }
}

class SavingDetailsTextCustom extends StatelessWidget {
  const SavingDetailsTextCustom({
    Key? key,
    required this.text,
    required this.textValue,
  }) : super(key: key);

  final String text;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 65,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.greyDarkColor,
            ),
          ),
        ),
        Expanded(
          flex: 35,
          child: Text(
            textValue,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}

class AmountDetailsColoredColumn extends StatelessWidget {
  const AmountDetailsColoredColumn({
    Key? key,
    required this.price,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String price;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            price,
            style: TextStyle(
              fontSize: 14.sp,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class ColoredCustomButton extends StatelessWidget {
  const ColoredCustomButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final Color color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 6.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27),
              ),
              primary: color),
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontFamily: "Roboto-Medium",
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
    );
  }
}

class MySchemesListLoadingWidget extends StatelessWidget {
  MySchemesListLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: 36.h,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              Container(
                height: 36.h,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
