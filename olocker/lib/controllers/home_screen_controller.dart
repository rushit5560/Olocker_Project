import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/models/home_screen_models/banner_model.dart';
import 'package:olocker/models/home_screen_models/my_jewellers_model.dart';
import 'package:olocker/models/home_screen_models/smart_deals_online_model.dart';
import '../models/home_screen_models/smart_offline_deats_model.dart';
import '../models/user_profile_models/city_state_get_model.dart';
import '../utils/user_prefs_data.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool isOfflineDeals = false.obs;
  ApiHeader apiHeader = ApiHeader();
  String locationZipCode = "";
  RxBool smartDealsSwitch = false.obs;
  RxBool getLocationPermission = false.obs;
  RxString latitude = ''.obs;
  RxString longitude = ''.obs;
  RxString address = ''.obs;
  RxBool isLocalDataCalled = false.obs;
  late StreamSubscription<Position> streamSubscription;
  List<JewellerData> myAllJewellersList = [];
  List<VendorDealsList> smartDealsOnlineList = [];
  List<VendorOfflineDealsList> smartDealsOfflineList = [];

  List<NotificationBanner> bannerList = [];
  UserPrefsData userPrefsData = UserPrefsData();
  RxBool isSuccessResult = false.obs;

  String cityName = '';
  String stateName = '';

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

    // await getBannerFunction();
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

  Future<bool> handleLocationPermission() async {
    isOfflineDeals(true);

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
            content: Text(
                'Location services are disabled. Please enable the services')),
      );
      isOfflineDeals(false);

      getLocationPermission = false.obs;
      return getLocationPermission.value;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      // Geolocator.openAppSettings();
      isOfflineDeals(false);

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        // Geolocator.openAppSettings();

        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')),
        );
        isOfflineDeals(false);

        getLocationPermission = false.obs;
        return getLocationPermission.value;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();

      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.'),
        ),
      );
      isOfflineDeals(false);

      Geolocator.openAppSettings();
      getLocationPermission = false.obs;
      return getLocationPermission.value;
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    await getAddressFromlatLog(position);
    /*streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitude.value = 'latitude: ${position.latitude}';
      longitude.value = 'longitude: ${position.longitude}';

      log("latitude.value ${latitude.value}");
      log("longitude.value ${longitude.value}");
      getAddressFromlatLog(position);
    });*/
    if (permission == LocationPermission.always) {
      getLocationPermission.value = true;
    }
    if (permission == LocationPermission.whileInUse) {
      getLocationPermission.value = true;
    }

    return true;
  }

  Future<void> getAddressFromlatLog(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    log("Placemark $placemarks");
    Placemark place = placemarks[0];
    address.value =
        '${place.street}, ${place.subLocality}, ${place.locality},${place.administrativeArea}, ${place.postalCode}, ${place.country}';
    log("address.value ${address.value}");
    locationZipCode = place.postalCode.toString();
    stateName = place.administrativeArea.toString();
    cityName = place.locality.toString();
    await getSmartDealsOfflineFunction(cityName, stateName);
    // await getCityStateDetailsByPinFunction(locationZipCode);
    // await userPrefsData.getLocationZipCode(locationZipCode);
  }

  //
  // Future<void> getCityStateDetailsByPinFunction(String zipCode) async {
  //   // if (formKey.currentState!.validate()) {
  //   String url = "${ApiUrl.getCityStateByPincodeApi}?pincode=$zipCode";
  //   log("getCityStateDetailsByPinFunction url: $url");
  //
  //   try {
  //     // cityController.clear();
  //     // stateController.clear();
  //     http.Response response = await http.get(
  //       Uri.parse(url),
  //       headers: apiHeader.headers,
  //     );
  //
  //     log("getCityStateDetailsByPinFunction st code is : ${response.statusCode}");
  //     log("getCityStateDetailsByPinFunction res body : ${response.body}");
  //
  //     var resBody = jsonDecode(response.body);
  //
  //     CityStateGetModel cityStateGetModel = CityStateGetModel.fromJson(resBody);
  //
  //     isSuccessResult.value = cityStateGetModel.success;
  //
  //     if (isSuccessResult.value) {
  //       log("city state get success");
  //
  //       cityName = cityStateGetModel.stateCityDetails.cityName;
  //       stateName = cityStateGetModel.stateCityDetails.stateName;
  //       log("cityName 11: $cityName");
  //       log("stateName 11: $stateName");
  //     } else {
  //       log("getCityStateDetailsByPinFunction not success");
  //       //do nothing
  //     }
  //   } catch (e) {
  //     log("getCityStateDetailsByPinFunction Error ::: $e");
  //     rethrow;
  //   }
  //   // isLoading(true);
  //   // isLoading(false);
  //   await getSmartDealsOflineFunction(cityName, stateName);
  //   // }
  // }

  Future<void> getSmartDealsOfflineFunction(
      String cityName, String stateName) async {
    String url =
        "https://devappapi.olocker.in/api/Partner/GetOffLineDeals?StateName=$stateName&CityName=$cityName&partnerId="
        "";
    log('Smart Deals offOnline Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getSmartDealsOfflineFunction response is : ${response.body}');

      GetOfflineDealsModel getOfflineDealsModel =
          GetOfflineDealsModel.fromJson(json.decode(response.body));

      isSuccessStatus = getOfflineDealsModel.success.obs;

      if (isSuccessStatus.value) {
        smartDealsOfflineList.clear();
        smartDealsOfflineList.addAll(getOfflineDealsModel.vendorDealsList);
        isLocalDataCalled(true);
      } else {
        log('getSmartDealsOfflineFunction Else');
      }
    } catch (e) {
      log('getSmartDealsOfflineFunction Error :$e');
      rethrow;
    }
    // isLoading(true);
    // isLoading(false);
    isOfflineDeals(false);
  }

  @override
  void onInit() {
    getMyJewellersFunction();
    super.onInit();
  }
}
