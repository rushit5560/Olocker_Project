import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/models/user_login_model.dart';
import 'package:olocker/screens/index_screen/index_screen.dart';
import 'package:olocker/screens/otp_screen/otp_screen.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/screens/signup_screen/signup_screen.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/api_url.dart';
import '../constants/app_colors.dart';

class MobileNumberScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;

  TextEditingController numberController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  ApiHeader apiHeader = ApiHeader();

  Future<void> userLoginFunction(BuildContext context) async {
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

        UserLoginModel userLoginModel = UserLoginModel.fromJson(resBody);

        var isSuccessStatus = userLoginModel.success;
        var isCustomerExist = userLoginModel.isCustomer;

        log("checkMobileNumber success  : ${isSuccessStatus}");
        log("is customer exist : ${isCustomerExist}");

        if (isCustomerExist == true) {
          log("mobile number is verfied");
          Get.off(() => OtpScreen());
        } else {
          final snackBar = SnackBar(
            backgroundColor: AppColors.whiteColor,
            elevation: 5,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
              left: 5,
              right: 5,
              bottom: 5,
            ),
            content: Text(
              userLoginModel.errorInfo.extraInfo.isEmpty
                  ? "User Not Registered"
                  : userLoginModel.errorInfo.extraInfo,
              style: TextStyle(
                color: AppColors.blackColor,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          log("mobile number is new");

          // Get.to(() => SignUpScreen());
        }
      } catch (e) {
        log("checkMobileNumber Error ::: $e");
        rethrow;
      } finally {
        isLoading(false);
      }
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
