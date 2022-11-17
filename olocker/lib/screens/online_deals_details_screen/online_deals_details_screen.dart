import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/online_deals_details_screen_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'online_deals_details_screen_widgets.dart';

class OnlineDealsDetailsScreen extends StatelessWidget {
  OnlineDealsDetailsScreen({Key? key}) : super(key: key);
  final onlineDealsDetailsScreenController =
      Get.put(OnlineDealsDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: const Text(
          'Deal Details',
          style: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.normal,
          ),
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
              data: onlineDealsDetailsScreenController
                  .onLineDealDetails.termsAndCondition,
              shrinkWrap: true,
              onLinkTap: (url, context, attributes, element) async {
                // var url = Uri.parse(url);
                await launchUrl(Uri.parse(url.toString()));
                // if (await canLaunchUrl(Uri.parse(url.toString()))) {
                // } else {
                //   throw 'Could not launch $url';
                // }
              },
            ),
            SizedBox(height: 5.h),
            ActivateDealButtonModule(),
            SizedBox(height: 5.h),
          ],
        ) /*.commonAllSidePadding(8)*/,
      ),
    );
  }
}
