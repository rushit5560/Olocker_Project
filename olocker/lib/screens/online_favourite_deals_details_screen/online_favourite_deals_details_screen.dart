import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/online_favourite_deals_details_screen_controller.dart';
import 'package:sizer/sizer.dart';

import 'online_favourite_deals_details_screen_widgets.dart';

class OnlineFavouriteDealsDetailsScreen extends StatelessWidget {
  OnlineFavouriteDealsDetailsScreen({Key? key}) : super(key: key);
  final onlineFavouriteDealsDetailsScreenController
  = Get.put(OnlineFavouriteDealsDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: const Text(
          'Deal Details',
          style: TextStyle(color: AppColors.blackColor),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Html(
              data: onlineFavouriteDealsDetailsScreenController
                  .favDealsDetails.termsAndCondition,
            ),
            SizedBox(
              height: onlineFavouriteDealsDetailsScreenController.size.height * 0.01.h,
            ),

            FavouriteActivateDealButtonModule(),


          ],
        ),
      ),

    );
  }
}
