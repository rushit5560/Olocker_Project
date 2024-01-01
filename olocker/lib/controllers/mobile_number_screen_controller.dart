import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/models/auth_screen_models/user_login_model.dart';
import 'package:olocker/models/update_device_id_model/update_device_id_model.dart';
import 'package:olocker/screens/otp_screen/otp_screen.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/screens/signup_screen/signup_screen.dart';
import 'package:olocker/utils/user_prefs_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/api_url.dart';
import '../constants/app_colors.dart';
import '../constants/user_details.dart';

class MobileNumberScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;

  TextEditingController numberController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String customerId = "";
  UserPrefsData userPrefsData = UserPrefsData();

  ApiHeader apiHeader = ApiHeader();
  RxBool termConditionCheckValue = false.obs;
String mobileNumber="";
  // String deviceTokenToSendPushNotification = "";

  Future<void> userLoginFunction(BuildContext context) async {
    // final FirebaseMessaging fcm = FirebaseMessaging.instance;
    // final token = await fcm.getToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobNumber = numberController.text.toString();
    // deviceTokenToSendPushNotification = token.toString();
    // await userPrefsData.setFcmInPrefs(deviceTokenToSendPushNotification);
    if (formKey.currentState!.validate()) {
      isLoading(true);
      String url = ApiUrl.userLoginApi;
      log("checkMobileNumber url: $url");

      try {
        var formData = {
          "MobileNo": mobNumber,
          // "DeviceMacId": deviceTokenToSendPushNotification,
        };
        http.Response response = await http.post(
          Uri.parse(url),
          body: json.encode(formData),
          headers: apiHeader.headers,
        );

        log("checkMobileNumber st code is : ${response.statusCode}");
        log("checkMobileNumber res body : ${response.body}");

        var resBody = json.decode(response.body);

        UserLoginModel userLoginModel = UserLoginModel.fromJson(resBody);

        var isSuccessStatus = userLoginModel.data.success;
        var isCustomerExist = userLoginModel.data.isCustomer;

        log("checkMobileNumber success  : $isSuccessStatus");
        log("is customer exist : $isCustomerExist");

        if (isCustomerExist == true) {
          log("mobile number is verfied");
          prefs.setString(
              UserPrefsData().customerMobileNoKey, numberController.text);
          Get.off(() => OtpScreen());
        } else {
          log("mobile number is new");
          final snackBar = SnackBar(
            backgroundColor: AppColors.whiteColor,
            elevation: 8,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(8),
            content: Text(
              userLoginModel.data.errorInfo.extraInfo.isEmpty
                  ? "User Not Registered"
                  : userLoginModel.data.errorInfo.extraInfo,
              style: const TextStyle(
                color: AppColors.blackColor,
              ),
            ),
          );
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          Get.to(() => SignUpScreen());
        }
        isLoading(false);
        // await updateDeviceIdFunction();
      } catch (e) {
        log("checkMobileNumber Error ::: $e");
        isLoading(false);
        rethrow;
      }
    }
  }


  Future<void> initMethod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    mobileNumber =
        prefs.getString(UserPrefsData().customerMobileNoKey) ?? "";
    log("mobileNumber: $mobileNumber");
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

}
