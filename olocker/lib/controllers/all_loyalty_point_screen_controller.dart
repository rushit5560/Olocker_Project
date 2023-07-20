import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/models/jeweller_loyalty_point_screen_models/loyalty_point_model.dart';
import '../constants/user_details.dart';

class AllLoyaltyPointScreenController extends GetxController {
  RxBool isLoading = false.obs;

  // RxBool isSuccessStatus = false.obs;

  Size size = Get.size;
  int isStatusCode = 0;
  ApiHeader apiHeader = ApiHeader();

  List<PartnerPoint> loyaltyPointList = [];

  Future<void> getLoyaltyPointFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getLoyaltyPointApi}?customerId=${UserDetails.customerId}";
    // String url = "${ApiUrl.getLoyaltyPointApi}?customerId=415785";
    // ${UserDetails.customerId}";

    log('getLoyaltyPointFunction Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('response : ${response.body}');

      LoyaltyPointsModel loyaltyPointsModel =
          LoyaltyPointsModel.fromJson(json.decode(response.body));
      // isSuccessStatus = loyaltyPointsModel.success.obs;
      isStatusCode = loyaltyPointsModel.statusCode;
      if (isStatusCode == 200) {
        loyaltyPointList.clear();
        loyaltyPointList.addAll(loyaltyPointsModel.data.partnerPoint);
        log('loyaltyPointList : ${loyaltyPointList.length}');
      } else {
        log('getLoyaltyPointFunction Else');
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
      log('getLoyaltyPointFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  @override
  void onInit() {
    getLoyaltyPointFunction();
    super.onInit();
  }
}
