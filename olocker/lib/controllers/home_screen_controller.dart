import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/models/home_screen_models/banner_model.dart';
import 'package:olocker/models/home_screen_models/my_jewellers_model.dart';
import 'package:olocker/models/home_screen_models/smart_deals_online_model.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ApiHeader apiHeader = ApiHeader();

  RxBool smartDealsSwitch = false.obs;
  RxBool getPermission = false.obs;

  List<JewellerData> myAllJewellersList = [];
  List<VendorDealsList> smartDealsOnlineList = [];
  List<NotificationBanner> bannerList = [];

  Future<void> getMyJewellersFunction() async {
    isLoading(true);
    // String url = '${ApiUrl.myJewellersApi}?customerId=${UserDetails.customerId}';
    String url =
        '${ApiUrl.myJewellersApi}?customerId=${UserDetails.customerId}';
    log('My Jewellers Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      MyJewellersModel myJewellersModel =
          MyJewellersModel.fromJson(json.decode(response.body));

      log('getMyJewellersFunction response.body : ${response.body}');

      isSuccessStatus = myJewellersModel.success.obs;

      if (isSuccessStatus.value) {
        myAllJewellersList.clear();
        myAllJewellersList.addAll(myJewellersModel.addMyJewellerdata);
      } else {
        log('getMyJewellersFunction Else');
      }
    } catch (e) {
      log('getMyJewellersFunction Error :$e');
      rethrow;
    }

    await getBannerFunction();
  }

  Future<void> getBannerFunction() async {
    isLoading(true);
    String url = ApiUrl.bannerApi;
    log('Banner Api Url : $url');

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);

      BannerModel bannerModel =
          BannerModel.fromJson(json.decode(response.body));
      isSuccessStatus = bannerModel.success.obs;

      if (isSuccessStatus.value) {
        bannerList.clear();
        bannerList.addAll(bannerModel.notifications);
      } else {
        log('getBannerFunction Else');
      }
    } catch (e) {
      log('getBannerFunction Error : $e');
      rethrow;
    }

    await getSmartDealsOnlineFunction();
  }

  Future<void> getSmartDealsOnlineFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.smartDealsOnlineApi}?customerId=${UserDetails.customerId}";
    log('Smart Deals Online Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getSmartDealsOnlineFunction response is : ${response.body}');

      SmartDealsOnlineModel smartDealsOnlineModel =
          SmartDealsOnlineModel.fromJson(json.decode(response.body));

      isSuccessStatus = smartDealsOnlineModel.success.obs;

      if (isSuccessStatus.value) {
        smartDealsOnlineList.clear();
        smartDealsOnlineList.addAll(smartDealsOnlineModel.vendorDealsList);
      } else {
        log('getSmartDealsOnline Else');
      }
    } catch (e) {
      log('getSmartDealsOnline Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  Future<bool> handleLocationPermission(context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    getMyJewellersFunction();
    super.onInit();
  }
}
