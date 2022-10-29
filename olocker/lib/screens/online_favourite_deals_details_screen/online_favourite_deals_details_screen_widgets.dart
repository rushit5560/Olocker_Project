import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/online_favourite_deals_details_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';


class FavouriteActivateDealButtonModule extends StatelessWidget {
  FavouriteActivateDealButtonModule({Key? key}) : super(key: key);
  final onlineFavouriteDealsDetailsScreenController
  = Get.find<OnlineFavouriteDealsDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            // await onlineFavouriteDealsDetailsScreenController.addOnlineDealInFavouriteFunction();
            Clipboard.setData(ClipboardData(text: onlineFavouriteDealsDetailsScreenController.favDealsDetails.dealCode));
            const snackBar = SnackBar(content: Text('Successful copied'),
              behavior: SnackBarBehavior.floating,);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                    color: AppColors.whiteColor,
                    fontSize: 6.sp,
                  ),
                ),
                Text(
                  onlineFavouriteDealsDetailsScreenController.favDealsDetails.dealCode,
                  style: const TextStyle(color: AppColors.whiteColor),
                ),
              ],
            ).commonSymmetricPadding(horizontal: 15, vertical: 12),
          ),
        ),
      ],
    );
  }
}