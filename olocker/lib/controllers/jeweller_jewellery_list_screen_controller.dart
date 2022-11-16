import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/models/jeweller_jewellery_list_screen_model/all_jewellery_model.dart';

class JewellerJewelleryListScreenController extends GetxController {
  String jewelleryName = Get.arguments[0]; // Getting from jeweller details screen
  String jewelleryCategoryId = Get.arguments[1]; // Getting from jeweller details screen
  String jewellerId = Get.arguments[2]; // Getting from jeweller details screen

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  Size size = Get.size;
  ApiHeader apiHeader = ApiHeader();

  RxBool sortPriceValue = false.obs;

  List _jewelleryList = [];

  Future<void> getAllJewelleryListFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getJewellerJewelleriesApi}?PartnerSrNo=$jewellerId&CollectionID=$jewelleryCategoryId";
    log('getAllJewelleryListFunction Api Url : $url');
    
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('response : ${response.body}');

      AllJewelleryModel allJewelleryModel = AllJewelleryModel.fromJson(json.decode(response.body));
      isSuccessStatus = allJewelleryModel.success.obs;

      if(isSuccessStatus.value) {
        _jewelleryList.clear();
        _jewelleryList.addAll(allJewelleryModel.searchProductListData);
        log('_jewelleryList : ${_jewelleryList.length}');
      } else {
        log('getAllJewelleryListFunction Else');
      }

      
    } catch(e) {
      log('getAllJewelleryListFunction Error : $e');
      rethrow;
    }
  }



@override
  void onInit() {
    super.onInit();
  }
}