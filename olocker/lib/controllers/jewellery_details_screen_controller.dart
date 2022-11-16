import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:share_plus/share_plus.dart';

import '../models/jeweller_details_screen_model/special_features_model.dart';
import '../models/jewellery_details_screen_model/get_jewellery_detail_model.dart';

class JewelleryDetailsScreenController extends GetxController {
  var partnerSrNo = Get.arguments[0]; // Coming From Home Screen Jeweller List
  var productSrNo = Get.arguments[1]; // Coming From Home Screen Jeweller List
  var jewelleryTypeName =
      Get.arguments[2]; // Coming From Home Screen Jeweller List

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  Size size = Get.size;
  ApiHeader apiHeader = ApiHeader();

  // PageController fullscreenImageController = PageController();

  late ProductDetailsData productDetailsData;
  List<SpecialFeatureItem> specialFeaturesList = [];

  // List<SpecialFeatureItem> specialFeaturesList = [];
  // List<GetPushOfferItem> announcementOfferList = [];
  // List<GetPushCollectionItem> jewelleryCategoryList = [];
  // List<ProductTypeItem> menTypeList = [];
  // List<ProductTypeItem> womenTypeList = [];
  // List<ListOfProduct> bestSellerList = [];
  // List<Testimonial> clientTestimonialsList = [];

  // String goldPrice1 = '';
  // String goldPrice2 = '';
  // String goldPrice3 = '';
  // List<String> goldCaratImagesList = [
  //   AppImages.goldIcon24Image,
  //   AppImages.goldIcon22Image,
  //   AppImages.goldIcon18Image,
  // ];

  Future<void> getJewelleryProductDetailFunction() async {
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
      await getJewellerySpecialFeaturesFunction();
    }
  }

  Future<void> getJewellerySpecialFeaturesFunction() async {
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

  shareJewelleryProduct() {
    // var urlPreview = "";
    Share.share("share this jewellery to a person https://example.com");
  }

  Future<void> addFavouriteProductFunction() async {
    String url = "${ApiUrl.addFavProductApi}?Id=$productSrNo";

    log('addFavouriteProductFunction Api Url :: $url');

    try {
      isLoading(true);
      var requestMap = {
        "CustomerId": UserDetails.customerId,
        "Product": productSrNo,
        "PartnerId": "$partnerSrNo",
        "IsSupplierProduct": true
      };
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
          getFavouriteProductFunction();
        }
      } else {
        log('addFavouriteProductFunction Else');
      }
    } catch (e) {
      log('addFavouriteProductFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
    // await getAnnouncementOfferFunction();
  }

  Future<void> removeFavouriteProductFunction() async {
    String url = "${ApiUrl.removeFavProductApi}?Id=$productSrNo";

    log('removeFavouriteProductFunction Api Url :: $url');

    try {
      isLoading(true);
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
          getFavouriteProductFunction();
        }
      } else {
        log('addFavouriteProductFunction Else');
      }
    } catch (e) {
      log('removeFavouriteProductFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> getFavouriteProductFunction() async {
    // isLoading(true);
    String url =
        "${ApiUrl.getFavProductApi}?customerId=${UserDetails.customerId}&PartnerSRno=$partnerSrNo";

    log('getFavouriteProductFunction Api Url :: $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('response : ${response.body}');

      // GetJewelleryDetailModel getJewelleryDetailModel =
      //     GetJewelleryDetailModel.fromJson(json.decode(response.body));

      // isSuccessStatus = getJewelleryDetailModel.success.obs;

      // if (response.statusCode == 200) {
      //   productDetailsData = getJewelleryDetailModel.productDetailsData;

      //   log('productDetailsData is  : ${productDetailsData}');
      // } else {
      //   log('getFavouriteProductFunction Else');
      // }
    } catch (e) {
      log('getFavouriteProductFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getJewelleryProductDetailFunction();
    super.onInit();
  }
}
