import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/refer_and_earn_screen_controller.dart';

class ReferAndEarnDetailsModule extends StatelessWidget {
  ReferAndEarnDetailsModule({Key? key}) : super(key: key);

  final referAndEarnScreenController = Get.find<ReferAndEarnScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.referAndEarnImage,
          // height: referAndEarnScreenController.size.height * 0.25,
          // width: referAndEarnScreenController.size.width * 0.88,
          fit: BoxFit.cover,
        ).commonSymmetricPadding(horizontal: 10),
        SizedBox(height: 3.h),
        Text(
          "Get ${referAndEarnScreenController.loyalityPlan!.perReferralPoints} Points",
          style: TextStyle(
            fontFamily: "NexaBold",
            color: AppColors.accentColor,
            fontSize: 19.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        // SizedBox(height: 1.h),
        Text(
          "For every new user you refer",
          style: TextStyle(
            fontFamily: "NexaBold",
            color: AppColors.greyDarkColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        SizedBox(height: 2.5.h),
        Text(
          "Share your referal link and earn ${referAndEarnScreenController.loyalityPlan!.perReferralPoints} points",
          style: TextStyle(
            fontFamily: "NexaBold",
            color: AppColors.greyColor.withOpacity(0.6),
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2.5.h),
        Container(
          width: Get.width,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(28),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyTextColor.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    referAndEarnScreenController.userReferaalCode.value
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Acephimere",
                      color: AppColors.greyColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ).commonSymmetricPadding(vertical: 12),
                ],
              ),
              IconButton(
                onPressed: () {
                  referAndEarnScreenController.copyRefferalCode();
                },
                icon: Icon(
                  Icons.copy,
                  color: AppColors.greyTextColor,
                  size: 15.sp,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 2.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Divider(
            color: AppColors.greyTextColor.withOpacity(0.5),
            thickness: 1,
            height: 10,
          ),
        ),
        SizedBox(height: 2.h),
        referAndEarnScreenController.loyalityPlan!.partnerSrno == 0
            ? const SizedBox()
            : UserBenefitPointsTextModule(
                benefitText:
                    "1 Loyalty Point is equal to Rs. ${referAndEarnScreenController.loyalityPlan!.valuePerPoint}",
                benefitDescription:
                    "You get the loyalty point when your friend registers",
              ),
      ],
    );
  }
}

class UserBenefitPointsTextModule extends StatelessWidget {
  UserBenefitPointsTextModule(
      {Key? key, required this.benefitText, required this.benefitDescription})
      : super(key: key);

  final String benefitText;
  final String benefitDescription;

  final referAndEarnScreenController = Get.find<ReferAndEarnScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            benefitText,
            style: TextStyle(
              color: AppColors.accentColor,
              fontSize: 13.sp,
              fontFamily: "NexaBold",
              fontWeight: FontWeight.bold,
            ),
          ),
          // SizedBox(height: 0.5.h),
          Text(
            benefitDescription,
            style: TextStyle(
              color: AppColors.greyDarkColor,
              fontSize: 10.sp,
              fontFamily: "NexaBold",
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class ShareButtonModule extends StatelessWidget {
  ShareButtonModule({Key? key}) : super(key: key);

  final referAndEarnScreenController = Get.find<ReferAndEarnScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4.w),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () async {
            log("onPressed 1");
            await referAndEarnScreenController.shareReferUserFunction();
            log("onPressed 2");
          },
          child: Center(
            child: Text(
              "Share",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 14.sp,
                fontFamily: "Acephimere",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReferEarnLoadingWidget extends StatelessWidget {
  const ReferEarnLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade50,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: 35.h,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(28),
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 80.w,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              Container(
                height: 15,
                width: 80.w,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              Container(
                height: 15,
                width: 80.w,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              Container(
                height: 60,
                width: 85.w,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
              ),
              Container(
                height: 25,
                width: 85.w,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
              ),
              Container(
                height: 10,
                width: 85.w,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                ),
              ),
              Container(
                height: 60,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
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
