import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/notification_screen_controller.dart';
import 'notification_screen_widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationScreenController = Get.put(NotificationScreenController());
  @override
  void initState() {
    notificationScreenController.getAllNotificationsFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyleConfig.appbarTextStyle(),
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
                  child:
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
                ),
              ),
      ),
    );
  }
}
