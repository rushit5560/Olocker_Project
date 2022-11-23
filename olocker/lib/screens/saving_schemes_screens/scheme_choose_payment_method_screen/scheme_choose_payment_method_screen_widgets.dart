import 'package:flutter/material.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';

class SencoPaymentImageModule extends StatelessWidget {
  const SencoPaymentImageModule({Key? key}) : super(key: key);

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

enum PaymentMethods { Paytm, Gpay, Amazon, VisaImage, CashImage }

class AmountDetailsModule extends StatefulWidget {
  const AmountDetailsModule({Key? key}) : super(key: key);

  @override
  State<AmountDetailsModule> createState() => _AmountDetailsModuleState();
}

class _AmountDetailsModuleState extends State<AmountDetailsModule> {
  PaymentMethods? _character = PaymentMethods.Paytm;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteColor),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                    flex: 7,
                    child: Text(
                      "Monthly Installment",
                      style: TextStyle(fontSize: 13.sp),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      '₹ 2500',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueDarkColor,
                          fontSize: 13.sp),
                    ))
              ]),
              SizedBox(height: 1.h),
              Row(children: [
                Expanded(
                    flex: 7,
                    child: Text(
                      "Balance Payable at matunly",
                      style: TextStyle(fontSize: 12.sp),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      '₹ 32500',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueDarkColor,
                          fontSize: 12.sp),
                    ))
              ]),
              SizedBox(height: 1.h),
              Row(children: [
                Expanded(
                    flex: 7,
                    child: Text(
                      "Tenure",
                      style: TextStyle(fontSize: 12.sp),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      '12 months',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueDarkColor,
                          fontSize: 12.sp),
                    ))
              ]),
              SizedBox(height: 1.h),
              Row(children: [
                Expanded(
                    flex: 7,
                    child: Text(
                      "Starting Date",
                      style: TextStyle(fontSize: 12.sp),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      '21 july 2021',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueDarkColor,
                          fontSize: 12.sp),
                    ))
              ]),
              SizedBox(height: 1.h),
              Row(children: [
                Expanded(
                    flex: 7,
                    child: Text(
                      "Maturity Date",
                      style: TextStyle(fontSize: 12.sp),
                    )),
                Expanded(
                    flex: 3,
                    child: Text(
                      '21 july 2021',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueDarkColor,
                          fontSize: 12.sp),
                    ))
              ]),
            ],
          ).commonAllSidePadding(15),
        ),
        SizedBox(height: 2.h),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteColor),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Total Payble",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      // color: AppColors.blueDarkColor,
                      fontSize: 18.sp),
                ),
                Text(
                  '₹ 32500',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blueDarkColor,
                      fontSize: 18.sp),
                )
              ]),
              SizedBox(height: 3.h),
              Row(
                children: [
                  Text("Payment medthos"),
                ],
              ),
              Column(
                children: <Widget>[
                  RadioListTile<PaymentMethods>(
                    dense: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                          child: Image.asset(AppImages.paytmImage),
                        ),
                      ],
                    ),
                    value: PaymentMethods.Paytm,
                    groupValue: _character,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  RadioListTile<PaymentMethods>(
                    title: SizedBox(
                        height: 20, child: Image.asset(AppImages.gpayImage)),
                    value: PaymentMethods.Gpay,
                    groupValue: _character,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  RadioListTile<PaymentMethods>(
                    title: SizedBox(
                        height: 20, child: Image.asset(AppImages.amoZonImage)),
                    value: PaymentMethods.Amazon,
                    groupValue: _character,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  RadioListTile<PaymentMethods>(
                    title: SizedBox(
                        height: 20, child: Image.asset(AppImages.visaImage)),
                    value: PaymentMethods.VisaImage,
                    groupValue: _character,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  RadioListTile<PaymentMethods>(
                    title: SizedBox(
                        height: 20, child: Image.asset(AppImages.cashImage)),
                    value: PaymentMethods.CashImage,
                    groupValue: _character,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ).commonAllSidePadding(18),
        )
      ],
    );
  }
}
