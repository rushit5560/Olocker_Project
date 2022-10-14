import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/screens/index_screen/index_screen.dart';
import 'package:olocker/screens/otp_screen/otp_screen.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/screens/signup_screen/signup_screen.dart';
import '../constants/api_url.dart';

class MobileNumberScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;

  TextEditingController numberController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  ApiHeader apiHeader = ApiHeader();
  submitMobileNumber() async {
    if (formKey.currentState!.validate()) {
      try {
        await checkMobileNumber();
      } catch (e) {
        log(e.toString());
        rethrow;
      }
    }
  }

  Future<void> checkMobileNumber() async {
    String mobNumber = numberController.text.toString();
    isLoading(true);
    String url =
        "${ApiUrl.apiMainPath}${ApiUrl.checkUserByMobileApi}?mobileNo=$mobNumber";
    log(" checkMobileNumber url: $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("checkMobileNumber st code is : ${response.statusCode}");
      log("checkMobileNumber res body : ${response.body}");

      var resBody = json.decode(response.body);
      var userMobBody = resBody["UserMobile"];
      var isNumberExist = userMobBody["IsExist"];

      log("checkMobileNumber user body : ${userMobBody}");
      log("checkMobileNumber isexist : ${isNumberExist}");

      if (!isNumberExist) {
        log("mobile number is new");
        // Get.to(() => SignUpScreen());
      } else {
        log("mobile number is verfied");
        Get.off(()=> OtpScreen());
      }

      // GetFcmTokeModel getFcmTokeModel = GetFcmTokeModel.fromJson(
      //   json.decode(response.body),
      // );
      // isSuccessStatus = getFcmTokeModel.success.obs;
      // log("getFcmTokeModel.success : ${getFcmTokeModel.success}");
      // log("getFcmTokeModel.success : ${getFcmTokeModel.statusCode}");
      // log("getFcmTokeModel.success : ${getFcmTokeModel.data.fcmToken}");

      // if (isSuccessStatus.value) {
      //   oppositeUserFcmToken = getFcmTokeModel.data.fcmToken;

      //   /// Send Chat Notification
      //   sendGeneralNotification(
      //     fcmToken: oppositeUserFcmToken, // Getting From API
      //     title: "${UserDetails.userName} booked appointment",
      //     body:
      //         "${UserDetails.userName} booked appointment for serviceName on $date at $slotTime",

      //     type: 0,
      //   );

      //   message =
      //       "${UserDetails.userName} booked appointment for serviceName on $date at $slotTime";

      //   log("oppositeUserFcmToken : $oppositeUserFcmToken");
      // } else {
      //   log("getUserFcmTokenFunction Else Else");
      // }
    } catch (e) {
      log("checkMobileNumber Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  /*@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }*/

  /*@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }*/
}
