import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/models/jeweller_details_screen_model/about_your_self_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/announcement_offer_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/best_seller_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/client_testimonials_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/gold_price_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/jewellery_category_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/jewellery_type_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/special_features_model.dart';

class JewellerDetailsScreenController extends GetxController {
  var jewellerId = Get.arguments[0]; // Coming From Home Screen Jeweller List
  var jewellerName = Get.arguments[1]; // Coming From Home Screen Jeweller List

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  Size size = Get.size;
  ApiHeader apiHeader = ApiHeader();

  // RxBool isSpecialFeaturesLoading = false.obs;
  // RxBool isAnnouncementOfferLoading = false.obs;
  // RxBool isJewelleryPushToAppDataLoading = false.obs;
  // RxBool isJewelleryTypeLoading = false.obs;
  // RxBool isBestSellerLoading = false.obs;
  // RxBool isTestimonialLoading = false.obs;
  // RxBool isGoldPriceLoading = false.obs;
  // RxBool isAboutYourSelfLoading = false.obs;

  List<SpecialFeatureItem> specialFeaturesList = [];
  List<GetPushOfferItem> announcementOfferList = [];
  List<GetPushCollectionItem> jewelleryCategoryList = [];
  List<GetPushCollectionItem> newArrivalList = [];
  List<ProductTypeItem> menTypeList = [];
  List<ProductTypeItem> womenTypeList = [];
  List<ProductTypeItem> kidsTypeList = [];
  List<ListOfProduct> bestSellerList = [];
  List<Testimonial> clientTestimonialsList = [];

  RxBool isFeedbackValue = false.obs;

  List<IbjAratesList> goldPriceList = [];
  String goldPrice1 = '';
  String goldPrice2 = '';
  String goldPrice3 = '';
  List<String> goldCaratImagesList = [
    AppImages.goldIcon24Image,
    AppImages.goldIcon22Image,
    AppImages.goldIcon18Image,
  ];

  RxInt bannerCurrentIndex = 0.obs;

  Future<void> getSpecialFeaturesFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getSpecialFeaturesApi}?PartnerSrNo=$jewellerId";
    log('getSpecialFeaturesFunction Api Url :$url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getSpecialFeaturesFunction response : ${response.body}');

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
      log('getSpecialFeaturesFunction Error :$e');
      rethrow;
    }

    await getAnnouncementOfferFunction();
    // isLoading(false);
  }

  Future<void> getAnnouncementOfferFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getAnnouncementOfferApi}?PartnerSrNo=$jewellerId";
    log('getAnnouncementOfferFunction Api Url :$url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getAnnouncementOfferFunction response : ${response.body}');

      AnnouncementOfferModel announcementOfferModel =
          AnnouncementOfferModel.fromJson(json.decode(response.body));
      isSuccessStatus = announcementOfferModel.success.obs;

      if (isSuccessStatus.value) {
        announcementOfferList.clear();
        announcementOfferList.addAll(announcementOfferModel.getPushOffer);
        log('announcementOfferList : ${announcementOfferList.length}');
      } else {
        log('getAnnouncementOfferFunction Else');
      }
    } catch (e) {
      log('getAnnouncementOfferFunction Error :$e');
      rethrow;
    }

    await getJewelleryPushToAppDataFunction();
    // isLoading(false);
  }

  Future<void> getJewelleryPushToAppDataFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getJewelleryGetPushToAppDataApi}?PartnerSrNo=$jewellerId";
    log('getJewelleryPushToAppDataFunction Api Url :$url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getJewelleryPushToAppDataFunction response : ${response.body}');

      JewelleryCategoryModel jewelleryCategoryModel =
          JewelleryCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = jewelleryCategoryModel.success.obs;

      if (isSuccessStatus.value) {
        jewelleryCategoryList.clear();
        jewelleryCategoryList.addAll(jewelleryCategoryModel.getPushCollection);
        if (jewelleryCategoryModel.getPushOffer.isNotEmpty) {
          for (int i = 0; i < jewelleryCategoryModel.getPushOffer.length; i++) {
            var singleItem = jewelleryCategoryModel.getPushOffer[i];
            announcementOfferList.add(GetPushOfferItem(
              srNo: singleItem.srNo,
              name: singleItem.name,
              imageurl: singleItem.imageurl,
              pushSortOrder: singleItem.pushSortOrder,
              isClickable: true,
            ));
            // jewelleryCategoryModel.getPushOffer
          }
        }

        log('jewelleryCategoryList : ${jewelleryCategoryList.length}');
      } else {
        log('getJewelleryPushToAppDataFunction Else');
      }
    } catch (e) {
      log('getJewelleryPushToAppDataFunction Error :$e');
      rethrow;
    }

    await getNewArrivalFunction();
    // isLoading(false);
  }

  Future<void> getNewArrivalFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getNewArrivalApi}?PartnerSrNo=$jewellerId";
    log('getNewArrivalFunction Api Url :$url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getNewArrivalFunction response : ${response.body}');

      JewelleryCategoryModel jewelleryCategoryModel =
      JewelleryCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = jewelleryCategoryModel.success.obs;

      if (isSuccessStatus.value) {
        newArrivalList.clear();
        newArrivalList.addAll(jewelleryCategoryModel.getPushCollection);

        log('newArrivalList : ${newArrivalList.length}');
      } else {
        log('getNewArrivalFunction Else');
      }
    } catch (e) {
      log('getNewArrivalFunction Error :$e');
      rethrow;
    }

    await getJewelleryTypeFunction();
    // isLoading(false);
  }

  Future<void> getJewelleryTypeFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getJewelleryTypeApi}?PartnerSrNo=$jewellerId";
    log('Get Jewellery Type Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getJewelleryTypeFunction response : ${response.body}');

      JewelleryTypeModel jewelleryTypeModel =
          JewelleryTypeModel.fromJson(json.decode(response.body));
      isSuccessStatus = jewelleryTypeModel.success.obs;

      if (isSuccessStatus.value) {
        menTypeList.clear();
        if (jewelleryTypeModel.productTypeMen.isNotEmpty) {
          menTypeList.add(ProductTypeItem(name: '', image: ''));
          menTypeList.addAll(jewelleryTypeModel.productTypeMen);
        }
        log('getJewelleryTypeFunction menTypeList : ${menTypeList.length}');
        womenTypeList.clear();
        if (jewelleryTypeModel.productTypeWomen.isNotEmpty) {
          womenTypeList.add(ProductTypeItem(name: '', image: ''));
          womenTypeList.addAll(jewelleryTypeModel.productTypeWomen);
        }
        log('getJewelleryTypeFunction womenTypeList : ${womenTypeList.length}');
        kidsTypeList.clear();
        if (jewelleryTypeModel.productTypeKids.isNotEmpty) {
          kidsTypeList.add(ProductTypeItem(name: '', image: ''));
          kidsTypeList.addAll(jewelleryTypeModel.productTypeKids);
        }
      } else {
        log('getJewelleryTypeFunction Else');
      }
    } catch (e) {
      log('getJewelleryTypeFunction Error :$e');
      rethrow;
    }

    await getBestSellerFunction();
    // isLoading(false);
  }

  Future<void> getBestSellerFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getBestSellerApi}?PartnerId=$jewellerId";
    log('getBestSellerFunction Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getBestSellerFunction response : ${response.body}');

      BestSellerModel bestSellerModel =
          BestSellerModel.fromJson(json.decode(response.body));
      isSuccessStatus = bestSellerModel.success.obs;

      if (isSuccessStatus.value) {
        bestSellerList.clear();
        bestSellerList.addAll(bestSellerModel.listOfProducts);
        log('bestSellerList : ${bestSellerList.length}');
      } else {
        log('getBestSellerFunction Else');
      }
    } catch (e) {
      log('getBestSellerFunction Error :$e');
      rethrow;
    }

    await getClientTestimonialsFunction();
    // isLoading(false);
  }

  Future<void> getClientTestimonialsFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getClientTestimonialsApi}?PartnerSrno=$jewellerId";
    log('getClientTestimonialsFunction Api Url :$url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getClientTestimonialsFunction response : ${response.body}');

      ClientTestimonialsModel clientTestimonialsModel =
          ClientTestimonialsModel.fromJson(json.decode(response.body));
      isSuccessStatus = clientTestimonialsModel.success.obs;

      if (isSuccessStatus.value) {
        clientTestimonialsList.clear();
        clientTestimonialsList.addAll(clientTestimonialsModel.testimonials);
        log('clientTestimonialsList : ${clientTestimonialsList.length}');
      } else {
        log('getClientTestimonialsFunction Else');
      }
    } catch (e) {
      log('getClientTestimonialsFunction Error : $e');
      rethrow;
    }

    await getGoldPriceFunction();
    // isLoading(false);
  }

  Future<void> getGoldPriceFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getGoldPriceApi}?PartnerId=$jewellerId";
    log('getGoldPriceFunction Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getGoldPriceFunction response : ${response.body}');

      GoldPriceModel goldPriceModel =
          GoldPriceModel.fromJson(json.decode(response.body));
      isSuccessStatus = goldPriceModel.success.obs;

      if (isSuccessStatus.value) {
        goldPriceList = goldPriceModel.ibjAratesList;

        if (goldPriceList.isNotEmpty) {
          for (int i = 0; i < goldPriceList.length; i++) {
            if (goldPriceList[i].purity == 999) {
              goldPrice1 = goldPriceList[i].pm.toString();
            } else if (goldPriceList[i].purity == 916) {
              goldPrice2 = goldPriceList[i].pm.toString();
            } else if (goldPriceList[i].purity == 750) {
              goldPrice3 = goldPriceList[i].pm.toString();
            }
          }
          log('goldPrice1 : $goldPrice1');
          log('goldPrice2 : $goldPrice2');
          log('goldPrice3 : $goldPrice3');
        }

      } else {
        log('getGoldPriceFunction Else');
      }
    } catch (e) {
      log('getGoldPriceFunction Error :$e');
      rethrow;
    }

    await getAboutYourSelfFunction();
    // isLoading(false);
  }

  Future<void> getAboutYourSelfFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getAboutYourSelfApi}?PartnerSrno=$jewellerId&CustomerId=${UserDetails.customerId}";
    log('getAboutYourSelfFunction Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getAboutYourSelfFunction response : ${response.body}');

      AboutYourSelfModel aboutYourSelfModel =
          AboutYourSelfModel.fromJson(json.decode(response.body));
      isSuccessStatus = aboutYourSelfModel.success.obs;

      if (isSuccessStatus.value) {
        isFeedbackValue = aboutYourSelfModel.ratingGivenByCustomer.obs;
        log('isFeedbackValue : $isFeedbackValue');
      } else {
        log('getAboutYourSelfFunction Else');
      }
    } catch (e) {
      log('getAboutYourSelfFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  @override
  void onInit() {
    initMethodFunction();
    // getBestSellerFunction();
    // getSpecialFeaturesFunction();
    // getAnnouncementOfferFunction();
    // getJewelleryPushToAppDataFunction();
    // getJewelleryTypeFunction();
    // getClientTestimonialsFunction();
    // getGoldPriceFunction();
    // getAboutYourSelfFunction();
    super.onInit();
  }

  initMethodFunction() async {
    await getSpecialFeaturesFunction();
  }

}
