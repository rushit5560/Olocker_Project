import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/models/home_screen_models/smart_deals_online_model.dart';

import '../models/home_screen_models/smart_offline_deats_model.dart';

class OfflineDealsListScreenController extends GetxController {
  List<VendorOfflineDealsList> smartDealsOfflineList = Get.arguments;

  final size = Get.size;

}