import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/models/index_screen_models/get_notification_model.dart';
import 'package:olocker/screens/home_screen/home_screen.dart';
import 'package:olocker/screens/notification_screen/notification_screen.dart';
import 'package:olocker/screens/profile_screen/profile_screen.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/utils/user_prefs_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

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

  checkUserDOBData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var userDob = prefs.getString(UserPrefsData().customerDOBKey) ?? "";

    if (userDob == "") {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: const Text("Alert"),
            actionsAlignment: MainAxisAlignment.end,
            content: Text(
              "Your details will help us serve you better. Kindly update your profile details.",
              maxLines: null,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("CANCEL"),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  currentBottomIndex.value = 1;
                },
                child: const Text("OKAY"),
              ),
            ],
          );
        },
      );
    } else {
      log("profile DOB is updated");
    }
  }

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
    checkUserDOBData();
    getNotificationCountFunction();
    super.onInit();
  }
}
