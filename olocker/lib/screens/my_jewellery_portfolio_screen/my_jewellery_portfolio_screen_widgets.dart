import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/screens/add_uninsured_jewellery_screen/add_uninsured_jewellery_screen.dart';
import 'package:olocker/screens/my_insured_jewellery_screen/my_insured_jewellery_screen.dart';
import 'package:olocker/screens/my_uninsured_jewellery_screen/my_uninsured_jewellery_screen.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/my_jewellery_portfolio_controller.dart';

class TotalJewelleryPortfolioModule extends StatelessWidget {
  TotalJewelleryPortfolioModule({Key? key}) : super(key: key);

  final jewellPortFolioController =
      Get.find<MyJewelleryPortFolioScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.blackColor,
          width: 0.5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Jewellery Portfolio",
            style: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
          const SizedBox(height: 15),
          DetailsRowWidget(
            titleText: "Number of Items",
            valueText: "0",
          ),
          const SizedBox(height: 15),
          DetailsRowWidget(
            titleText: "Insured Input value",
            valueText: "0",
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class DetailsRowWidget extends StatelessWidget {
  DetailsRowWidget({
    Key? key,
    required this.titleText,
    required this.valueText,
  }) : super(key: key);

  final String titleText;
  final String valueText;
  final jewellPortFolioController =
      Get.find<MyJewelleryPortFolioScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: TextStyle(
            color: AppColors.greyDarkColor,
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        ),
        Text(
          valueText,
          style: TextStyle(
            color: AppColors.greyDarkColor,
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}

class MyInsuredJewelleryModule extends StatelessWidget {
  MyInsuredJewelleryModule({Key? key}) : super(key: key);

  final jewellPortFolioController =
      Get.find<MyJewelleryPortFolioScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.blackColor,
          width: 0.5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Insured Jewellery",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => MyInsuredJewelleryScreen());
                },
                child: Text(
                  "VIEW ALL",
                  style: TextStyle(
                    color: AppColors.accentDarkColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                    decoration: TextDecoration.underline,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          DetailsRowWidget(
            titleText: "Number of Items",
            valueText: "0",
          ),
          const SizedBox(height: 15),
          DetailsRowWidget(
            titleText: "Insured Input value",
            valueText: "₹0.00",
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class MyUnInsuredJewelleryModule extends StatelessWidget {
  MyUnInsuredJewelleryModule({Key? key}) : super(key: key);

  final jewellPortFolioController =
      Get.find<MyJewelleryPortFolioScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          margin:
              const EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 16),
          padding:
              const EdgeInsets.only(top: 10, left: 12, right: 12, bottom: 30),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(
              color: AppColors.blackColor,
              width: 0.5,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                12,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Uninsured Jewellery",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => MyUnInsuredJewelleryScreen());
                    },
                    child: Text(
                      "VIEW ALL",
                      style: TextStyle(
                        color: AppColors.accentDarkColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                        decoration: TextDecoration.underline,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              DetailsRowWidget(
                titleText: "Number of Items",
                valueText: "0",
              ),
              const SizedBox(height: 15),
              DetailsRowWidget(
                titleText: "Insured Input value",
                valueText: "0",
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        Align(
          child: GestureDetector(
            onTap: () {
              Get.to(() => AddUnInsuredJewelleryScreen());
            },
            child: Container(
              height: 35,
              width: jewellPortFolioController.size.width * 0.75,
              decoration: const BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    28,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  "ADD NEW JEWELLERY",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
