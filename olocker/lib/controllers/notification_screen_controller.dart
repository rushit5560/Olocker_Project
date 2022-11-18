import 'dart:developer';

import 'package:get/get.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';

class NotificationScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

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

      // GetAddDataOrnamentModel getAddDataOrnamentModel =
      //     GetAddDataOrnamentModel.fromJson(json.decode(response.body));
      // var isSuccessStatus = getAddDataOrnamentModel.success.obs;

      // if (isSuccessStatus.value) {

      //   log('getAllNotificationsFunction ');
      // } else {
      //   log('getAllNotificationsFunction Else');
      // }

      // log("response : ${response.body}");

    } catch (e) {
      log('getAllNotificationsFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllNotificationsFunction();
  }
}
