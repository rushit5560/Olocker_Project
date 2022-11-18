import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../models/enquire_screen_models/get_all_message_model.dart';

class NotificationScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<GetNotification> getNotificationList = [];

  Future<void> getAllNotificationsFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getAllNotificationApi}?customerId=${UserDetails.customerId}";
    log('getAllNotificationsFunction Api url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getAllNotificationsFunction res body :: ${response.body}");

      GetAllMessageModel getAllMessageModel =
          GetAllMessageModel.fromJson(json.decode(response.body));
      var isSuccessStatus = getAllMessageModel.success.obs;

      if (isSuccessStatus.value) {
        getNotificationList = getAllMessageModel.getNotification;
        log('getAllNotificationsFunction ');
      } else {
        log('getAllNotificationsFunction Else');
      }
    } catch (e) {
      log('getAllNotificationsFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> readMarkUserNotificationApiFunction() async {
    isLoading(true);

    String url =
        "${ApiUrl.readMarkUserNotificationApi}?customerId=${UserDetails.customerId}&notificationId=5&IsPartnerNotification=false&IsAdminNotification=true";
    log('getLoyaltyPointFunction Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      // log('response : ${response.body}');

      // LoyaltyPointsModel loyaltyPointsModel =
      //     LoyaltyPointsModel.fromJson(json.decode(response.body));
      // isSuccessStatus = loyaltyPointsModel.success.obs;

      // if (isSuccessStatus.value) {
      //   loyaltyPointList.clear();
      //   loyaltyPointList.addAll(loyaltyPointsModel.partnerPoint);
      //   log('loyaltyPointList : ${loyaltyPointList.length}');
      // } else {
      //   log('getLoyaltyPointFunction Else');
      // }
    } catch (e) {
      log('getLoyaltyPointFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllNotificationsFunction();
  }
}
