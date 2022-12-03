import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
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
          width: referAndEarnScreenController.size.width * 0.88,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 3.h),
        Text(
          "Get 100 Points",
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          "For every new user you refer",
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          "Share your referal link and earn 100 points",
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 2.h),
        Container(
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
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  referAndEarnScreenController.copyRefferalCode();
                },
                icon: Icon(
                  Icons.copy,
                  color: AppColors.greyColor,
                  size: 15.sp,
                ),
              ),
              Expanded(
                child: Text(
                  referAndEarnScreenController.userReferaalCode.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
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
                    "${referAndEarnScreenController.loyalityPlan!.valuePerPoint} Loyalty Point is equal to Rs. ${referAndEarnScreenController.loyalityPlan!.valuePerPoint}",
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            benefitText,
            style: TextStyle(
              color: AppColors.accentColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            benefitDescription,
            style: TextStyle(
              color: AppColors.blackTextColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
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
            await referAndEarnScreenController.shareReferUserFunction();
          },
          child: Center(
            child: Text(
              "Share",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
