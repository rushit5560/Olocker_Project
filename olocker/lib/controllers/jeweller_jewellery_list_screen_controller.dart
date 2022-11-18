import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/enum.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/models/jeweller_jewellery_list_screen_model/all_jewellery_model.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/common_widgets.dart';

class JewellerJewelleryListScreenController extends GetxController {
  // Getting from jeweller details screen
  String jewelleryName = Get.arguments[0];
  String jewelleryCategoryId = Get.arguments[1];
  String jewellerId = Get.arguments[2];
  JewelleryListType jewelleryListType = Get.arguments[3] ?? JewelleryListType.categoryId;

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
    String url = "";

    if(jewelleryListType == JewelleryListType.categoryId) {
      url = "${ApiUrl.getJewellerJewelleriesApi}?PartnerSrNo=$jewellerId&CollectionID=$jewelleryCategoryId";
    } else {
      url = "${ApiUrl.getJewellerJewelleriesApi}?PartnerSrNo=$jewellerId&ProductType=$jewelleryCategoryId";
    }
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

   shareJewellery() async {
    // var urlPreview = "";
    await Share.share("share this jewellery to a person https://example.com");
  }

  

  @override
  void onInit() {
    getAllJewelleryListFunction();
    super.onInit();
  }
}