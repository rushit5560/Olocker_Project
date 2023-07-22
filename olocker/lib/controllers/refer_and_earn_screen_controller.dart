import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import '../constants/api_url.dart';
import '../constants/app_colors.dart';
import '../constants/user_details.dart';
import '../models/refer_and_earn_screen_models/get_loyality_plan_model.dart';
import '../models/refer_and_earn_screen_models/get_partner_by_code_model.dart';
import '../models/user_profile_models/user_profile_get_model.dart';
import '../widgets/common_widgets.dart';

class ReferAndEarnScreenController extends GetxController {
  final partnerId = Get.arguments[0];
  final size = Get.size;

  RxBool isLoading = false.obs;
  RxBool isSuccessResult = false.obs;
  int isStatusCode = 0;
  final apiHeader = ApiHeader();
  LoyalityPlan? loyalityPlan;
  PartnerDetails? partnerDetails;

  RxString userReferaalCode = "".obs;

  copyRefferalCode() {
    Clipboard.setData(
      ClipboardData(text: userReferaalCode.value),
    );

    // CommonWidgets().showBorderSnackBar(
    //   context: Get.context!,
    //   displayText: "The code has been Copied Successfully, kindly REFER NOW.",
    // );
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            color: AppColors.blackTextColor,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        backgroundColor: AppColors.whiteColor,
        content: Text(
          "The code has been Copied Successfully, kindly REFER NOW.",
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontFamily: "Roboto",
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        action: SnackBarAction(
          label: "Okay",
          onPressed: () async {
            ScaffoldMessenger.of(Get.context!).removeCurrentSnackBar();

            await shareReferUserFunction();
          },
        ),
      ),
    );
  }

  shareReferUserFunction() async {
    await Share.share(
        '''I loved this beautiful jewellery from ${partnerDetails!.partnerName.capitalize!} on olocker app. 
    You must download this app to witness their excellent jewellery collections, get fabulous deals & 
    rewards too. Click here https://olocker.in/DetectOS.aspx and use my referral 
    code ${userReferaalCode.value}-${partnerDetails!.partnerId} on ENTER CODE space on Sign up page https://www.olocker.in/''');
  }

  Future<void> getPartnerByCodeFunction() async {
    // if (formKey.currentState!.validate()) {
    String url = "${ApiUrl.getPartnerByCodeApi}?PartnerCode=$partnerId";
    log(" getPartnerByCodeFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getPartnerByCodeFunction st code is : ${response.statusCode}");
      log("getPartnerByCodeFunction res body : ${response.body}");

      var resBody = jsonDecode(response.body);

      GetPartnerByCodeModel getPartnerByCodeModel =
          GetPartnerByCodeModel.fromJson(resBody);

      // isSuccessResult.value = getPartnerByCodeModel.success;
      isStatusCode = getPartnerByCodeModel.statusCode;
      if (isStatusCode == 200) {
        log("getPartnerByCodeFunction get success");
        partnerDetails = getPartnerByCodeModel.data.partner;
      } else {
        log("getPartnerByCodeFunction get not success");
        if (isStatusCode == 400) {
          log("BadRequest");
        } else if (isStatusCode == 404) {
          log("NotFound");
        } else if (isStatusCode == 406) {
          log("NotAcceptable");
        } else if (isStatusCode == 417) {
          log("HttpStatusCode.ExpectationFailed");
        }
        //do nothing
      }
    } catch (e) {
      log("getPartnerByCodeFunction Error ::: $e");
      rethrow;
    } finally {
      getLoyalityPlanFunction();
      // isLoading(false);
    }
    // }
  }

  Future<void> getUserProfileDetailsFunction() async {
    String url =
        "${ApiUrl.getUserProfileApi}?customerId=${UserDetails.customerId}";
    log(" getUserProfleDetailsFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getUserProfleDetailsFunction st code is : ${response.statusCode}");
      log("getUserProfleDetailsFunction res body : ${response.body}");

      var resBody = jsonDecode(response.body);

      UserProfileGetModel userProfileGetModel =
          UserProfileGetModel.fromJson(resBody);

      isStatusCode = userProfileGetModel.statusCode;

      if (isStatusCode == 200) {
        log("user profile get success");
        userReferaalCode.value = userProfileGetModel.data.referralCode;
        log("user userReferaalCode Refer code :: $userReferaalCode");
      } else {
        if (isStatusCode == 400) {
          log("BadRequest");
        } else if (isStatusCode == 404) {
          log("NotFound");
        } else if (isStatusCode == 406) {
          log("NotAcceptable");
        } else if (isStatusCode == 417) {
          log("HttpStatusCode.ExpectationFailed");
        }
      }
    } catch (e) {
      log("getUserProfleDetailsFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> getLoyalityPlanFunction() async {
    // if (formKey.currentState!.validate()) {

    String url = "${ApiUrl.getLoyalityPlanApi}?partnerSrNo=$partnerId";
    log(" getLoyalityPlanFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getLoyalityPlanFunction st code is : ${response.statusCode}");
      log("getLoyalityPlanFunction res body : ${response.body}");

      var resBody = jsonDecode(response.body);

      GetLoyalityPlanModel getLoyalityPlanModel =
          GetLoyalityPlanModel.fromJson(resBody);

      // var isSuccessResult = getLoyalityPlanModel.success;
      isStatusCode = getLoyalityPlanModel.statusCode;

      if (isStatusCode == 200) {
        log("getLoyalityPlanFunction get success");

        loyalityPlan = getLoyalityPlanModel.data.loyalityPlan;
      } else {
        log("getLoyalityPlanFunction get not success");
        //do nothing
      }
    } catch (e) {
      log("getLoyalityPlanFunction Error ::: $e");
      if (isStatusCode == 400) {
        log("BadRequest");
      } else if (isStatusCode == 404) {
        log("NotFound");
      } else if (isStatusCode == 406) {
        log("NotAcceptable");
      } else if (isStatusCode == 417) {
        log("HttpStatusCode.ExpectationFailed");
      }
      rethrow;
    } finally {
      // isLoading(false);
      getUserProfileDetailsFunction();
    }
    // }
  }

  @override
  void onInit() {
    getPartnerByCodeFunction();
    super.onInit();
  }
}
