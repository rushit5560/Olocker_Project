import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/notification_screen_controller.dart';
import '../../models/enquire_screen_models/get_all_message_model.dart';

class NotificationsListModule extends StatelessWidget {
  NotificationsListModule({Key? key}) : super(key: key);

  final notificationScreenController = Get.find<NotificationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => notificationScreenController.isLoading.value
          ? NotificationScreenLoadingWidget()
          : ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
          ? NotificationScreenLoadingWidget()
          : GestureDetector(
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
                decoration: BoxDecoration(
                  color: singleMsg.isRead
                      ? AppColors.whiteColor
                      : AppColors.yellowBgColor.withOpacity(0.35),
                ),
                child: Stack(
                  children: [
                    Container(
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
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                              // const SizedBox(height: 3),
                              singleMsg.isAdminNotification
                                  ? Text(
                                      "Admin",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackTextColor,
                                      ),
                                    )
                                  : Container(),
                              singleMsg.isAdminNotification
                                  ? Container()
                                  : const SizedBox(height: 6),
                              SizedBox(
                                width: 72.w,
                                child: Text(
                                  singleMsg.message,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 10.sp,
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
            ),
    );
  }
}

class NotificationScreenLoadingWidget extends StatelessWidget {
  NotificationScreenLoadingWidget({Key? key}) : super(key: key);
  final notificationScreenController = Get.find<NotificationScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 2,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(200),
                        ),
                        child: Container(
                          height: 55,
                          width: 55,
                          color: AppColors.greyColor,
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 10,
                            width: 40.w,
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 10,
                            width: 40.w,
                            color: AppColors.greyColor,
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 10,
                            width: 72.w,
                            color: AppColors.greyColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 2,
                  child: Container(
                    height: 10,
                    width: 20.w,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
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
      ),
    );
  }
}
