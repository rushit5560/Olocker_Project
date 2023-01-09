import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/notification_screen_controller.dart';
import 'notification_screen_widgets.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  final notificationScreenController = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Obx(
        () => notificationScreenController.isLoading.value
            ? NotificationScreenLoadingWidget()
            : LiquidPullToRefresh(
                height: 5.h,
                onRefresh:
                    notificationScreenController.getAllNotificationsFunction,
                showChildOpacityTransition: false,
                springAnimationDurationInMilliseconds: 500,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      notificationScreenController.getNotificationList.isEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 35.h),
                              child: const Center(
                                child: Text(
                                  "No New Notifications Available",
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                            )
                          : NotificationsListModule(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
