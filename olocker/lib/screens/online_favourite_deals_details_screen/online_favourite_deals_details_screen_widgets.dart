import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/online_favourite_deals_details_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/common_widgets.dart';

class FavouriteActivateDealButtonModule extends StatelessWidget {
  FavouriteActivateDealButtonModule({Key? key}) : super(key: key);
  final onlineFavouriteDealsDetailsScreenController =
      Get.find<OnlineFavouriteDealsDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            Clipboard.setData(
              ClipboardData(text: onlineFavouriteDealsDetailsScreenController.favDealsDetails.dealCode),
            );
            CommonWidgets().showBorderSnackBar(context: Get.context!, displayText: "Successfully Copied.");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.accentColor,
            ),
            child: Column(
              children: [
                Text(
                  'COUPON CODE',
                  style: TextStyle(
                    fontSize: 6.sp,
                    fontFamily: "Roboto",
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  onlineFavouriteDealsDetailsScreenController
                      .favDealsDetails.dealCode,
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontFamily: "Roboto",
                  ),
                ),
              ],
            ).commonSymmetricPadding(horizontal: 15, vertical: 12),
          ),
        ),
      ],
    );
  }
}
