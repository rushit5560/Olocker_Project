import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/api_url.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../controllers/my_saving_schemes_screens_controllers/my_schemes_details_screen_controller.dart';
import '../../../models/my_saving_schemes_models/get_saving_schemes_list_model/get_saving_scheme_list_model.dart';
import '../../../models/saving_scheme_screens_models/saving_schemes_success_failure_models/get_transaction_status_details_model.dart';
import '../my_scheme_pending_bills_screen/my_scheme_pending_bills_screen.dart';

class SchemeDetailsLoadingWidget extends StatelessWidget {
  SchemeDetailsLoadingWidget({Key? key}) : super(key: key);

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
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(27),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 12),
                        decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(27),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 11.h,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: const BorderRadius.all(
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

class PaymentRefundRowModule extends StatelessWidget {
  PaymentRefundRowModule({Key? key}) : super(key: key);

  final screenController = Get.find<MySchemesDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.h),
        Row(
          children: [
            SizedBox(width: 2.w),
            ColoredCustomButton(
              color: AppColors.greenTintColor,
              text: "MAKE PAYMENT",
              onPressed: () {
                Get.to(
                  () => MySchemePendingBillsScreen(),
                  arguments: [
                    screenController.schemeData.savingSchemeSrNo,
                  ],
                );
              },
            ),
            SizedBox(width: 4.w),
            ColoredCustomButton(
              color: AppColors.orangeColor,
              text: "REFUND",
              onPressed: () {},
            ),
            SizedBox(width: 2.w),
          ],
        ),
      ],
    );
  }
}

class UnmaturedSchemeDetailsModule extends StatelessWidget {
  const UnmaturedSchemeDetailsModule({
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
                  // const Spacer(),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.to(
                  //       () => MySchemesDetailsScreen(),
                  //       arguments: [
                  //         schemeData.savingSchemeSrNo,
                  //         schemeData,
                  //       ],
                  //     );
                  //   },
                  //   child: Image.asset(
                  //     AppIcons.rightSideImage,
                  //     height: 25,
                  //     width: 25,
                  //   ),
                  // )
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
                      percent: 0.7,
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
              // SizedBox(height: 3.h),
              // Row(
              //   children: [
              //     ColoredCustomButton(
              //       color: AppColors.greenTintColor,
              //       text: "MAKE PAYMENT",
              //       onPressed: () {
              //         Get.to(
              //           () => MySchemePendingBillsScreen(),
              //           arguments: [
              //             schemeData.savingSchemeSrNo,
              //           ],
              //         );
              //       },
              //     ),
              //     SizedBox(width: 3.w),
              //     ColoredCustomButton(
              //       color: AppColors.orangeColor,
              //       text: "REFUND",
              //       onPressed: () {},
              //     ),
              //   ],
              // ),
              SizedBox(height: 1.h),
            ],
          ),
        ),
      ],
    );
  }
}

class MaturedSchemeDetailsModule extends StatelessWidget {
  const MaturedSchemeDetailsModule({
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
                  // const Spacer(),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.to(
                  //       () => MySchemesDetailsScreen(),
                  //       arguments: [
                  //         schemeData.savingSchemeSrNo,
                  //         schemeData,
                  //       ],
                  //     );
                  //   },
                  //   child: Image.asset(
                  //     AppIcons.rightSideImage,
                  //     height: 25,
                  //     width: 25,
                  //   ),
                  // )
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

class JewellerCallDetailsModule extends StatelessWidget {
  JewellerCallDetailsModule({Key? key}) : super(key: key);

  final mySchemePendingPaymentScreenController =
      Get.find<MySchemesDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: ApiUrl.apiImagePath +
                mySchemePendingPaymentScreenController
                    .getSavingSchemeData!.imagePath,

            // ApiUrl.apiImagePath + imagePath,
            fit: BoxFit.cover,
            width: 18.w,
            errorWidget: (context, url, error) {
              return Image.asset(
                AppImages.diamondsIocn,
                fit: BoxFit.cover,
                width: 18.w,
              );
            },
          ),
          SizedBox(width: 3.w),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mySchemePendingPaymentScreenController
                      .getSavingSchemeData!.schemeName,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  mySchemePendingPaymentScreenController
                      .getSavingSchemeData!.schemeTagLine,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 2.w),
          GestureDetector(
            onTap: () async {
              Uri phoneno = Uri.parse(
                  "tel:+91 ${mySchemePendingPaymentScreenController.getSavingSchemeData!.mobile.floor()}");

              if (await launchUrl(phoneno)) {
              } else {}
            },
            child: Container(
              height: 6.h,
              width: 6.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.callImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MySchemesTransactionsListViewModule extends StatelessWidget {
  MySchemesTransactionsListViewModule({Key? key}) : super(key: key);

  final mySchemePendingPaymentScreenController =
      Get.find<MySchemesDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.h),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Row(
            children: [
              Text(
                "TRANSACTIONS",
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueDarkColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        mySchemePendingPaymentScreenController.transactionsDataList == null
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Text(
                  "No Transaction history available",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.greyDarkColor,
                  ),
                ),
              )
            : ListView.separated(
                // padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: mySchemePendingPaymentScreenController
                    .transactionsDataList!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var singleTransItem = mySchemePendingPaymentScreenController
                      .transactionsDataList![index];
                  return TransationSingleItemModule(
                    transData: singleTransItem,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) => Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      height: 18,
                      width: 4,
                      color: AppColors.orangeColor,
                    )
                  ],
                ),
              ),
        SizedBox(height: 2.h),
      ],
    );
  }
}

class TransationSingleItemModule extends StatelessWidget {
  TransationSingleItemModule(
      {Key? key, required this.transData, required this.index})
      : super(key: key);

  final TransactionData transData;
  final int index;

  final mySchemePendingPaymentScreenController =
      Get.find<MySchemesDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd-MM-yyyy');

    var parsedDate = dateFormat.parse(transData.billingDate.trim()).toString();

    // log("get parsedDate is : : $parsedDate");

    var dateFormatSet = DateFormat('dd MMM yyyy');
    var formattedDate = dateFormatSet.format(DateTime.parse(parsedDate));

    // selectedOrnamentPurchaseDate.value = formattedDate.replaceAll("-", "/");

    // log("formattedDate is:: $formattedDate");

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: index.floor().isEven
            ? AppColors.blueTintColor
            : AppColors.pinkTintColor,
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Text(
                    formattedDate.split(" ")[0],
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  Text(
                    formattedDate.split(" ")[1].toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 8.5.sp,
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
            ),
            SizedBox(width: 3.w),
            Expanded(
              flex: 65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transData.invoiceNo,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.blueDarkColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Reference Number",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Spacer(),
            // SizedBox(width: 2.w),
            Expanded(
              flex: 35,
              child: Text(
                "₹ ${transData.transactionAmount}",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Spacer(),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 10.w,
                child: Image.asset(
                  AppImages.pdfImage,
                ),
              ),
            ),
          ],
        ),
      ),
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
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27),
              ),
              primary: color),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 11.sp,
              fontFamily: "Roboto-Medium",
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
    );
  }
}
