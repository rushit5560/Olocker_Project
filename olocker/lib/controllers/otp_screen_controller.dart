import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/models/login_response_model.dart';
import 'package:olocker/screens/index_screen/index_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_url.dart';
import '../constants/app_colors.dart';
import '../utils/user_prefs_data.dart';

class OtpScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;

  final apiHeader = ApiHeader();

  TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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

          log("validateOtpNumberFunction success  : ${isSuccessStatus}");

          if (isSuccessStatus == true) {
            UserPrefsData().setCustomerPrefsData(
              userMobileNo: loginModel.userRequestValidateOtp[0].mobileNo,
              customerId: loginModel.userRequestValidateOtp[0].custSrNo,
              customerFname: loginModel.userRequestValidateOtp[0].firstName,
              customerLname: loginModel.userRequestValidateOtp[0].lastName,
              customerEmail: loginModel.userRequestValidateOtp[0].userEmail,
              customerSalutation: loginModel.userRequestValidateOtp[0].gender,
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
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            // Get.to(() => SignUpScreen());
          }
          isLoading(false);
        } catch (e) {
          log("validateOtpNumberFunction Error ::: $e");
          rethrow;
        }
      } catch (e) {
        log(e.toString());
        rethrow;
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
