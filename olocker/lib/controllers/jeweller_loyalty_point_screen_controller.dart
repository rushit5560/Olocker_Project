import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/models/jeweller_loyalty_point_screen_models/loyalty_point_model.dart';

import '../constants/user_details.dart';

class JewellerLoyaltyPointScreenController extends GetxController {
  String jewellerName = Get.arguments[0];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  Size size = Get.size;

  ApiHeader apiHeader = ApiHeader();

  PartnerPoint? loyaltyPoints;

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
      isSuccessStatus = loyaltyPointsModel.success.obs;

      if (isSuccessStatus.value) {
        for (int i = 0; i < loyaltyPointsModel.partnerPoint.length; i++) {
          if (loyaltyPointsModel.partnerPoint[i].partner == jewellerName) {
            loyaltyPoints = loyaltyPointsModel.partnerPoint[i];
          }
        }

        // loyaltyPointList.clear();
        // loyaltyPointList.addAll(loyaltyPointsModel.partnerPoint);
        if (loyaltyPoints != null) {
          log('loyaltyPoints!.partner : ${loyaltyPoints!.partner}');
          log('loyaltyPoints!.pointsEarnedSummary : ${loyaltyPoints!.logoUrl}');
        }
      } else {
        log('getLoyaltyPointFunction Else');
      }
    } catch (e) {
      log('getLoyaltyPointFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getLoyaltyPointFunction();
    super.onInit();
  }
}
