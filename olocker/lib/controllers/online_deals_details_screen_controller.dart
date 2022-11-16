import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/models/home_screen_models/smart_deals_online_model.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/models/online_deals_details_screen_model/insert_favourite_deals_model.dart';

class OnlineDealsDetailsScreenController extends GetxController {
  OnLineDeal onLineDealDetails = Get.arguments;
  Size size = Get.size;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  Future<void> addOnlineDealInFavouriteFunction() async {
    isLoading(true);
    String url = ApiUrl.insertCustomerFavDealApi;

    try {
      Map<String, dynamic> bodyData = {
        "CustomerId": UserDetails.customerId,
        "DealId": onLineDealDetails.srNo,
        "isThirdPartyDeal": true
      };

      log("addOnlineDealInFavouriteFunction bodyData Map :: $bodyData");

      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: bodyData,
      );

      InsertFavouriteDealModel insertFavouriteDealModel =
          InsertFavouriteDealModel.fromJson(json.decode(response.body));
      isSuccessStatus = insertFavouriteDealModel.success.obs;

      if (isSuccessStatus.value) {
        log('Insert Favourite Deal Success');
      } else {
        log('addOnlineDealInFavouriteFunction Else');
      }
    } catch (e) {
      log('addOnlineDealInFavouriteFunction Error :$e');
      rethrow;
    }
  }
}
