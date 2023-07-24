import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/jeweller_details_screen_model/special_features_model.dart';
import '../models/jewellery_details_screen_model/get_jewellery_detail_model.dart';
import '../models/refer_and_earn_screen_models/get_partner_by_code_model.dart';
import '../models/user_profile_models/user_profile_get_model.dart';
import 'jeweller_jewellery_list_screen_controller.dart';

class JewelleryDetailsScreenController extends GetxController {
  var partnerSrNo = Get.arguments[0]; // Coming From Home Screen Jeweller List
  var productSrNo = Get.arguments[1]; // Coming From Home Screen Jeweller List
  var jewelleryTypeName =
      Get.arguments[2]; // Coming From Home Screen Jeweller List
  int indexOfThisProduct = Get.arguments[3];
  String productImage = Get.arguments[4];

  // Find Previous screen controller here for Product fav or unFav.
  final jewellerJewelleryListController =
      Get.lazyPut(() => JewellerJewelleryListScreenController(), fenix: true);
  final jewellerJewelleryListScreenController =
      Get.find<JewellerJewelleryListScreenController>();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  Size size = Get.size;
  ApiHeader apiHeader = ApiHeader();
  int isStatusCode = 0;
  RxInt fullScreenImageCurrentindex = 0.obs;

  // PageController fullscreenImageController = PageController();

  late ProductDetailsData productDetailsData;
  List<SpecialFeatureItem> specialFeaturesList = [];

  PartnerDetails? partnerDetails;

  RxString userReferaalCode = "".obs;

  launchWhatsappChat({
    required String mobileNumber,
    required String msg,
  }) async {
    // var whatsapp = mobileNumber;
    var whatsappAndroid =
        Uri.parse("whatsapp://send?phone=$mobileNumber&text=$msg");

    try {
      await launchUrl(whatsappAndroid);
    } catch (e) {
      if (e.toString().contains("ACTIVITY_NOT_FOUND")) {
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "Whatsapp is not installed",
        );
      }
      log("launchWhatsappChat error occured :: $e");

      rethrow;
    }
    // if (await canLaunchUrl(whatsappAndroid)) {
    // } else {}
  }

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

        if (getJewelleryDetailModel.errorInfo.description
            .contains("Product data not found.")) {
          CommonWidgets().showBorderSnackBar(
            context: Get.context!,
            displayText: getJewelleryDetailModel.errorInfo.description,
          );
        }

        log('productDetailsData is  : $productDetailsData');
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
      // isSuccessStatus = specialFeaturesModel.success.obs;
      isStatusCode = specialFeaturesModel.statusCode;
      if (isSuccessStatus.value) {
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

      // isSuccessStatus.value = resBody["success"];

      if (response.statusCode == 200) {
        // if (isSuccessStatus.value) {
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "Item Added to favourites.",
        );

        /// Add favourite button change in previous screen list
        jewellerJewelleryListScreenController
            .mainJewelleryList[indexOfThisProduct].isFav = true;
        // getFavouriteProductFunction();
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

      // isSuccessStatus.value = resBody["success"];

      if (response.statusCode == 200) {
        // if (isSuccessStatus.value) {
          CommonWidgets().showBorderSnackBar(
            context: Get.context!,
            displayText: "Item Removed from favourites.",
          );

          /// Remove favourite button change in previous screen list
          jewellerJewelleryListScreenController
              .mainJewelleryList[indexOfThisProduct].isFav = false;
          // getFavouriteProductFunction();
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
    log(" getUserProfileDetailsFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getUserProfileDetailsFunction st code is : ${response.statusCode}");
      log("getUserProfileDetailsFunction res body : ${response.body}");

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
      log("getUserProfileDetailsFunction Error ::: $e");
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
