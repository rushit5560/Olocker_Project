import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/controllers/home_screen_controller.dart';
import 'package:olocker/models/add_jeweller_screen_models/add_jeweller_model.dart';
import 'package:olocker/widgets/common_widgets.dart';

class AddNewJewellerScreenController extends GetxController {
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController retailerCodeFieldController = TextEditingController();
  TextEditingController referralCodeFieldController = TextEditingController();

  RxBool isTypeEnable = false.obs;
  String refferalCode = "";

  Future<void> addMyJewellerFunction() async {
    if (formKey.currentState!.validate()) {
      isLoading(true);
      String url = ApiUrl.addMyJewellerApi;
      log('addMyJewellerFunction Api Url : $url');

      try {
        Map<String, dynamic> bodyData = {
          "PartnerId": retailerCodeFieldController.text,
          "CustomerID": UserDetails.customerId,
          "ReferralCode": refferalCode
        };
        log('bodyData : $bodyData');

        http.Response response = await http.post(
          Uri.parse(url),
          headers: apiHeader.headers,
          body: jsonEncode(bodyData),
        );
        log("addMyJewellerFunction res body :: ${response.body}");

        AddJewellerModel addJewellerModel =
            AddJewellerModel.fromJson(jsonDecode(response.body));
        isSuccessStatus = addJewellerModel.success.obs;

        if (isSuccessStatus.value) {
          //todo - Success Snackbar "Jeweller Added"
          CommonWidgets().showBorderSnackBar(
            context: Get.context!,
            displayText:
                "${addJewellerModel.retailerDetail.retailerName} Added",
          );

          Get.back();
          final homeScreenController = Get.find<HomeScreenController>();

          homeScreenController.getMyJewellersFunction();

          log('${addJewellerModel.retailerDetail.retailerName} Added');
        } else {
          CommonWidgets().showBorderSnackBar(
            context: Get.context!,
            displayText: addJewellerModel.errorInfo.extraInfo,
          );
          log('addMyJewellerFunction ${addJewellerModel.errorInfo.extraInfo}');
          // if (addJewellerModel.errorInfo.extraInfo
          //     .toString()
          //     .contains('Jeweller code not found or invalid')) {
          //   //todo - snackbar "Jeweller code not found or invalid"
          //   log('Jeweller code not found or invalid');
          // } else {
          //   log('addMyJewellerFunction Else');
          // }
        }
      } catch (e) {
        log('addMyJewellerFunction Error :$e');
        rethrow;
      } finally {
        isLoading(false);
      }
    }
    // isLoading(false);
  }
}
