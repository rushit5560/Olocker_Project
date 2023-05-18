import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:olocker/models/auth_screen_models/user_login_model.dart';
import 'package:olocker/screens/otp_screen/otp_screen.dart';
import 'package:olocker/utils/user_prefs_data.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../constants/app_colors.dart';
import '../models/auth_screen_models/register_model.dart';

class SignUpScreenController extends GetxController {
  final size = Get.size;
  UserPrefsData userPrefsData = UserPrefsData();

  RxBool isLoading = false.obs;

  final apiHeader = ApiHeader();
  String deviceTokenToSendPushNotification = "";

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

  // bool isCustomerExist = false;
  // CommonWidgets commonWidgets = CommonWidgets();

  Future<void> checkMobileNumber(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String mobNumber = numberController.text.toString();

    // if (formKey.currentState!.validate()) {
    String url = "${ApiUrl.checkUserByMobileApi}?mobileNo=$mobNumber";
    log(" checkMobileNumber url: $url");

    try {
      isLoading(true);
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
        // commonWidgets.showBorderSnackBar(context: Get.context!, displayText: "User Is Already Registered");
        // ignore: use_build_context_synchronously
        await userLoginFunction(context);
      } else {
        log("mobile number is new");
        //do nothing
      }
    } catch (e) {
      log("checkMobileNumber Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
    // }
  }

  Future<void> userLoginFunction(BuildContext context) async {
    log('userLoginFunction Inner');
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String mobNumber = numberController.text.toString();

    String url = ApiUrl.userLoginApi;
    log(" checkMobileNumber url: $url");

    try {
      var formData = {
        "MobileNo": mobNumber,
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

      var isSuccessStatus = userLoginModel.success;
      var isCustomerExist = userLoginModel.isCustomer;

      log("checkMobileNumber success  : $isSuccessStatus");
      log("is customer exist : $isCustomerExist");

      if (isCustomerExist == true) {
        log("mobile number is verified");
        prefs.setString(
            UserPrefsData().customerMobileNoKey, numberController.text);
        // Get.back();
        CommonWidgets().showBorderSnackBar(
            context: Get.context!, displayText: "User Is Already Registered");
        Get.off(() => OtpScreen());
      } else {
        log("mobile number is new");
        final snackBar = SnackBar(
          // backgroundColor: AppColors.whiteColor,
          elevation: 8,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(8),
          content: Text(
            userLoginModel.errorInfo.extraInfo.isEmpty
                ? "User Not Registered"
                : userLoginModel.errorInfo.extraInfo,
            style: const TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      log("checkMobileNumber Error ::: $e");
      rethrow;
    }
  }

  Future<void> userRegisterFunction(BuildContext context) async {
    log("deviceTokenToSendPushNotification device token: $deviceTokenToSendPushNotification");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (formKey.currentState!.validate()) {
      isLoading(true);
      String url = ApiUrl.registerApi;
      log("checkMobileNumber url: $url");

      try {
        var formData = {
          "FirstName": fnameController.text.trim(),
          "LastName": lnameController.text.trim(),
          "MobileNo": numberController.text.trim(),
          "UserEmail": emailController.text.trim(),
          "ReferralCode": codeController.text.trim(),
          "Salutation": namePrefixDDvalue.value,
          // "DeviceMacId": deviceTokenToSendPushNotification,
        };

        log("checkMobileNumber formdata passing is : $formData");

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

  // MobileScannerController  cameraController = MobileScannerController();
  // RxBool screenOpened = false.obs;

  // void screenWasClosed(){
  //   screenOpened = false.obs;
  // }

  // void foundBarcode(Barcode barcode, MobileScannerArguments? args){
  //   log("$barcode");
  //   if(!screenOpened.value){
  //     isLoading(true);
  //     final String code = barcode.rawValue ?? "___";
  //     log('code : $code');
  //     CommonWidgets().showBorderSnackBar(context: Get.context!, displayText: code);
  //
  //     codeController.text = code;
  //     screenOpened.value = false;
  //     //here push navigation result page
  //     isLoading(false);
  //   }
  // }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#F16E68', 'Cancel', false, ScanMode.QR);

      // if (!mounted) return;

      // setState(() {
      codeController.text = qrCode;
      // });
      log("QRCode_Result:--");
      log(qrCode);
    } on PlatformException {
      // codeController.text = 'Failed to scan QR Code.';
    }
  }

  // @override
  // void onInit() {
  //   getDeviceTokenToSendNotification();
  //   super.onInit();
  // }

  // Future<void> getDeviceTokenToSendNotification() async {
  //   log("getDeviceTokenToSendNotification");
  //   final FirebaseMessaging fcm = FirebaseMessaging.instance;
  //   final token = await fcm.getToken();
  //   deviceTokenToSendPushNotification = token.toString();
  //   await userPrefsData.setFcmInPrefs(deviceTokenToSendPushNotification);
  // }
}
