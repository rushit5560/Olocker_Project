import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_state_button/multi_state_button.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/online_deals_details_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

class ActivateDealButtonModule extends StatelessWidget {
  ActivateDealButtonModule({Key? key}) : super(key: key);
  final onlineDealsDetailsScreenController =
      Get.find<OnlineDealsDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // GestureDetector(
        //   onTap: () async {
        //     await onlineDealsDetailsScreenController
        //         .addOnlineDealInFavouriteFunction();
        //   },
        //   child: Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(20),
        //       color: AppColors.accentColor,
        //     ),
        //     child: const Text(
        //       'ACTIVATE DEAL',
        //       style: TextStyle(
        //         color: AppColors.whiteColor,
        //       ),
        //     ).commonSymmetricPadding(horizontal: 15, vertical: 12),
        //   ),
        // ),
        MultiStateButton(
          multiStateButtonController:
              onlineDealsDetailsScreenController.multiStateButtonController,
          buttonStates: [
            ButtonState(
              stateName: onlineDealsDetailsScreenController.activateStart,
              child: Text(
                'ACTIVATE DEAL',
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ).commonSymmetricPadding(horizontal: 8.w, vertical: 1.5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: AppColors.accentColor,
              ),
              onPressed: () async {
                await onlineDealsDetailsScreenController
                    .addOnlineDealInFavouriteFunction();
              },
            ),
            // ButtonState(
            //   stateName: onlineDealsDetailsScreenController.activateLoading,
            //   alignment: Alignment.center,
            //   child: const CircularProgressIndicator(
            //     strokeWidth: 2,
            //     color: Colors.white,
            //   ).commonSymmetricPadding(horizontal: 15, vertical: 12),
            //   textStyle: TextStyle(
            //     color: Colors.white,
            //     fontSize: 13.sp,
            //     fontWeight: FontWeight.w500,
            //   ),
            //   size: Size(45.w, 6.h),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(28),
            //     color: AppColors.accentColor,
            //   ),
            //   onPressed: () {
            //     onlineDealsDetailsScreenController
            //             .multiStateButtonController.setButtonState =
            //         onlineDealsDetailsScreenController.activateSuccess;
            //   },
            // ),
            ButtonState(
              stateName: onlineDealsDetailsScreenController.activateSuccess,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'COUPON CODE',
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: AppColors.whiteColor,
                      fontSize: 8.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  SizedBox(
                    width: 50.w,
                    height: 5.h,
                    child: Text(
                      onlineDealsDetailsScreenController
                          .onLineDealDetails.dealCode
                          .trim(),
                      style: TextStyle(
                        fontFamily: "Roboto",
                        color: AppColors.whiteColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ).commonSymmetricPadding(horizontal: 8.w, vertical: 1.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: AppColors.accentColor,
              ),
              onPressed: () {
                onlineDealsDetailsScreenController.copyCouponCode(
                  onlineDealsDetailsScreenController.onLineDealDetails.dealCode
                      .trim(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
