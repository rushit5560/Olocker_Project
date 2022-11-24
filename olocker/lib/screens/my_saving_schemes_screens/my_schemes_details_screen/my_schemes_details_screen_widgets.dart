import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/screens/my_saving_schemes_screens/my_scheme_pending_payment_screen/my_scheme_pending_payment_screen.dart';

import 'package:olocker/utils/extensions.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../controllers/my_saving_schemes_screens_controllers/my_schemes_details_screen_controller.dart';

class MySchemesDetailsModule extends StatelessWidget {
  MySchemesDetailsModule({Key? key}) : super(key: key);

  final mySchemePendingPaymentScreenController =
      Get.find<MySchemesDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteColor),
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
                    "AJMJ-16",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
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
                          "Akshay Jewels, Jalgaon",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.5.h),
                    const SavingDetailsTextCustom(
                      text: "Start date",
                      textValue: '24 June 2020',
                    ),
                    SizedBox(height: 1.h),
                    const SavingDetailsTextCustom(
                      text: "Maturity date",
                      textValue: '24 June 2022',
                    ),
                    SizedBox(height: 1.h),
                    const SavingDetailsTextCustom(
                      text: "Next payment date",
                      textValue: '24 June 2021',
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
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AmountDetailsColoredColumn(
                    price: "₹ 250000",
                    text: "Maturity amount",
                    color: AppColors.blueDarkColor,
                  ),
                  AmountDetailsColoredColumn(
                    price: "₹ 25000",
                    text: "Total paid",
                    color: AppColors.orangeColor,
                  ),
                  AmountDetailsColoredColumn(
                    price: "₹ 2500",
                    text: "Monthly amount",
                    color: AppColors.waGreenColor,
                  ),
                ],
              ),
              SizedBox(height: 1.h),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        SencoPaymentDetailsImageModule(),
        SizedBox(height: 2.h),
        Row(
          children: [
            ColoredCustomButton(
              color: AppColors.greenTintColor,
              text: "MAKE PAYMENT",
              onPressed: () {
                Get.to(
                  () => MySchemePendingPaymentScreen(),
                );
              },
            ),
            SizedBox(width: 4.w),
            ColoredCustomButton(
              color: AppColors.orangeColor,
              text: "REFUND",
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            Text(
              "TRANSACTIONS",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.blueDarkColor,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ).commonOnlyPadding(left: 25),
        SizedBox(height: 2.h),
        MySchemesTransactionsListViewModule()
      ],
    );
  }
}

class SencoPaymentDetailsImageModule extends StatelessWidget {
  SencoPaymentDetailsImageModule({Key? key}) : super(key: key);

  final mySchemePendingPaymentScreenController =
      Get.find<MySchemesDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Image.asset(AppImages.diamondsIocn),
            ),
          ),
          SizedBox(width: 1.h),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Senco Gold & Diamonds",
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "118/8, JNL Road",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              Uri phoneno = Uri.parse("tel:+91 3322665522");

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
      ).commonSymmetricPadding(horizontal: 20, vertical: 15),
    );
  }
}

class MySchemesTransactionsListViewModule extends StatelessWidget {
  MySchemesTransactionsListViewModule({Key? key}) : super(key: key);

  final mySchemePendingPaymentScreenController =
      Get.find<MySchemesDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return TransationSingleItemModule(
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
    );
  }
}

class TransationSingleItemModule extends StatelessWidget {
  TransationSingleItemModule({Key? key, required this.index}) : super(key: key);

  final int index;

  final mySchemePendingPaymentScreenController =
      Get.find<MySchemesDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                children: [
                  Text(
                    '31',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'SEP',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '2021',
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )
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
                    "PROLLN-028979",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.blueDarkColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5),
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
            SizedBox(width: 2.w),
            Expanded(
              flex: 35,
              child: Text(
                "₹ 2500",
                style: TextStyle(
                  fontSize: 15.sp,
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
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 12.sp,
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
