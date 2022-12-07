import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/notification_screen_controller.dart';
import '../../models/enquire_screen_models/get_all_message_model.dart';
import '../../widgets/common_loader.dart';

class NotificationsListModule extends StatelessWidget {
  NotificationsListModule({Key? key}) : super(key: key);

  final notificationScreenController = Get.find<NotificationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => notificationScreenController.isLoading.value
          ? CommonLoader().showCircularLoader()
          : ListView.separated(
              shrinkWrap: true,
              itemCount:
                  notificationScreenController.getNotificationList.length,
              itemBuilder: (context, index) {
                var singleMsg =
                    notificationScreenController.getNotificationList[index];
                return NotificationItem(
                  singleMsg: singleMsg,
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: AppColors.greyTextColor,
                  height: 5,
                  thickness: 1,
                );
              },
            ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  NotificationItem({Key? key, required this.singleMsg}) : super(key: key);

  final GetNotification singleMsg;

  final notificationScreenController = Get.find<NotificationScreenController>();

  @override
  Widget build(BuildContext context) {
    var msgTime = DateFormat("E, d MMM yyyy").format(singleMsg.timestamp);

    // HH:mm:ss aa
    return Obx(
      () => notificationScreenController.isLoading.value
          ? CommonLoader().showCircularLoader()
          : Container(
              decoration: BoxDecoration(
                color: singleMsg.isRead
                    ? AppColors.whiteColor
                    : AppColors.yellowBgColor.withOpacity(0.35),
              ),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await notificationScreenController
                          .readMarkUserNotificationApiFunction(
                        messageText: singleMsg.message,
                        notificationId: singleMsg.srNo,
                        isPartnerNotification:
                            singleMsg.partnerSrNo == 0 ? false : true,
                        isAdminNotification: singleMsg.isAdminNotification,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(200),
                            ),
                            child: Image.asset(
                              AppImages.womenJewelleryImage,
                              fit: BoxFit.cover,
                              height: 55,
                              width: 55,
                            ),
                          ),
                          SizedBox(width: 3.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                singleMsg.partnerName.capitalizeFirst!,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                singleMsg.isAdminNotification ? "Admin" : "",
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 72.w,
                                child: Text(
                                  singleMsg.message,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.greyTextColor,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 2,
                    child: Text(
                      msgTime.toString(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                        color: AppColors.greyTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
