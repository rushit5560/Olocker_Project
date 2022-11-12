import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_loyalty_point_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

class LoyaltyPointListModule extends StatelessWidget {
  LoyaltyPointListModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerLoyaltyPointScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.loyaltyPointList.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        String imgUrl = ApiUrl.apiMainPath + screenController.loyaltyPointList[i].logoUrl;
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
                style: const TextStyle(color: AppColors.blueDarkColor),
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "TOTAL POINTS",
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                          fontSize: 11.sp,
                                          ),
                                        ),

                                        Text(
                                          screenController.loyaltyPointList[i].totalPoints,
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ],
                                    ).commonSymmetricPadding(horizontal: 10, vertical: 8),
                                  ).commonSymmetricPadding(horizontal: 8, vertical: 5),

                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.orangeColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Redeemed",
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 11.sp,
                                          ),
                                        ),

                                        Text(
                                          screenController.loyaltyPointList[i].totalReedemedPoint,
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ],
                                    ).commonSymmetricPadding(horizontal: 10, vertical: 8),
                                  ).commonSymmetricPadding(horizontal: 8, vertical: 5),

                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.pinkColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Remaining",
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 11.sp,
                                          ),
                                        ),

                                        Text(
                                          screenController.loyaltyPointList[i].totalRemainingPoint,
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ],
                                    ).commonSymmetricPadding(horizontal: 10, vertical: 8),
                                  ).commonSymmetricPadding(horizontal: 8, vertical: 5),
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
