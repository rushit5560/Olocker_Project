import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';

class JewellerLoyaltyPointScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List loyaltyPointList = [];

  Future<void> getLoyaltyPointFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getLoyaltyPointApi}?customerId=${UserDetails.customerId}";
    log('getLoyaltyPointFunction Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('response : ${response.body}');



    } catch(e) {
      log('getLoyaltyPointFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  @override
  void onInit() {
    getLoyaltyPointFunction();
    super.onInit();
  }

}