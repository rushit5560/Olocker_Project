import 'dart:developer';
import 'package:get/get.dart';
import 'package:olocker/models/home_screen_models/banner_model.dart';
import 'package:olocker/models/home_screen_models/my_jewellers_model.dart';


class MyJewellersScreenController extends GetxController {
  List<NotificationBanner> bannerList = Get.arguments[0];
  List<JewellerData> allJewellersList = Get.arguments[1];

  final size = Get.size;
  RxBool isLoading = false.obs;
  RxInt activeIndex = 0.obs;

  @override
  void onInit() {
    log('bannerList : ${bannerList.length}');
    log('allJewellersList : ${allJewellersList.length}');
    super.onInit();
  }
}
