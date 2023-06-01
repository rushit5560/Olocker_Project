import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/enum.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:share_plus/share_plus.dart';
import '../models/jeweller_details_screen_model/get_offer_details_list_model.dart';
import '../models/refer_and_earn_screen_models/get_partner_by_code_model.dart';
import '../models/user_profile_models/user_profile_get_model.dart';
import '../widgets/common_widgets.dart';


class OffersJewelleryListScreenController extends GetxController {
  // Getting from jeweller details screen
  // String offerName = Get.arguments[0];
  String offerId = Get.arguments[0];
  String jewellerId = Get.arguments[1];
  List<String> collectionNameList = Get.arguments[2] ?? [];
  SearchCategory searchCategory = Get.arguments[3];
  // JewelleryListType jewelleryListType =
  //     Get.arguments[3] ?? JewelleryListType.categoryId;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  Size size = Get.size;
  ApiHeader apiHeader = ApiHeader();
  RxInt selectedSortingIndex = 0.obs;

  RxBool sortPriceValue = false.obs;

  GetOfferDetailResultModel? offerDetailResultModeldata;

  final List<GetProduct> _jewelleryList = [];
  final List<GetProduct> searchJewelleryList = [];

  List<GetProduct> get jewelleryList => _jewelleryList;

  PartnerDetails? partnerDetails;

  RxString userReferaalCode = "".obs;

  RxBool isSearchOn = false.obs;
  TextEditingController searchFieldController = TextEditingController();

  final ScrollController scrollController = ScrollController();
  RxBool hasMore = true.obs;
  int pageIndex = 1;

  RxBool hasSearchMore = true.obs;
  int pageSearchIndex = 1;


  // SearchField Search Function
  getOfferSearchTextListFunction(String searchText) {
    return searchFieldController.text.trim().isEmpty
        ? collectionNameList
        : collectionNameList.where((element) {
      String searchListString = element.toLowerCase();
      String searchTextNew = searchText.toLowerCase();
      return searchListString.contains(searchTextNew);
    }).toList();
  }

  // Get Category All Product
  Future<void> getOfferDetailListFunction() async {
    isLoading(true);
    String url = "";

    // if (jewelleryListType == JewelleryListType.categoryId) {
    url =
        "${ApiUrl.getOfferDetailApi}?OfferId=$offerId&CustomerSrNo=${UserDetails.customerId}";
    // } else {
    //   url =
    //       "${ApiUrl.getJewellerJewelleriesApi}?PartnerSrNo=$jewellerId&ProductType=$jewelleryCategoryId";
    // }
    log('getOfferDetailListFunction Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getOfferDetailListFunction response : ${response.body}');

      GetOfferDetailResultModel getOfferDetailResultModel =
          GetOfferDetailResultModel.fromJson(json.decode(response.body));
      isSuccessStatus = getOfferDetailResultModel.success.obs;

      if (isSuccessStatus.value) {
        offerDetailResultModeldata = getOfferDetailResultModel;
        _jewelleryList.clear();
        _jewelleryList.addAll(getOfferDetailResultModel.getProduct);

        // _jewelleryList.
        log('getOfferDetailListFunction _jewelleryList : ${_jewelleryList.length}');
      } else {
        log('getOfferDetailListFunction Else');
      }
    } catch (e) {
      log('getOfferDetailListFunction Error : $e');
      rethrow;
    } finally {
      await getPartnerByCodeFunction();
      // isLoading(false);
    }
  }

  Future<void> getSearchProductsFunction(String searchName) async {
    isLoading(true);
    String url = "${ApiUrl.getOfferDetailApi}?OfferId=$offerId&CustomerSrNo=${UserDetails.customerId}";

    // "${ApiUrl.getOfferDetailApi}?OfferId=$offerId&CustomerSrNo=${UserDetails.customerId}"
    // "api/Partner/GetOfferDetail?OfferId=$offerId&CustomerSrNo=${UserDetails.customerId}"


    // if(SearchCategory.collectionType == searchCategory) {
    //   url = "${ApiUrl.getJewellerJewelleriesApi}?PartnerSrNo=$jewellerId&CollectionID=$searchName&CustomerId=${UserDetails.customerId}";
    // } else if(SearchCategory.categoryType == searchCategory) {
    //   url = "${ApiUrl.getJewellerJewelleriesApi}?PartnerSrNo=$jewellerId&Category=$searchName&CustomerId=${UserDetails.customerId}";
    // } else if(SearchCategory.productType == searchCategory) {
    //   url = "${ApiUrl.getJewellerJewelleriesApi}?PartnerSrNo=$jewellerId&ProductType=$searchName&CustomerId=${UserDetails.customerId}";
    // }
    log('Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getOfferDetailListFunction response : ${response.body}');

      GetOfferDetailResultModel getOfferDetailResultModel =
      GetOfferDetailResultModel.fromJson(json.decode(response.body));
      isSuccessStatus = getOfferDetailResultModel.success.obs;

      if (isSuccessStatus.value) {
        offerDetailResultModeldata = getOfferDetailResultModel;
        searchJewelleryList.clear();
        searchJewelleryList.addAll(getOfferDetailResultModel.getProduct);

        // _jewelleryList.
        log('getOfferDetailListFunction _jewelleryList : ${_jewelleryList.length}');
      } else {
        log('getOfferDetailListFunction Else');
      }
    } catch (e) {
      log('getOfferDetailListFunction Error : $e');
      rethrow;
    }

    isLoading(false);
    // loadUI();
  }

  // Add product in Fav
  Future<void> addFavouriteProductFunction(
      {required String productSrNo, required GetProduct singleProduct}) async {
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
      {required String favouriteId, required GetProduct singleProduct}) async {
    String url = "${ApiUrl.removeFavProductApi}?Id=$favouriteId";

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
      await getUserProfileDetailsFunction();
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

  changeSortOption() {
    isLoading(true);
    List<GetProduct> withPriceList = [];
    List<GetProduct> withoutPriceList = [];

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

  @override
  void onInit() {
    getOfferDetailListFunction();
    super.onInit();
  }
}
