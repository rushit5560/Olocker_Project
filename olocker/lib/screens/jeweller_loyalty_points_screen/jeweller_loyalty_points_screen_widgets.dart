import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_images.dart';
import '../../controllers/jeweller_loyalty_point_screen_controller.dart';
import '../../models/jeweller_loyalty_point_screen_models/loyalty_point_model.dart';

class JewellerLoyaltyPointsModule extends StatelessWidget {
  JewellerLoyaltyPointsModule({Key? key}) : super(key: key);
  final screenController = Get.put(JewellerLoyaltyPointScreenController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                screenController.loyaltyPoints!.partner,
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.whiteColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: screenController.size.height * 0.35,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: screenController.size.height * 0.275,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: screenController.size.width * 0.24,
                              width: screenController.size.width * 0.24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.accentColor,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.greyColor.withOpacity(0.75),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  screenController.loyaltyPoints!.totalPoints
                                      .toString(),
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.5.h),
                            Text(
                              "total points".toUpperCase(),
                              style: TextStyle(
                                fontFamily: "Roboto-Medium",
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "redeemed".toUpperCase(),
                              style: TextStyle(
                                fontFamily: "Roboto-Medium",
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            Text(
                              screenController.loyaltyPoints!.totalReedemedPoint
                                  .toString()
                                  .split(".")[0],
                              style: TextStyle(
                                fontFamily: "Roboto-Medium",
                                color: AppColors.accentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: screenController.size.width * 0.24,
                              width: screenController.size.width * 0.24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.accentColor,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.greyColor.withOpacity(0.75),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  screenController
                                      .loyaltyPoints!.totalRemainingPoint
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: "Roboto-Medium",
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.5.h),
                            Text(
                              "remaining".toUpperCase(),
                              style: TextStyle(
                                fontFamily: "Roboto-Medium",
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: screenController.size.width * 0.3,
                  width: screenController.size.width * 0.3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(200),
                    ),
                    child: CachedNetworkImage(
                        imageUrl: ApiUrl.apiImagePath +
                            screenController.loyaltyPoints!.logoUrl),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              AppImages.loyaltyPointTitleBGImage,
              width: screenController.size.width * 0.65,
              height: 35,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Points earned summary",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.blackColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        PointsEarnedSummaryTable(),
        SizedBox(height: 1.5.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "* Note : 1 Loyalty Point = 1 INR",
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.whiteColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class PointsEarnedSummaryTable extends StatelessWidget {
  PointsEarnedSummaryTable({Key? key}) : super(key: key);

  final screenController = Get.put(JewellerLoyaltyPointScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      // padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(AppImages.loyaltyTableTitleHeaderBGImage),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Date",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: AppColors.blackTextColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Points",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: AppColors.blackTextColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Ocassion",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: AppColors.blackTextColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Expiry Date",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: AppColors.blackTextColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
                screenController.loyaltyPoints!.pointsEarnedSummary.length,
            itemBuilder: (context, index) {
              var singleEranedPoint =
                  screenController.loyaltyPoints!.pointsEarnedSummary[index];
              return SingleEarnedPointTile(
                singleEarnedPoint: singleEranedPoint,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}

class SingleEarnedPointTile extends StatelessWidget {
  SingleEarnedPointTile(
      {Key? key, required this.singleEarnedPoint, required this.index})
      : super(key: key);

  final PointsEarnedSummary singleEarnedPoint;
  final int index;

  final screenController = Get.put(JewellerLoyaltyPointScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: index.floor().isEven
            ? const Color(0xFFE6E6E6)
            : const Color(0xFFDBDBDB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(index ==
                  screenController.loyaltyPoints!.pointsEarnedSummary.length - 1
              ? 12
              : 0),
          bottomRight: Radius.circular(
            index ==
                    screenController.loyaltyPoints!.pointsEarnedSummary.length -
                        1
                ? 12
                : 0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                singleEarnedPoint.dateAdded.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.blackTextColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Text(
                singleEarnedPoint.points.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.blackTextColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Text(
                singleEarnedPoint.creditType.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.blackTextColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Text(
                singleEarnedPoint.pointExpiryDate.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.blackTextColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyLoyaltyPointsLoadingWidget extends StatelessWidget {
  MyLoyaltyPointsLoadingWidget({Key? key}) : super(key: key);

  final screenController = Get.find<JewellerLoyaltyPointScreenController>();

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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 35,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenController.size.height * 0.35,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: screenController.size.height * 0.275,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: screenController.size.width * 0.3,
                        width: screenController.size.width * 0.3,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(200),
                          ),
                          child: Container(color: AppColors.greyColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  SizedBox(width: 10),
                  Image.asset(
                    AppImages.loyaltyPointTitleBGImage,
                    width: screenController.size.width * 0.65,
                    height: 35,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Container(
                height: 8.h,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 1.5.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 20,
                  width: 70.w,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
