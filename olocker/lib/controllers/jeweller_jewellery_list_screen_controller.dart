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

import '../models/refer_and_earn_screen_models/get_partner_by_code_model.dart';
import '../models/user_profile_models/user_profile_get_model.dart';
import '../widgets/common_widgets.dart';

class JewellerJewelleryListScreenController extends GetxController {
  // Getting from jeweller details screen
  String jewelleryName = Get.arguments[0];
  String jewelleryCategoryId = Get.arguments[1];
  String jewellerId = Get.arguments[2];
  JewelleryListType jewelleryListType =
      Get.arguments[3] ?? JewelleryListType.categoryId;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  Size size = Get.size;
  ApiHeader apiHeader = ApiHeader();
  RxInt selectedSortingIndex = 0.obs;

  RxBool sortPriceValue = false.obs;

  final List<SearchProductListDatum> _jewelleryList = [];

  List<SearchProductListDatum> get jewelleryList => _jewelleryList;

  PartnerDetails? partnerDetails;

  RxString userReferaalCode = "".obs;

  // Get Category All Product
  Future<void> getAllJewelleryListFunction() async {
    isLoading(true);
    String url = "";

    if (jewelleryListType == JewelleryListType.categoryId) {
      url =
          "${ApiUrl.getJewellerJewelleriesApi}?PartnerSrNo=$jewellerId&CollectionID=$jewelleryCategoryId&CustomerId=${UserDetails.customerId}";
    } else {
      url =
          "${ApiUrl.getJewellerJewelleriesApi}?PartnerSrNo=$jewellerId&ProductType=$jewelleryCategoryId";
    }
    log('getAllJewelleryListFunction Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getAllJewelleryListFunction response : ${response.body}');

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
      getPartnerByCodeFunction();
      // isLoading(false);
    }
  }

  // Add product in Fav
  Future<void> addFavouriteProductFunction(
      {required String productSrNo,
      required SearchProductListDatum singleProduct}) async {
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
          singleProduct.isFav = true;
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

  Future<void> removeFavouriteProductListFunction(
      {required String productSrNo,
      required SearchProductListDatum singleProduct}) async {
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
          singleProduct.isFav = false;
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

  changeSortOption() {
    isLoading(true);
    List<SearchProductListDatum> withPriceList = [];
    List<SearchProductListDatum> withoutPriceList = [];

    for (int i = 0; i < _jewelleryList.length; i++) {
      if (_jewelleryList[i].productsPrice.contains(".")) {
        withPriceList.add(_jewelleryList[i]);

        if (selectedSortingIndex.value == 0) {
          withPriceList
              .sort((a, b) => a.productsPrice.compareTo(b.productsPrice));
        } else if (selectedSortingIndex.value == 1) {
          withPriceList
              .sort((a, b) => b.productsPrice.compareTo(a.productsPrice));
        }
      } else {
        withoutPriceList.add(_jewelleryList[i]);
      }
    }

    _jewelleryList.clear();
    _jewelleryList.addAll(withPriceList);
    _jewelleryList.addAll(withoutPriceList);

    isLoading(false);
  }

  shareJewelleryReferFriend() async {
    // var urlPreview = "";
    String shareText =
        '''I loved this beautiful jewellery from ${partnerDetails!.partnerName.capitalize!} on olocker app. 
    You must download this app to witness their excellent jewellery collections, get fabulous deals & 
    rewards too. Click here https://olocker.in/DetectOS.aspx and use my referral 
    code ${userReferaalCode.value}-${partnerDetails!.partnerId} on ENTER CODE space on Sign up page https://www.olocker.in/''';

    await Share.share(shareText);
  }

  Future<void> getPartnerByCodeFunction() async {
    // if (formKey.currentState!.validate()) {
    String url = "${ApiUrl.getPartnerByCodeApi}?PartnerCode=$jewellerId";
    log(" getPartnerByCodeFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getPartnerByCodeFunction st code is : ${response.statusCode}");
      log("getPartnerByCodeFunction res body : ${response.body}");

      var resBody = jsonDecode(response.body);

      GetPartnerByCodeModel getPartnerByCodeModel =
          GetPartnerByCodeModel.fromJson(resBody);

      bool isSuccessResult = getPartnerByCodeModel.success;

      if (isSuccessResult) {
        log("getPartnerByCodeFunction get success");
        partnerDetails = getPartnerByCodeModel.partner;
      } else {
        log("getPartnerByCodeFunction get not success");
        //do nothing
      }
    } catch (e) {
      log("getPartnerByCodeFunction Error ::: $e");
      rethrow;
    } finally {
      getUserProfileDetailsFunction();
      // isLoading(false);
    }
    // }
  }

  Future<void> getUserProfileDetailsFunction() async {
    String url =
        "${ApiUrl.getUserProfileApi}?customerId=${UserDetails.customerId}";
    log(" getUserProfleDetailsFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getUserProfleDetailsFunction st code is : ${response.statusCode}");
      log("getUserProfleDetailsFunction res body : ${response.body}");

      var resBody = jsonDecode(response.body);

      UserProfileGetModel userProfileGetModel =
          UserProfileGetModel.fromJson(resBody);

      bool isSuccessResult = userProfileGetModel.success;

      if (isSuccessResult) {
        log("user profile get success");
        userReferaalCode.value =
            userProfileGetModel.customerProfile.referralCode;
        log("user userReferaalCode :: $userReferaalCode");
      } else {
        log("user profile get not success");
        //do nothing
      }
    } catch (e) {
      log("getUserProfleDetailsFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllJewelleryListFunction();
    super.onInit();
  }
}
