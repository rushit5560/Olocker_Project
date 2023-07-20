import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/models/online_favourite_deals_screen_model/get_favourite_deals_model.dart';

class OnlineFavouriteDealsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  Size size = Get.size;
int isStatusCode =0;
  List<FavDealList> favouriteDealsList = [];

  Future<void> getOnlineFavouriteDealsFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getCustomerFavouriteDealsApi}?customerId=${UserDetails.customerId}";
    log('Favourite Deals Api url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      FavouriteOnlineDealsModel smartDealsOnlineModel =
          FavouriteOnlineDealsModel.fromJson(json.decode(response.body));
      // isSuccessStatus = smartDealsOnlineModel.success.obs;
      isStatusCode=smartDealsOnlineModel.statusCode;
      if (isStatusCode==200) {
        favouriteDealsList.clear();
        favouriteDealsList.addAll(smartDealsOnlineModel.data.favDealList);
        log('Length1 : ${smartDealsOnlineModel.data.favDealList.length}');
        log('Length2 : ${favouriteDealsList.length}');
      } else {
        log('getOnlineFavouriteDealsFunction Else');
      }

      // log("response : ${response.body}");
    } catch (e) {
      log('getOnlineFavouriteDealsFunction Error :$e');
      rethrow;
    }
    isLoading(false);
  }

  @override
  void onInit() {
    getOnlineFavouriteDealsFunction();
    super.onInit();
  }
}
