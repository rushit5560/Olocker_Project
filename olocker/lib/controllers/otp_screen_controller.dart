import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/screens/index_screen/index_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_url.dart';
import '../constants/app_colors.dart';
import '../constants/user_details.dart';
import '../models/auth_screen_models/login_response_model.dart';
import '../models/auth_screen_models/user_login_model.dart';
import '../models/update_device_id_model/update_device_id_model.dart';
import '../utils/user_prefs_data.dart';

class OtpScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;

  final apiHeader = ApiHeader();
  String mobileNumber = "";
  TextEditingController otpController = TextEditingController();
  String deviceTokenToSendPushNotification = "";
  String customerId = "";
  UserPrefsData userPrefsData = UserPrefsData();

  final formKey = GlobalKey<FormState>();

  Future<void> userResendOtpFunction(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String mobNumber = prefs.getString(UserPrefsData().customerMobileNoKey)!;

    // if (formKey.currentState!.validate()) {
    try {
      // isLoading(true);
      String url = ApiUrl.userLoginApi;
      log("checkMobileNumber url: $url");
      var formData = {
        "MobileNo": mobNumber,

      };

      log("formdata mobile  is : $formData");
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
        log("mobile number is verified");
        var snackBar = const SnackBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 8,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(8),
          content: Text(
            "Otp sent to your mobile number",
            style: TextStyle(
              color: AppColors.blackColor,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // prefs.setString(
        //     UserPrefsData().customerMobileNoKey, numberController.text);
        // Get.off(() => OtpScreen());
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
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        // Get.to(() => SignUpScreen());
      }
      otpController.clear();
      // isLoading(false);
    } catch (e) {
      log("checkMobileNumber Error ::: $e");
      isLoading(false);
      rethrow;
    }
    // }
  }

  Future<void> validateOtpNumberFunction(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        //
        // String mobileNumber =
        //     prefs.getString(UserPrefsData().customerMobileNoKey) ?? "";

        // Get.to(() => IndexScreen());
        isLoading(true);
        String url = ApiUrl.validateOtpApi;
        log(" validateOtpNumberFunction url: $url");

        try {
          var formData = {
            "MobileNo": mobileNumber,
            "OTP": otpController.text.toString(),
          };

          log(" validateOtpNumberFunction formdata passing is : $formData");

          http.Response response = await http.post(
            Uri.parse(url),
            body: json.encode(formData),
            headers: apiHeader.headers,
          );

          log("validateOtpNumberFunction st code is : ${response.statusCode}");
          log("validateOtpNumberFunction res body : ${response.body}");

          var resBody = json.decode(response.body);

          LoginResponseModel loginModel = LoginResponseModel.fromJson(resBody);

          var isSuccessStatus = loginModel.data.success;

          log("validateOtpNumberFunction success  : $isSuccessStatus");

          if (isSuccessStatus == true) {
            UserPrefsData().setCustomerPrefsData(
                customerMobileNo:
                loginModel.data.userRequestValidateOtp[0].mobileNo == ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].mobileNo,
                customerId:
                loginModel.data.userRequestValidateOtp[0].custSrNo == ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].custSrNo,
                customerUsername:
                loginModel.data.userRequestValidateOtp[0].userName == ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].userName,
                customerFname:
                loginModel.data.userRequestValidateOtp[0].firstName == ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].firstName,
                customerLname:
                loginModel.data.userRequestValidateOtp[0].lastName == ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].lastName,
                customerEmail:
                loginModel.data.userRequestValidateOtp[0].userEmail == ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].userEmail,
                customerGender:
                loginModel.data.userRequestValidateOtp[0].gender == ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].gender,
                customerAddress:
                loginModel.data.userRequestValidateOtp[0].address == ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].address,
                customerCity: loginModel.data.userRequestValidateOtp[0].city ==
                    ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].city,
                customerPin: loginModel.data.userRequestValidateOtp[0].pin == ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].pin,
                customerState:
                loginModel.data.userRequestValidateOtp[0].state == ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].state,
                customerCountry:
                loginModel.data.userRequestValidateOtp[0].country == ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].country,
                customerDob: loginModel.data.userRequestValidateOtp[0].dob == ""
                    ? ""
                    : loginModel.data.userRequestValidateOtp[0].dob,
                deviceId: loginModel.data.userRequestValidateOtp[0].deviceId ==
                    "" ? "" : loginModel.data.userRequestValidateOtp[0].deviceId


            );

            await updateDeviceIdFunction();
          } else {
            final snackBar = SnackBar(
              backgroundColor: AppColors.whiteColor,
              elevation: 8,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(8),
              content: Text(
                "${loginModel.data.errorInfo.extraInfo} | ${loginModel.data
                    .errorInfo.description}",
                style: const TextStyle(
                  color: AppColors.blackColor,
                ),
              ),
            );
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            // Get.to(() => SignUpScreen());
          }
        } catch (e) {
          log("validateOtpNumberFunction Error ::: $e");
          rethrow;
        }
      } catch (e) {
        log(e.toString());
        rethrow;
      } finally {
        isLoading(false);
      }
    }
  }

  updateDeviceIdFunction() async {
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    final token = await fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    await userPrefsData.setFcmInPrefs(deviceTokenToSendPushNotification);
    // customerId =
    //     await userPrefsData.getCustSrNoPrefs(userPrefsData.customerIdKey);

    log("deviceTokenToSendPushNotification $deviceTokenToSendPushNotification");
    // log("customerId 1 $customerId");
    log("UserDetails.customerId ${UserDetails.customerId}");

    String url = ApiUrl.updateDeviceIdApi;
    log("updateDeviceIdFunction url : $url");
    try {
      var formData = {
        "CustSrNo": UserDetails.customerId,
        "DeviceMacId": deviceTokenToSendPushNotification,
      };
      log("updateDeviceIdFunction formData $formData");
      http.Response response = await http.post(
        Uri.parse(url),
        body: json.encode(formData),
        headers: apiHeader.headers,
      );
      log("updateDeviceIdFunction res body : ${response.body}");

      var resBody = json.decode(response.body);

      UpdateDeviceIdModel updateDeviceIdModel =
      UpdateDeviceIdModel.fromJson(resBody);
      var isSuccessStatus = updateDeviceIdModel.data.success;
      if (isSuccessStatus == true) {
        log("updateDeviceIdFunction Device id updated");
        Get.offAll(() => IndexScreen());
      } else {
        log("updateDeviceIdFunction Device id not updated");
      }
    } catch (e) {
      log("updateDeviceIdFunction rethrow $e");
      rethrow;
    }
    isLoading(true);
    isLoading(false);
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
