import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/models/index_screen_models/get_notification_model.dart';
import 'package:olocker/screens/home_screen/home_screen.dart';
import 'package:olocker/screens/notification_screen/notification_screen.dart';
import 'package:olocker/screens/profile_screen/profile_screen.dart';
import 'package:http/http.dart' as http;

class IndexScreenController extends GetxController {
  final size = Get.size;

  RxInt currentBottomIndex = 0.obs;

  ApiHeader apiHeader = ApiHeader();
  RxInt notificationCount = 0.obs;

  RxBool isSuccessStatus = false.obs;

  final pagesList = <Widget>[
    HomeScreen(),
    ProfileScreen(),
    NotificationScreen(),
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> getNotificationCountFunction() async {
    String url =
        "${ApiUrl.getNotificationCountApi}?customerId=${UserDetails.customerId}";
    log("Get Notification Count Api Url : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      NotificationCountModel notificationCountModel =
          NotificationCountModel.fromJson(json.decode(response.body));
      isSuccessStatus = notificationCountModel.success.obs;

      if (isSuccessStatus.value) {
        notificationCount = notificationCountModel
            .parNotificationCount.numberofNotification.obs;
        log('notificationCount : ${notificationCount.value}');
      } else {
        log('getNotificationCountFunction Else');
      }
    } catch (e) {
      log("getNotificationCountFunction Error :$e");
      rethrow;
    }
  }

  @override
  void onInit() {
    getNotificationCountFunction();
    super.onInit();
  }
}
