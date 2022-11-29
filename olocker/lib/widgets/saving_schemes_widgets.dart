import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../constants/api_url.dart';
import '../constants/app_colors.dart';
import '../constants/app_images.dart';

class JewellerDetailImageInfoModule extends StatelessWidget {
  const JewellerDetailImageInfoModule(
      {Key? key,
      required this.imagePath,
      required this.schemeName,
      required this.schemeTagLine})
      : super(key: key);

  final String imagePath;
  final String schemeName;
  final String schemeTagLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: ApiUrl.apiImagePath + imagePath,
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
          SizedBox(width: 10),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schemeName,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  schemeTagLine,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.greyColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget(
      {Key? key,
      required this.monthlyAmount,
      required this.maturityAmount,
      required this.tenure,
      required this.startDateTime,
      required this.endDateTime})
      : super(key: key);

  final int monthlyAmount;
  final int maturityAmount;
  final int tenure;
  final DateTime startDateTime;
  final DateTime endDateTime;

  @override
  Widget build(BuildContext context) {
    var format = DateFormat("dd MMM yyyy");

    var startDate = format.format(startDateTime);
    var maturityDate = format.format(endDateTime);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentDetailsRowWidget(
            text: "Monthly Installment",
            textValue: "₹ $monthlyAmount",
          ),
          SizedBox(height: 1.h),
          PaymentDetailsRowWidget(
            text: "Balance payable at maturity",
            textValue: "₹ $maturityAmount",
          ),
          SizedBox(height: 1.h),
          PaymentDetailsRowWidget(
            text: "Tenure",
            textValue: "$tenure months",
          ),
          SizedBox(height: 1.h),
          PaymentDetailsRowWidget(
            text: "Starting Date",
            textValue: startDate,
          ),
          SizedBox(height: 1.h),
          PaymentDetailsRowWidget(
            text: "Maturity Date",
            textValue: maturityDate,
          ),
        ],
      ),
    );
  }
}

class PaymentDetailsRowWidget extends StatelessWidget {
  const PaymentDetailsRowWidget({
    Key? key,
    required this.text,
    required this.textValue,
  }) : super(key: key);

  final String text;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 65,
          child: Text(
            text,
            maxLines: 2,
            style: TextStyle(
              fontSize: 11.sp,
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 35,
          child: Text(
            textValue,
            maxLines: 2,
            style: TextStyle(
              fontSize: 11.sp,
              color: AppColors.blueDarkColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
