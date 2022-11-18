import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/models/jeweller_jewellery_list_screen_model/all_jewellery_model.dart';

import '../widgets/common_widgets.dart';

class JewellerJewelleryListScreenController extends GetxController {
  String jewelleryName =
      Get.arguments[0]; // Getting from jeweller details screen
  String jewelleryCategoryId =
      Get.arguments[1]; // Getting from jeweller details screen
  String jewellerId = Get.arguments[2]; // Getting from jeweller details screen

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  Size size = Get.size;
  ApiHeader apiHeader = ApiHeader();

  RxBool sortPriceValue = false.obs;

  final List<SearchProductListDatum> _jewelleryList = [];

  List<SearchProductListDatum> get jewelleryList => _jewelleryList;

  // Get Category All Product
  Future<void> getAllJewelleryListFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getJewellerJewelleriesApi}?PartnerSrNo=$jewellerId&CollectionID=$jewelleryCategoryId";
    log('getAllJewelleryListFunction Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      // log('response : ${response.body}');

      AllJewelleryModel allJewelleryModel =
          AllJewelleryModel.fromJson(json.decode(response.body));
      isSuccessStatus = allJewelleryModel.success.obs;

      if (isSuccessStatus.value) {
        _jewelleryList.clear();
        _jewelleryList.addAll(allJewelleryModel.searchProductListData);

        // _jewelleryList.
        log('_jewelleryList : ${_jewelleryList.length}');
      } else {
        log('getAllJewelleryListFunction Else');
      }
    } catch (e) {
      log('getAllJewelleryListFunction Error : $e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  // Add product in Fav
  Future<void> addFavouriteProductFunction(
      {required String productSrNo}) async {
    // isLoading(true);
    String url = "${ApiUrl.addFavProductApi}?Id=$productSrNo";

    log('addFavouriteProductFunction Api Url :: $url');

    try {
      var requestMap = {
        "CustomerId": UserDetails.customerId,
        "Product": productSrNo,
        "PartnerId": jewellerId,
        "IsSupplierProduct": true
      };
      log('requestMap : $requestMap');
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
        }
      } else {
        log('addFavouriteProductFunction Else');
      }
    } catch (e) {
      log('addFavouriteProductFunction Error :$e');
      rethrow;
    } finally {
      // isLoading(false);
    }
    // await getAnnouncementOfferFunction();
  }

  @override
  void onInit() {
    getAllJewelleryListFunction();
    super.onInit();
  }
}
