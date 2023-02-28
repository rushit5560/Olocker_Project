import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import '../constants/api_url.dart';
import '../models/enquire_screen_models/get_all_message_model.dart';

class NotificationScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxBool isLoadingMessage = false.obs;
  RxBool isSuccessMessageStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<GetNotification> getNotificationList = [];

  Future<void> getAllNotificationsFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getAllNotificationApi}?customerId=${UserDetails.customerId}";
    log('getAllNotificationsFunction Api url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getAllNotificationsFunction res body :: ${response.body}");

      GetAllMessageModel getAllMessageModel =
          GetAllMessageModel.fromJson(json.decode(response.body));
      var isSuccessStatus = getAllMessageModel.success.obs;

      if (isSuccessStatus.value) {
        getNotificationList = getAllMessageModel.getNotification;
        log('getAllNotificationsFunction ');
      } else {
        log('getAllNotificationsFunction Else');
      }
    } catch (e) {
      log('getAllNotificationsFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  showMessageInDialog({
    required String messageText,
  }) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext dialogContext) {
        return SimpleDialog(
          title: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: Text(
              messageText,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.greyColor,
              ),
            ),
          ),
          alignment: Alignment.center,
          backgroundColor: AppColors.whiteColor,
          // contentPadding: EdgeInsets.symmetric(
          //   vertical: size.width * 0.1,
          //   horizontal: size.width * 0.2,
          // ),
          children: const [],
        );
      },
    );
  }

  Future<void> readMarkUserNotificationApiFunction({
    required String messageText,
    required int notificationId,
    required bool isPartnerNotification,
    required bool isAdminNotification,
    required int index,
  }) async {
    isLoadingMessage(true);

    String url =
        "${ApiUrl.readMarkUserNotificationApi}?customerId=${UserDetails.customerId}&notificationId=$notificationId&IsPartnerNotification=$isPartnerNotification&IsAdminNotification=$isAdminNotification";
    log('readMarkUserNotificationApiFunction Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('readMarkUserNotificationApiFunction response ::: ${response.body}');

      GetAllMessageModel getAllMessageModel =
          GetAllMessageModel.fromJson(json.decode(response.body));
      var isSuccessStatus = getAllMessageModel.success.obs;

      if (isSuccessStatus.value) {
        showMessageInDialog(messageText: messageText);
        getNotificationList[index].isRead = true;
        isLoading(true);
        isLoading(false);
        // await getAllNotificationsFunction();

        log('readMarkUserNotificationApiFunction if case ');
      } else {
        log('readMarkUserNotificationApiFunction Else case');
      }
    } catch (e) {
      log('readMarkUserNotificationApiFunction Error :$e');
      rethrow;
    } finally {
      isLoadingMessage(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllNotificationsFunction();
  }
}
