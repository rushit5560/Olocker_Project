import 'package:flutter/material.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/online_deals_details_screen_controller.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/offline_dealse_details_screen_controller.dart';
import 'offline_deals_details_screen_widgets.dart';

class OfflineDealsDetailsScreen extends StatelessWidget {
  OfflineDealsDetailsScreen({Key? key}) : super(key: key);
  final offlineDealsDetailsScreenController =
  Get.put(OfflineDealsDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: Text(
          'Deal Details',
          style: TextStyleConfig.appbarTextStyle(),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HtmlContentViewer(
              htmlContent: offlineDealsDetailsScreenController
                  .offLineDealDetails.termsAndCondition,

              urlLauncherDelegate: (url) {
                return launchUrl(
                  Uri.parse(url.toString()),
                );
              },
              // shrinkWrap: true,
              // onLinkTap: (url, attributes, element) {
              //   launchUrl(
              //     Uri.parse(url.toString()),
              //   );
              // },
              // onLinkTap: (url, context, attributes, element) {
              //   // var url = Uri.parse(url);
              //    launchUrl(Uri.parse(url.toString()));
              //   // if (await canLaunchUrl(Uri.parse(url.toString()))) {
              //   // } else {
              //   //   throw 'Could not launch $url';
              //   // }
              // },
            ),
            SizedBox(height: 5.h),
            ActivateOfflineDealButtonModule(),
            SizedBox(height: 5.h),
          ],
        ) /*.commonAllSidePadding(8)*/,
      ),
    );
  }
}