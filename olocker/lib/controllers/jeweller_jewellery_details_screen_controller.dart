import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/models/jeweller_details_screen_model/special_features_model.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:share_plus/share_plus.dart';
import '../models/jewellery_details_screen_model/get_offer_jewellery_detail_model.dart';
import '../models/refer_and_earn_screen_models/get_partner_by_code_model.dart';
import '../models/user_profile_models/user_profile_get_model.dart';

class JewellerJewelleryDetailsScreenController extends GetxController {
  /// Getting this jeweller details screen
  String partnerSrNo = Get.arguments[0];
  int productSrNo = Get.arguments[1];
  String jewelleryTypeName = Get.arguments[2];

  // String productimage = Get.arguments[3];
  int isStatusCode = 0;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();
  Size size = Get.size;

  GetProductModel productDetailsData = GetProductModel();
  List<SpecialFeatureItem> specialFeaturesList = [];

  PartnerDetails? partnerDetails;

  RxString userReferaalCode = "".obs;

  RxInt fullScreenImageCurrentindex = 0.obs;

  Future<void> getJewellerJewelleryProductDetailFunction() async {
    log("getJewellerJewelleryProductDetailFunction PartnerSrNo:: $partnerSrNo");
    isLoading(true);
    String url = "${ApiUrl.getOfferJewelleryDetailApi}"
        "?productSrno=$productSrNo"
        "&Customerno=${UserDetails.customerId}"
        "&partnerSrNo=$partnerSrNo";
    log('getJewelleryProductDetailFunction Api Url :: $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log(' getJewelleryProductDetailFunction  response : ${response.body}');

      GetOfferFavouriteVendorModel getJewelleryDetailModel =
          GetOfferFavouriteVendorModel.fromJson(json.decode(response.body));

      // isSuccessStatus = getJewelleryDetailModel.success.obs;
      isStatusCode= getJewelleryDetailModel.statusCode;
      if (isStatusCode == 200) {
        productDetailsData = getJewelleryDetailModel.data.productDetailsData;

        if (getJewelleryDetailModel.data.errorInfo.description
            .contains("Product data not found.")) {
          CommonWidgets().showBorderSnackBar(
            context: Get.context!,
            displayText: getJewelleryDetailModel.data.errorInfo.description,
          );
        }

        // log('productDetailsData is  : ${productDetailsData}');
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
      // isSuccessStatus = specialFeaturesModel.success.obs;
      isStatusCode = specialFeaturesModel.statusCode;
      if (isStatusCode == 200) {
        specialFeaturesList.clear();
        specialFeaturesList.addAll(specialFeaturesModel.data);
        // log('specialFeaturesList : ${specialFeaturesList.length}');
      } else {
        log('getSpecialFeaturesFunction Else');
        if (isStatusCode == 400) {
          log("BadRequest");
        } else if (isStatusCode == 404) {
          log("NotFound");
        } else if (isStatusCode == 406) {
          log("NotAcceptable");
        } else if (isStatusCode == 417) {
          log("HttpStatusCode.ExpectationFailed");
        }
      }
    } catch (e) {
      log('getJewellerySpecialFeaturesFunction Error :$e');
      rethrow;
    } finally {
      getPartnerByCodeFunction();
      // isLoading(false);
    }
  }

  Future<void> addFavouriteProductFunction() async {
    String url = "${ApiUrl.addFavProductApi}?Id=$productSrNo";

    log('addFavouriteProductFunction Api Url :: $url');

    try {
      // isLoading(true);
      var requestMap = {
        "CustomerId": UserDetails.customerId,
        "Product": productSrNo,
        "PartnerId": partnerSrNo,
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
      // isSuccessStatus.value = resBody["success"];
      //
      if (response.statusCode == 200) {
        log("response.statusCode : ${response.statusCode}");
        // if (isSuccessStatus.value) {
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "Item Added to favourites.",
        );

        productDetailsData.isFav = true;
        // }
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
    String url = "${ApiUrl.removeFavProductApi}"
        "?Id=${productDetailsData.favId}";

    log('removeFavouriteProductFunction Api Url :: $url');

    try {
      // isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('removeFavouriteProductFunction response : ${response.body}');
      var resBody = jsonDecode(response.body);

      // isSuccessStatus.value = resBody["success"];

      if (response.statusCode == 200) {
        // if (isSuccessStatus.value) {
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "Item Removed from favourites.",
        );

        productDetailsData.isFav = false;
        // }
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

  Future<void> getPartnerByCodeFunction() async {
    // if (formKey.currentState!.validate()) {
    String url = "${ApiUrl.getPartnerByCodeApi}?PartnerCode=$partnerSrNo";
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

      // bool isSuccessResult = getPartnerByCodeModel.success;
      isStatusCode = getPartnerByCodeModel.statusCode;
      if (isStatusCode == 200) {
        log("getPartnerByCodeFunction get success");
        partnerDetails = getPartnerByCodeModel.data.partner;
      } else {
        log("getPartnerByCodeFunction get not success");
        if (isStatusCode == 400) {
          log("BadRequest");
        } else if (isStatusCode == 404) {
          log("NotFound");
        } else if (isStatusCode == 406) {
          log("NotAcceptable");
        } else if (isStatusCode == 417) {
          log("HttpStatusCode.ExpectationFailed");
        }
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

      // bool isSuccessResult = userProfileGetModel.success;
      isStatusCode = userProfileGetModel.statusCode;
      if (isStatusCode == 200) {
        log("user profile get success");
        userReferaalCode.value = userProfileGetModel.data.referralCode;
        log("user userReferaalCode :: $userReferaalCode");
      } else {
        if (isStatusCode == 400) {
          log("BadRequest");
        } else if (isStatusCode == 404) {
          log("NotFound");
        } else if (isStatusCode == 406) {
          log("NotAcceptable");
        } else if (isStatusCode == 417) {
          log("HttpStatusCode.ExpectationFailed");
        }
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
    getJewellerJewelleryProductDetailFunction();
    super.onInit();
  }
}
