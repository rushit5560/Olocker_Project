import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/claim_details_view_screen_controller.dart';

class YourClaimDetailsModule extends StatelessWidget {
  YourClaimDetailsModule({Key? key}) : super(key: key);

  final claimDetailsScreenController =
      Get.put(ClaimDetailsViewScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You Claim Details",
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.blueDarkColor,
            ),
          ),
          const SizedBox(height: 10),
          DetailsRowWidget(
            text: "Sr. No.",
            value: claimDetailsScreenController.claimdata!.claimSrNo,
          ),
          DetailsRowWidget(
            text: "COI No.",
            value: claimDetailsScreenController
                .claimdata!.certificateofInsuranceNo,
          ),
          DetailsRowWidget(
            text: "Item",
            value: claimDetailsScreenController.claimdata!.itemName,
          ),
          DetailsRowWidget(
            text: "Date of Loss",
            value: claimDetailsScreenController.claimdata!.dateOfLoss,
          ),
          DetailsRowWidget(
            text: "Loss Location",
            value: claimDetailsScreenController.claimdata!.lossLocation,
          ),
          DetailsRowWidget(
            text: "Description of Loss",
            value: claimDetailsScreenController.claimdata!.descriptionOfLoss,
          ),
          DetailsRowWidget(
            text: "Claim Amount",
            value: claimDetailsScreenController.claimdata!.claimAmount,
          ),
          DetailsRowWidget(
            text: "Claim Status",
            value: claimDetailsScreenController.claimdata!.claimStatus,
          ),
          DetailsRowWidget(
            text: "Description",
            value: claimDetailsScreenController.claimdata!.description,
          ),
        ],
      ),
    );
  }
}

class DetailsRowWidget extends StatelessWidget {
  const DetailsRowWidget({Key? key, required this.text, required this.value})
      : super(key: key);

  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.greyDarkColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            ":   ",
            style: TextStyle(
              color: AppColors.greyDarkColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClaimDetailsLoadingWidget extends StatelessWidget {
  const ClaimDetailsLoadingWidget({Key? key}) : super(key: key);

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
                height: 52.h,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration:const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius:  BorderRadius.all(
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
