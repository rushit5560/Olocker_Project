import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/models/jeweller_details_screen_model/special_features_model.dart';
import 'package:olocker/models/jewellery_details_screen_model/get_jewellery_detail_model.dart';
import 'package:share_plus/share_plus.dart';

class JewellerJewelleryDetailsScreenController extends GetxController {
  /// Getting this jeweller details screen
  String partnerSrNo = Get.arguments[0];
  int productSrNo = Get.arguments[1];
  String jewelleryTypeName = Get.arguments[2];



  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  Size size = Get.size;

  late ProductDetailsData productDetailsData;
  List<SpecialFeatureItem> specialFeaturesList = [];



  Future<void> getJewellerJewelleryProductDetailFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getJewelleryDetailApi}?partnerSrNo=$partnerSrNo&productSrno=$productSrNo";
    log('getJewelleryProductDetailFunction Api Url :: $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log(' getJewelleryProductDetailFunction  response : ${response.body}');

      GetJewelleryDetailModel getJewelleryDetailModel =
      GetJewelleryDetailModel.fromJson(json.decode(response.body));

      isSuccessStatus = getJewelleryDetailModel.success.obs;

      if (response.statusCode == 200) {
        productDetailsData = getJewelleryDetailModel.productDetailsData;

        log('productDetailsData is  : ${productDetailsData}');
      } else {
        log('getJewelleryProductDetailFunction Else');
      }
    } catch (e) {
      log('getJewelleryProductDetailFunction Error :$e');
      rethrow;
    } finally {
      // isLoading(false);
      await getJewellerJewellerySpecialFeaturesFunction();
    }
  }

  Future<void> getJewellerJewellerySpecialFeaturesFunction() async {
    // isLoading(true);
    String url = "${ApiUrl.getSpecialFeaturesApi}?partnerSrNo=$partnerSrNo";

    log('getJewellerySpecialFeaturesFunction Api Url :: $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getJewellerySpecialFeaturesFunction response :: ${response.body}');

      SpecialFeaturesModel specialFeaturesModel =
      SpecialFeaturesModel.fromJson(json.decode(response.body));
      isSuccessStatus = specialFeaturesModel.success.obs;

      if (isSuccessStatus.value) {
        specialFeaturesList.clear();
        specialFeaturesList.addAll(specialFeaturesModel.specialFeature);
        // log('specialFeaturesList : ${specialFeaturesList.length}');
      } else {
        log('getSpecialFeaturesFunction Else');
      }
    } catch (e) {
      log('getJewellerySpecialFeaturesFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  shareJewelleryProduct() async {
    // var urlPreview = "";
    await Share.share("share this jewellery to a person https://example.com");
  }



  @override
  void onInit() {
    getJewellerJewelleryProductDetailFunction();
    super.onInit();
  }
}