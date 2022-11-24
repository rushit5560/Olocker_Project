import 'package:flutter/material.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';


class SencoPaymentSuccessImageModule extends StatelessWidget {
  const SencoPaymentSuccessImageModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              child: Image.asset(AppImages.diamondsIocn),
            ),
          ),
          SizedBox(
            width: 1.h,
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Senco Gold",
                  style: TextStyle(fontSize: 13.sp, color: AppColors.redColor),
                ),
                Text(
                  "Senco Gold dfd gsd ghd h",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ).commonAllSidePadding(20),
    );
  }
}


class PaymentSuccessDetailsModule extends StatelessWidget {
  const PaymentSuccessDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.whiteColor),
      child: Column(
        children: [
          PaymentSuccessDetailsCustom(
            amount: '₹ 2500',
            text: "Monthly Installment",
          ),
          SizedBox(height: 1.h),
          PaymentSuccessDetailsCustom(
            amount: '₹ 32500',
            text: "Balance Payable at matunly",
          ),
          SizedBox(height: 1.h),
          PaymentSuccessDetailsCustom(
            amount: '12 months',
            text: "Tenuret",
          ),
          SizedBox(height: 1.h),
          PaymentSuccessDetailsCustom(
            amount: '21 july 2021',
            text: "Starting Date",
          ),
          SizedBox(height: 1.h),
          PaymentSuccessDetailsCustom(
            amount: '21 july 2021',
            text: "Maturity Date",
          ),
        ],
      ).commonAllSidePadding(15),
    );
  }
}


class PaymentSuccessfulModule extends StatelessWidget {
  const PaymentSuccessfulModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.whiteColor),
      child: Column(
        children: [
          Text(
            "Your payment is successful !",
            style: TextStyle(fontSize: 15.sp, color: AppColors.redColor),
          ),
          SizedBox(height: 2.h),
          Container(
            height: 10.h,
            width: 10.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(AppImages.paymentSuccessimage),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 4.h),
          Text(
            "Order date : 18-06-2021",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 2.h),
          Text(
            "YOUR FOLIO NUMBER",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 0.5.h),
          Text(
            "PROLLN-028976",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Text(
            "Next installment date : 18-06-2021",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 4.h),
          const Text(
            "You can dowanload the receipt and check status of your schemes from MYOLOCKER section on this app.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ).commonSymmetricPadding(horizontal: 15, vertical: 30),
    );
  }
}

class PaymentSuccessDetailsCustom extends StatelessWidget {
  String text;
  String amount;

  PaymentSuccessDetailsCustom({
    Key? key,
    required this.text,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 7,
          child: Text(
            text,
            style: TextStyle(fontSize: 12.sp),
          )),
      Expanded(
        flex: 3,
        child: Text(
          amount,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.blueDarkColor,
              fontSize: 12.sp),
        ),
      ),
    ]);
  }
}
