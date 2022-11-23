import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';

class MySchemesDetailsScreenModule extends StatelessWidget {
  const MySchemesDetailsScreenModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
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
                      color: AppColors.waGreenColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    "Follo Number",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    "AJMJ-16",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              SizedBox(height: 2.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Akshay Jewels,Jalgaon",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ).commonOnlyPadding(left: 15, right: 15),
              SizedBox(height: 1.h),
              SavingDetailsScreenDateTextCustom(
                text: '24 June 2020',
                date: "Start date",
              ),
              SizedBox(height: 1.h),
              SavingDetailsScreenDateTextCustom(
                date: "Maturity date",
                text: '24 June 2021',
              ),
              SizedBox(height: 1.h),
              SavingDetailsScreenDateTextCustom(
                date: "Next payment date",
                text: '24 June 2021',
              ),
              SizedBox(height: 2.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: LinearPercentIndicator(
                  animation: true,
                  lineHeight: 10,
                  animationDuration: 2000,
                  percent: 0.7,
                  barRadius: const Radius.circular(10),
                  progressColor: AppColors.greenTintColor,
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SavinScreenDetailsgAmountDetailsCustom(
                    price: "₹ 250000",
                    text: "Maturity amount",
                    color: AppColors.blueDarkColor,
                  ),
                  SavinScreenDetailsgAmountDetailsCustom(
                    price: "₹ 25000",
                    text: "Total paid",
                    color: AppColors.orangeColor,
                  ),
                  SavinScreenDetailsgAmountDetailsCustom(
                    price: "₹ 2500",
                    text: "Monthly amount",
                    color: AppColors.waGreenColor,
                  ),
                ],
              ),
            ],
          ).commonAllSidePadding(20),
        ),
        SizedBox(height: 2.h),
        const SencoPaymentDetailsImageModule(),
        SizedBox(height: 3.h),
        Row(
          children: [
            SavingDetailsButtonCustom(
              color: AppColors.greenTintColor,
              text: "MAKE PAYMENT",
              onPressed: () {},
            ),
            SizedBox(width: 4.w),
            SavingDetailsButtonCustom(
              color: AppColors.orangeColor,
              text: "REFUND",
              onPressed: () {},
            ),
          ],
        ).commonSymmetricPadding(horizontal: 10),
        SizedBox(height: 3.h),
        Row(
          children: [
            Text(
              "TRANSACTIONS",
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ).commonOnlyPadding(left: 30),
        SizedBox(height: 2.h),
        MySchemesDetailsListViewModule(
          index: 0,
        )
      ],
    );
  }
}

class SencoPaymentDetailsImageModule extends StatelessWidget {
  const SencoPaymentDetailsImageModule({Key? key}) : super(key: key);

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
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  "118/8, JNL Road",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
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
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ).commonSymmetricPadding(horizontal: 20, vertical: 10),
    );
  }
}

class MySchemesDetailsListViewModule extends StatelessWidget {
  const MySchemesDetailsListViewModule({Key? key, required this.index})
      : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: index.floor().isEven
                ? AppColors.blueTintColor
                : AppColors.pinkTintColor,
          ),
          child: Container(
            margin: EdgeInsets.only(left: 3.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      '31',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.orangeColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'SEP',
                      style: TextStyle(
                          fontSize: 10.sp, color: AppColors.orangeColor),
                    ),
                    Text(
                      '2021',
                      style: TextStyle(
                          fontSize: 10.sp, color: AppColors.orangeColor),
                    )
                  ],
                ),
                SizedBox(width: 2.w),
                Expanded(
                  flex: 65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PROLLN-028979",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Reference Number",
                        style: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.w400),
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
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                // Spacer(),
                SizedBox(width: 10.w, child: Image.asset(AppImages.pdfImage))
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 25,
            width: 4,
            color: AppColors.orangeColor,
          )
        ],
      ),
    );
  }
}

class SavingDetailsScreenDateTextCustom extends StatelessWidget {
  final String date;
  final String text;
  SavingDetailsScreenDateTextCustom({
    Key? key,
    required this.date,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
        ),
        Spacer(),
        Text(
          text,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
        ),
      ],
    ).commonOnlyPadding(left: 15, right: 15);
  }
}

class SavinScreenDetailsgAmountDetailsCustom extends StatelessWidget {
  final String price;
  final String text;
  final Color color;
  SavinScreenDetailsgAmountDetailsCustom({
    Key? key,
    required this.price,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          price,
          style: TextStyle(
              fontSize: 13.sp, color: color, fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class SavingDetailsButtonCustom extends StatelessWidget {
  final String text;
  final Color color;
  Function()? onPressed;
  SavingDetailsButtonCustom({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child: SizedBox(
          height: 6.h,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27)),
                  primary: color),
              onPressed: () {},
              child: Text(
                text,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
              )),
        ));
  }
}
