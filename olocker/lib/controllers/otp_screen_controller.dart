import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/screens/index_screen/index_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_url.dart';
import '../constants/app_colors.dart';
import '../models/auth_screen_models/login_response_model.dart';
import '../models/auth_screen_models/user_login_model.dart';
import '../utils/user_prefs_data.dart';

class OtpScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;

  final apiHeader = ApiHeader();

  TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> userResendOtpFunction(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String mobNumber = prefs.getString(UserPrefsData().customerMobileNoKey)!;

    // if (formKey.currentState!.validate()) {
    try {
      // isLoading(true);
      String url = ApiUrl.userLoginApi;
      log(" checkMobileNumber url: $url");
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

      var isSuccessStatus = userLoginModel.success;
      var isCustomerExist = userLoginModel.isCustomer;

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
            userLoginModel.errorInfo.extraInfo.isEmpty
                ? "User Not Registered"
                : userLoginModel.errorInfo.extraInfo,
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
      rethrow;
    }
    // }
  }

  Future<void> validateOtpNumberFunction(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        String mobileNumber =
            prefs.getString(UserPrefsData().customerMobileNoKey) ?? "";

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

          var isSuccessStatus = loginModel.success;

          log("validateOtpNumberFunction success  : $isSuccessStatus");

          if (isSuccessStatus == true) {
            UserPrefsData().setCustomerPrefsData(
              customerMobileNo:
                  loginModel.userRequestValidateOtp[0].mobileNo == ""
                      ? ""
                      : loginModel.userRequestValidateOtp[0].mobileNo,
              customerId: loginModel.userRequestValidateOtp[0].custSrNo == ""
                  ? ""
                  : loginModel.userRequestValidateOtp[0].custSrNo,
              customerUsername:
                  loginModel.userRequestValidateOtp[0].userName == ""
                      ? ""
                      : loginModel.userRequestValidateOtp[0].userName,
              customerFname:
                  loginModel.userRequestValidateOtp[0].firstName == ""
                      ? ""
                      : loginModel.userRequestValidateOtp[0].firstName,
              customerLname: loginModel.userRequestValidateOtp[0].lastName == ""
                  ? ""
                  : loginModel.userRequestValidateOtp[0].lastName,
              customerEmail:
                  loginModel.userRequestValidateOtp[0].userEmail == ""
                      ? ""
                      : loginModel.userRequestValidateOtp[0].userEmail,
              customerGender: loginModel.userRequestValidateOtp[0].gender == ""
                  ? ""
                  : loginModel.userRequestValidateOtp[0].gender,
              customerAddress:
                  loginModel.userRequestValidateOtp[0].address == ""
                      ? ""
                      : loginModel.userRequestValidateOtp[0].address,
              customerCity: loginModel.userRequestValidateOtp[0].city == ""
                  ? ""
                  : loginModel.userRequestValidateOtp[0].city,
              customerPin: loginModel.userRequestValidateOtp[0].pin == ""
                  ? ""
                  : loginModel.userRequestValidateOtp[0].pin,
              customerState: loginModel.userRequestValidateOtp[0].state == ""
                  ? ""
                  : loginModel.userRequestValidateOtp[0].state,
              customerCountry:
                  loginModel.userRequestValidateOtp[0].country == ""
                      ? ""
                      : loginModel.userRequestValidateOtp[0].country,
              customerDob: loginModel.userRequestValidateOtp[0].dob == ""
                  ? ""
                  : loginModel.userRequestValidateOtp[0].dob,
            );
            Get.off(() => IndexScreen());
          } else {
            final snackBar = SnackBar(
              backgroundColor: AppColors.whiteColor,
              elevation: 8,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(8),
              content: Text(
                "${loginModel.errorInfo.extraInfo} | ${loginModel.errorInfo.description}",
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
}
