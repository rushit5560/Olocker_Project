
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../controllers/offline_deals_list_screen_controller.dart';
import '../offline_deals_details_screen/offline_deals_details_screen.dart';

class AllOfflineDealsHeaderModule extends StatelessWidget {
  AllOfflineDealsHeaderModule({Key? key}) : super(key: key);
  final screenController = Get.find<OfflineDealsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'All Deals',
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 11.sp,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Deal Partner',
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 9.sp,
              ),
            ),
            Image.asset(
              AppIcons.grabOnIcon,
              width: screenController.size.width * 0.055.w,
            ),
          ],
        ),
      ],
    );
  }
}



class AllOfflineDealsListModule extends StatelessWidget {
  AllOfflineDealsListModule({Key? key}) : super(key: key);
  final screenController = Get.find<OfflineDealsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.singleDealList.offLineDeals.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () => Get.to(
                () => OfflineDealsDetailsScreen(),
            arguments: screenController.singleDealList.offLineDeals[i],
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(),
                  ),
                  // Rectangle Module
                  Expanded(
                    flex: 90,
                    child: Container(
                      height: screenController.size.height * 0.011.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.blackColor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            // spreadRadius: 2,
                            blurRadius: 2,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenController.size.width * 0.025.w,
                          right: screenController.size.width * 0.012.w,
                          top: screenController.size.height * 0.0012.h,
                          bottom: screenController.size.height * 0.0012.h,
                        ),
                        child: Text(
                          "screenController.singleDealList.offLineDeals[i].couponHeading",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenController.size.height * 0.011.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Circle Module
                    Expanded(
                      flex: 22,
                      child: Container(
                        height: screenController.size.height * 0.009.h,
                        width: screenController.size.height * 0.009.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.blackColor),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              // spreadRadius: 2,

                              blurRadius: 2,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                               "${ApiUrl.apiImagePath}${screenController.singleDealList.categoryImage}",
                              ),
                            ),
                          ),
                        ).commonAllSidePadding(4),
                      ),
                    ),
                    Expanded(
                      flex: 80,
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ],
          ).commonSymmetricPadding(vertical: 5),
        );
      },
    );
  }
}
