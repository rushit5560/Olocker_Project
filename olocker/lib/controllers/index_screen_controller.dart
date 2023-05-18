import 'dart:async';
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
  RxBool isLoading = false.obs;

  final pagesList = <Widget>[
    HomeScreen(),
    ProfileScreen(),
    const NotificationScreen(),
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  checkUserDOBData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // String dobUser = prefs.getString(UserPrefsData().customerDOBKey) ?? "";

    int updateProfileCount =
        prefs.getInt(UserPrefsData().updateProfileCountKey) ?? 0;

    if (updateProfileCount < 3) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: const Text("Update Profile"),
            actionsAlignment: MainAxisAlignment.end,
            content: Text(
              "Please  update your profile details.\nYour details will help us serve you better.",
              maxLines: null,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  await updateProfileUpdateCount();
                  Get.back();
                },
                child: const Text("CANCEL"),
              ),
              TextButton(
                onPressed: () async {
                  await updateProfileUpdateCount();
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

  updateProfileUpdateCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? updateCount = prefs.getInt(UserPrefsData().updateProfileCountKey);
    log("get updateCount is ::: ${UserDetails.updateProfileCount}");

    prefs.setInt(UserPrefsData().updateProfileCountKey, updateCount! + 1);

    UserDetails.updateProfileCount =
        prefs.getInt(UserPrefsData().updateProfileCountKey) ?? 0;

    log("UserDetails.updateProfileCount ::: ${UserDetails.updateProfileCount}");
  }

  // getNotificationCountFunction() async {
  //   isLoading(true);

  //   String url =
  //       "${ApiUrl.getNotificationCountApi}?customerId=${UserDetails.customerId}";
  //   log("Get Notification Count Api Url : $url");

  //   try {
  //     http.Response response = await http.get(
  //       Uri.parse(url),
  //       headers: apiHeader.headers,
  //     );

  //     log("Get Notification response.body : ${response.body}");
  //     NotificationCountModel notificationCountModel =
  //         NotificationCountModel.fromJson(json.decode(response.body));
  //     isSuccessStatus = notificationCountModel.success.obs;

  //     if (isSuccessStatus.value) {
  //       notificationCount = notificationCountModel
  //           .parNotificationCount.numberofNotification.obs;
  //       log('notificationCount : ${notificationCount.value}');
  //     } else {
  //       log('getNotificationCountFunction Else');
  //     }
  //   } catch (e) {
  //     log("getNotificationCountFunction Error :$e");
  //     rethrow;
  //   }

  //   isLoading(false);
  // }

  getNotificationCountFunction() async {
    String url =
        "${ApiUrl.getNotificationCountApi}?customerId=${UserDetails.customerId}";
    // log("Get Notification Count Api Url : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      // log("Get Notification response.body : ${response.body}");
      NotificationCountModel notificationCountModel =
          NotificationCountModel.fromJson(json.decode(response.body));
      isSuccessStatus = notificationCountModel.success.obs;

      if (isSuccessStatus.value) {
        notificationCount = notificationCountModel
            .parNotificationCount.numberofNotification.obs;
        // log('notificationCount : ${notificationCount.value}');
      } else {
        log('getNotificationCountFunction Else');
      }
    } catch (e) {
      log("getNotificationCountFunction Error :$e");
      rethrow;
    }
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  Future<void> initMethod() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await getNotificationCountFunction();
      // log('notificationCount 1111: ${notificationCount.value}');
    });
    checkUserDOBData();
  }
}
