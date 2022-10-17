import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/screens/otp_screen/otp_screen.dart';
import 'package:olocker/utils/user_prefs_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../constants/app_colors.dart';
import '../models/auth_models/register_model.dart';

class SignUpScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;

  final apiHeader = ApiHeader();

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RxString namePrefixDDvalue = 'Mr.'.obs;
  var namePrefixItems = [
    'Mr.',
    'Mrs.',
    'Miss',
  ];

  Future<void> checkMobileNumber(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String mobNumber = numberController.text.toString();

    if (formKey.currentState!.validate()) {
      isLoading(true);
      String url = "${ApiUrl.checkUserByMobileApi}?mobileNo=$mobNumber";
      log(" checkMobileNumber url: $url");

      try {
        http.Response response = await http.get(
          Uri.parse(url),
          headers: apiHeader.headers,
        );

        log("checkMobileNumber st code is : ${response.statusCode}");
        log("checkMobileNumber res body : ${response.body}");

        var resBody = json.decode(response.body);

        // registerModel registerModel = registerModel.fromJson(resBody);

        var isSuccessStatus = resBody["success"];
        var isCustomerExist = resBody["UserMobile"]["IsExist"];

        log("checkMobileNumber success  : $isSuccessStatus");
        log("is customer exist : $isCustomerExist");

        if (isCustomerExist == true) {
          log("mobile number is verfied");
          prefs.setString(
              UserPrefsData().customerMobileNoKey, numberController.text);
          Get.off(() => OtpScreen());
          var snackBar = const SnackBar(
            backgroundColor: AppColors.whiteColor,
            elevation: 8,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(8),
            content: Text(
              "User Is Already Registered",
              style: TextStyle(
                color: AppColors.blackColor,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          log("mobile number is new");
          //do nothing
        }
        isLoading(false);
      } catch (e) {
        log("checkMobileNumber Error ::: $e");
        rethrow;
      }
    }
  }

  Future<void> userRegisterFunction(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (formKey.currentState!.validate()) {
      isLoading(true);
      String url = ApiUrl.registerApi;
      log(" checkMobileNumber url: $url");

      try {
        var formData = {
          "FirstName": fnameController.text.trim(),
          "LastName": lnameController.text.trim(),
          "MobileNo": numberController.text.trim(),
          "UserEmail": emailController.text.trim(),
          "ReferralCode": null,
          "Salutation": namePrefixDDvalue.value
        };

        log(" checkMobileNumber formdata passing is : $formData");

        http.Response response = await http.post(
          Uri.parse(url),
          body: json.encode(formData),
          headers: apiHeader.headers,
        );

        log("checkMobileNumber st code is : ${response.statusCode}");
        log("checkMobileNumber res body : ${response.body}");

        var resBody = json.decode(response.body);

        RegisterModel registerModel = RegisterModel.fromJson(resBody);

        var isSuccessStatus = registerModel.success;

        log("checkMobileNumber success  : $isSuccessStatus");

        if (isSuccessStatus == true) {
          prefs.setString(
              UserPrefsData().customerMobileNoKey, numberController.text);
          Get.off(() => OtpScreen());
        } else {
          final snackBar = SnackBar(
            backgroundColor: AppColors.whiteColor,
            elevation: 8,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(8),
            content: Text(
              "${registerModel.errorInfo.extraInfo} | ${registerModel.errorInfo.description}",
              style: const TextStyle(
                color: AppColors.blackColor,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          // Get.to(() => SignUpScreen());
        }
        isLoading(false);
      } catch (e) {
        log("checkMobileNumber Error ::: $e");
        rethrow;
      }
    }
  }
}
