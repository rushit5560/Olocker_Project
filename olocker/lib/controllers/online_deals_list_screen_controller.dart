import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/models/home_screen_models/smart_deals_online_model.dart';

class OnlineDealsListScreenController extends GetxController {
  VendorDealsList singleDealList = Get.arguments;

  Size size = Get.size;



  @override
  void onInit() {
    log('singleDealList : $singleDealList');
    super.onInit();
  }
}