import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/screens/my_saving_schemes_screens/my_schemes_details_screen/my_schemes_details_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/my_saving_schemes_screens_controllers/my_saving_schemes_list_screen_controller.dart';

class MySchemesListViewModule extends StatelessWidget {
  MySchemesListViewModule({Key? key}) : super(key: key);

  final mySavingSchemesListScreenController =
      Get.find<MySavingSchemesListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return index.floor().isEven
            ? SingleSchemeItemModule(index: index)
            : MaturedSchemeItemModule(index: index);
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
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
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
                    "AJMJ-16",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
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
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  ColoredCustomButton(
                    color: AppColors.greenTintColor,
                    text: "MAKE PAYMENT",
                    onPressed: () {},
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
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
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
                    "ABJX-99",
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
                children: const [
                  AmountDetailsColoredColumn(
                    price: "₹ 250000",
                    text: "Maturity amount",
                    color: AppColors.blueDarkColor,
                  ),
                  AmountDetailsColoredColumn(
                    price: "₹ 225000",
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


// matured saivings schemes plan widget


// SizedBox(height: 2.h),
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: AppColors.whiteColor),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     height: 15,
//                     width: 15,
//                     decoration: const BoxDecoration(
//                       color: AppColors.orangeColor,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   SizedBox(width: 2.w),
//                   Text(
//                     "Follo Number",
//                     style:
//                         TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
//                   ),
//                   SizedBox(width: 1.w),
//                   Text(
//                     "AJMJ-16",
//                     style:
//                         TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
//                   ),
//                   const Spacer(),
//                   SizedBox(
//                     height: 25,
//                     width: 25,
//                     child: Image.asset(AppIcons.rightSideImage),
//                   )
//                 ],
//               ),
//               const Divider(color: Colors.grey),
//               SizedBox(height: 2.h),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Akshay Jewels,Jalgaon",
//                     style:
//                         TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ).commonOnlyPadding(left: 15, right: 15),
//               SizedBox(height: 1.h),
//               MySavingScreenDateTextCustom(
//                 text: '24 June 2020',
//                 date: "Start date",
//               ),
//               SizedBox(height: 1.h),
//               MySavingScreenDateTextCustom(
//                 date: "Maturity date",
//                 text: '24 June 2021',
//               ),
//               SizedBox(height: 2.h),
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   const Divider(
//                     color: AppColors.orangeColor,
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       height: 5.h,
//                       width: 35.w,
//                       decoration: BoxDecoration(
//                         color: AppColors.orangeColor,
//                         borderRadius: BorderRadius.circular(27),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           "MATURED",
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 2.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   MySavinScreengAmountDetailsCustom(
//                     price: "₹ 250000",
//                     text: "Maturity amount",
//                     color: AppColors.blueDarkColor,
//                   ),
//                   MySavinScreengAmountDetailsCustom(
//                     price: "₹ 25000",
//                     text: "Total paid",
//                     color: AppColors.orangeColor,
//                   ),
//                   MySavinScreengAmountDetailsCustom(
//                     price: "₹ 2500",
//                     text: "Monthly amount",
//                     color: AppColors.waGreenColor,
//                   ),
//                 ],
//               ),
//             ],
//           ).commonAllSidePadding(20),
//         ),