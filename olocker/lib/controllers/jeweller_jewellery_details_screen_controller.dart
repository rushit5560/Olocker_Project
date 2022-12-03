import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/models/jeweller_details_screen_model/special_features_model.dart';
import 'package:olocker/models/jewellery_details_screen_model/get_jewellery_detail_model.dart';
import 'package:olocker/widgets/common_widgets.dart';
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

  Future<void> addFavouriteProductFunction() async {
    String url = "${ApiUrl.addFavProductApi}?Id=$productSrNo";

    log('addFavouriteProductFunction Api Url :: $url');

    try {
      // isLoading(true);
      var requestMap = {
        "CustomerId": UserDetails.customerId,
        "Product": productSrNo,
        "PartnerId": "$partnerSrNo",
        "IsSupplierProduct": true
      };

      log("rq map $requestMap");
      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: jsonEncode(requestMap),
      );
      log('addFavouriteProductFunction response : ${response.body}');

      var resBody = jsonDecode(response.body);

      isSuccessStatus.value = resBody["success"];

      if (response.statusCode == 200) {
        if (isSuccessStatus.value) {
          CommonWidgets().showBorderSnackBar(
            context: Get.context!,
            displayText: "Item Added to favourites.",
          );

          /// Add favourite button change in previous screen list
          // jewellerJewelleryListScreenController
          //     .jewelleryList[indexOfThisProduct].isFav = true;
          // getFavouriteProductFunction();
        }
      } else {
        log('addFavouriteProductFunction Else');
      }
    } catch (e) {
      log('addFavouriteProductFunction Error :$e');
      rethrow;
    } finally {
      isLoading(true);
      isLoading(false);
    }
    // await getAnnouncementOfferFunction();
  }

  Future<void> removeFavouriteProductFunction() async {
    String url = "${ApiUrl.removeFavProductApi}?Id=$productSrNo";

    log('removeFavouriteProductFunction Api Url :: $url');

    try {
      // isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('removeFavouriteProductFunction response : ${response.body}');
      var resBody = jsonDecode(response.body);

      isSuccessStatus.value = resBody["success"];

      if (response.statusCode == 200) {
        if (isSuccessStatus.value) {
          CommonWidgets().showBorderSnackBar(
            context: Get.context!,
            displayText: "Item Removed from favourites.",
          );

          /// Remove favourite button change in previous screen list
          // jewellerJewelleryListScreenController
          //     .jewelleryList[indexOfThisProduct].isFav = false;
          // getFavouriteProductFunction();
        }
      } else {
        log('addFavouriteProductFunction Else');
      }
    } catch (e) {
      log('removeFavouriteProductFunction Error :$e');
      rethrow;
    } finally {
      isLoading(true);
      isLoading(false);
    }
  }



  @override
  void onInit() {
    getJewellerJewelleryProductDetailFunction();
    super.onInit();
  }
}