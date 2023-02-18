import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/all_loyalty_point_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class AllLoyaltyPointListModule extends StatelessWidget {
  AllLoyaltyPointListModule({Key? key}) : super(key: key);
  final screenController = Get.find<AllLoyaltyPointScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.loyaltyPointList.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        String imgUrl =
            ApiUrl.apiMainPath + screenController.loyaltyPointList[i].logoUrl;
        String redeemedPoint = "";

        if(screenController.loyaltyPointList[i].totalReedemedPoint.contains(".")) {
          redeemedPoint = screenController.loyaltyPointList[i].totalReedemedPoint.split(".")[0];
        } else {
          redeemedPoint = screenController.loyaltyPointList[i].totalReedemedPoint;
        }


        return Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                screenController.loyaltyPointList[i].partner,
                style: const TextStyle(
                  color: AppColors.blueDarkColor,
                  fontFamily: "Roboto",
                ),
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Row(
                    children: [
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 9,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 2,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.centerLeft,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.blueDarkColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "TOTAL POINTS",
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            color: AppColors.whiteColor,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                        Text(
                                          screenController
                                              .loyaltyPointList[i].totalPoints,
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            color: AppColors.whiteColor,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ],
                                    ).commonSymmetricPadding(
                                        horizontal: 10, vertical: 8),
                                  ).commonSymmetricPadding(
                                      horizontal: 8, vertical: 5),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.orangeColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Redeemed",
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                        Text(
                                          redeemedPoint,
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            color: AppColors.whiteColor,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ],
                                    ).commonSymmetricPadding(
                                        horizontal: 10, vertical: 8),
                                  ).commonSymmetricPadding(
                                      horizontal: 8, vertical: 5),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.pinkColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Remaining",
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            color: AppColors.whiteColor,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                        Text(
                                          screenController.loyaltyPointList[i]
                                              .totalRemainingPoint,
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            color: AppColors.whiteColor,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ],
                                    ).commonSymmetricPadding(
                                        horizontal: 10, vertical: 8),
                                  ).commonSymmetricPadding(
                                      horizontal: 8, vertical: 5),
                                ],
                              ).commonOnlyPadding(left: 50),

                              /*Positioned(
                                left: -25,
                                child: Container(
                                  height: screenController.size.width * 0.035.w,
                                  width: screenController.size.width * 0.035.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // border: Border.all(color: Colors.grey),
                                    boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurStyle: BlurStyle.outer,
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                    ),
                                    ],
                                    image: DecorationImage(
                                      image: NetworkImage(imgUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),*/
                            ],
                          ),
                        ).commonSymmetricPadding(vertical: 10),
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: screenController.size.width * 0.035.w,
                          width: screenController.size.width * 0.035.w,
                          // alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // border: Border.all(color: Colors.grey),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurStyle: BlurStyle.outer,
                                blurRadius: 2,
                                // spreadRadius: 2,
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(imgUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(flex: 8, child: Container()),
                    ],
                  ),
                ],
              ),
            ],
          ).commonAllSidePadding(10),
        ).commonAllSidePadding(5);
      },
    );
  }
}

class AllLoyaltyPointsLoadingWidget extends StatelessWidget {
  const AllLoyaltyPointsLoadingWidget({Key? key}) : super(key: key);

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
              ListView.builder(
                itemCount: 2,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Container(
                    height: 22.h,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ).commonAllSidePadding(5);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
