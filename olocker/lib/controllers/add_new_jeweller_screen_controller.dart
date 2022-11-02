import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';

class AddNewJewellerScreenController extends GetxController {
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  final retailerFormKey = GlobalKey<FormState>();

  TextEditingController retailerCodeFieldController = TextEditingController();
  TextEditingController referralCodeFieldController = TextEditingController();

  RxBool isTypeEnable = false.obs;
  String refferalCode = "";

  Future<void> addMyJewellerFunction() async {
    isLoading(true);

    if (retailerFormKey.currentState!.validate()) {
      String url = ApiUrl.addMyJewellerApi;
      log('Add Jeweller Api Url : $url');

      try {
        Map<String, dynamic> bodyData = {
          "PartnerId": retailerCodeFieldController.text,
          "CustomerID": UserDetails.customerId,
          "ReferralCode": refferalCode
        };
        log('bodyData : $bodyData');

        http.Response response = await http.post(Uri.parse(url),
            headers: apiHeader.headers, body: bodyData);

        log('response11111 : ${response.body}');
      } catch (e) {
        log('addMyJewellerFunction Error :$e');
        rethrow;
      }
    }
  }
}
