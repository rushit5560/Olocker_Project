import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/constants/enum.dart';
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
  int isStatusCode = 0;
  Size size = Get.size;
  ApiHeader apiHeader = ApiHeader();

  final ScrollController scrollController = ScrollController();
  RxBool hasMore = true.obs;

  // RxBool hasMoreLoading = true.obs;

  // RxBool isSpecialFeaturesLoading = false.obs;
  // RxBool isAnnouncementOfferLoading = false.obs;
  // RxBool isJewelleryPushToAppDataLoading = false.obs;
  // RxBool isJewelleryTypeLoading = false.obs;
  // RxBool isBestSellerLoading = false.obs;
  // RxBool isTestimonialLoading = false.obs;
  // RxBool isGoldPriceLoading = false.obs;
  // RxBool isAboutYourSelfLoading = false.obs;

  List<String> collectionNameList = [];

  List<SpecialFeatureItem> specialFeaturesList = [];
  List<GetPushOfferItem> announcementOfferList = [];
  List<GetPushCollectionItem> jewelleryCategoryList = [];
  List<GetPushCollectionItem> jewellerysubCategoryList = []; //subCategoryList

  List<GetPushCollectionItem> newArrivalList = [];
  List<ProductTypeItem> menTypeList = [];
  List<ProductTypeItem> womenTypeList = [];
  List<ProductTypeItem> kidsTypeList = [];
  List<FavProductList> bestSellerList = [];
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

  // This 4 Function api calling in 1st Phase
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
      log('getSpecialFeaturesFunction Error :$e');
      rethrow;
    }

    /// await getAnnouncementOfferFunction();
    //  await getBestSellerFunction();
    await getClientTestimonialsFunction();

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

    /// await getJewelleryPushToAppDataFunction();
    isLoading(false);
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

        // jewelleryCategoryList.addAll(jewelleryCategoryModel.getPushCollection);
//
        for (var element in jewelleryCategoryModel.getPushCollection) {
          if (element.productCount != 0) {
            log("jewelleryCategoryList element.productCount ${element.productCount}");
            // jewelleryCategoryList.addAll(jewelleryCategoryModel.getPushCollection);
            jewelleryCategoryList.add(element);
          }
        }

        if (jewelleryCategoryList.length > 2) {
          for (int i = 2; i < jewelleryCategoryList.length; i++) {
            if (jewelleryCategoryList[i].productCount != 0) {
              log("jewellerysubCategoryList jewelleryCategoryList[i].productCount ${jewelleryCategoryList[i].productCount}");
              jewellerysubCategoryList.add(jewelleryCategoryList[i]);
            }
          }
        }
        log("jewellerysubCategoryList.length ${jewellerysubCategoryList.length}");

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

          // if (jewelleryCategoryList.length > 2) {
          //   for (int i = 2; i < jewelleryCategoryList.length; i++) {
          //     jewellerysubCategoryList.add(jewelleryCategoryList[i]);
          //   }
          // }
          // log("jewellerysubCategoryList.length ${jewellerysubCategoryList.length}");
        }
        log("jewelleryCategoryList.length ${jewelleryCategoryList.length}");
      } else {
        log('getJewelleryPushToAppDataFunction Else');
      }
    } catch (e) {
      log('getJewelleryPushToAppDataFunction Error :$e');
      rethrow;
    }

    ///  await getAboutYourSelfFunction();
    isLoading(false);
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

    if (announcementOfferList.isEmpty && jewelleryCategoryList.length < 2) {
      await getJewelleryTypeFunction(
          jewellerDetailsScroll: JewellerDetailsScroll.continueScroll);
    } else {
      isLoading(false);
    }
  }

  // This 5 Function api calling in 2nd Phase
  Future<void> getNewArrivalFunction() async {
    if (hasMore.value) {
      // isLoading(true);
      String url = "${ApiUrl.getNewArrivalApi}?PartnerSrNo=$jewellerId";
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

      ///  await getJewelleryTypeFunction();
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  Future<void> getJewelleryTypeFunction(
      {jewellerDetailsScroll = JewellerDetailsScroll.stopScroll}) async {
    // if (jewellerDetailsScroll == JewellerDetailsScroll.stopScroll) {
    if (hasMore.value) {
      // isLoading(true);
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
          collectionNameList.clear();

          ///  men type
          bool isMenAvailable = false;

          menTypeList.clear();

          if (jewelleryTypeModel.productTypeMen.isNotEmpty) {
            for (var element in jewelleryTypeModel.productTypeMen) {
              if (element.productCount != 0) {
                isMenAvailable = true;
              }
            }
            if (isMenAvailable == true) {
              menTypeList.add(ProductTypeItem(name: '', image: ''));
              for (var element in jewelleryTypeModel.productTypeMen) {
                if (element.productCount != 0) {
                  // menTypeList.addAll(jewelleryTypeModel.productTypeMen);
                  menTypeList.add(element);
                  for (var element in jewelleryTypeModel.productTypeMen) {
                    collectionNameList.add(element.name);
                  }
                }
              }
            }
            // menTypeList
            //     .add(ProductTypeItem(name: '', image: '', productCount: 0));
            // menTypeList.addAll(jewelleryTypeModel.productTypeMen);
            // for (var element in jewelleryTypeModel.productTypeMen) {
            //   collectionNameList.add(element.name);
            // }
          }
          log('getJewelleryTypeFunction menTypeList : ${menTypeList.length}');

          /// women type
          bool isWomenAvailable = false;
          womenTypeList.clear();
          if (jewelleryTypeModel.productTypeWomen.isNotEmpty) {
            for (var element in jewelleryTypeModel.productTypeWomen) {
              if (element.productCount != 0) {
                isWomenAvailable = true;
              }
            }

            if (isWomenAvailable == true) {
              womenTypeList.add(ProductTypeItem(name: '', image: ''));
              for (var element in jewelleryTypeModel.productTypeWomen) {
                if (element.productCount != 0) {
                  // womenTypeList.addAll(jewelleryTypeModel.productTypeWomen);
                  womenTypeList.add(element);
                  for (var element in jewelleryTypeModel.productTypeWomen) {
                    collectionNameList.add(element.name);
                  }
                }
              }
            }
            // womenTypeList
            //     .add(ProductTypeItem(name: '', image: '', productCount: 0));
            // womenTypeList.addAll(jewelleryTypeModel.productTypeWomen);
            // for (var element in jewelleryTypeModel.productTypeWomen) {
            //   collectionNameList.add(element.name);
            // }
          }
          log('getJewelleryTypeFunction womenTypeList : ${womenTypeList.length}');

          /// Kids type
          bool isKidsAvailable = false;
          kidsTypeList.clear();
          if (jewelleryTypeModel.productTypeKids.isNotEmpty) {
            for (var element in jewelleryTypeModel.productTypeKids) {
              if (element.productCount != 0) {
                isKidsAvailable = true;
              }
            }

            if (isKidsAvailable == true) {
              kidsTypeList.add(ProductTypeItem(name: '', image: ''));
              log("kidsTypeList.length ${kidsTypeList.length}");
              for (var element in jewelleryTypeModel.productTypeKids) {
                if (element.productCount != 0) {
                  // kidsTypeList.addAll(jewelleryTypeModel.productTypeKids);
                  kidsTypeList.add(element);
                  for (var element in jewelleryTypeModel.productTypeKids) {
                    collectionNameList.add(element.name);
                  }
                }
              }
            } else {
              log('Nothing');
            }

            // kidsTypeList
            //     .add(ProductTypeItem(name: '', image: '', productCount: 0));
            // kidsTypeList.addAll(jewelleryTypeModel.productTypeKids);
            // for (var element in jewelleryTypeModel.productTypeKids) {
            //   collectionNameList.add(element.name);
            // }
          }

          log("collectionNameList Length :${collectionNameList.length}");
          for (var element in collectionNameList) {
            log('collectionNameList : $element');
          }
        } else {
          log('getJewelleryTypeFunction Else');
        }
      } catch (e) {
        log('getJewelleryTypeFunction Error :$e');
        rethrow;
      }

      ///  await getBestSellerFunction();
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  Future<void> getBestSellerFunction() async {
    if (hasMore.value) {
      // isLoading(true);
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
          bestSellerList.addAll(bestSellerModel.favProductList);
          log('bestSellerList : ${bestSellerList.length}');
        } else {
          log('getBestSellerFunction Else');
        }
      } catch (e) {
        log('getBestSellerFunction Error :$e');
        rethrow;
      }

      /// await getClientTestimonialsFunction();
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  Future<void> getClientTestimonialsFunction() async {
    if (hasMore.value) {
      // isLoading(true);
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
        // isSuccessStatus = clientTestimonialsModel.success.obs;
        isStatusCode = clientTestimonialsModel.statusCode;

        if (isStatusCode == 200) {
          clientTestimonialsList.clear();
          clientTestimonialsList
              .addAll(clientTestimonialsModel.data.testimonials);
          log('getClientTestimonialsFunction clientTestimonialsList : ${clientTestimonialsList.length}');
        } else {
          log('getClientTestimonialsFunction Else');
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
        log('getClientTestimonialsFunction Error : $e');
        rethrow;
      }

      await getGoldPriceFunction();
      isLoading(false);
    } else {
      isLoading(false);
    }
  }

  Future<void> getGoldPriceFunction() async {
    if (hasMore.value) {
      // isLoading(true);
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
        // isSuccessStatus = goldPriceModel.success.obs;
        isStatusCode = goldPriceModel.statusCode;
        if (isStatusCode == 200) {
          goldPriceList = goldPriceModel.data.ibjAratesList;

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
        log('getGoldPriceFunction Error :$e');
        rethrow;
      }

      // await getAboutYourSelfFunction();
      isLoading(false);
      hasMore(false);
    } else {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    log("jewellerId :$jewellerId");
    initMethodFunction();

    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (hasMore.value) {
          await getJewelleryTypeFunction();
        }
        // hasMore = false;
      }
    });

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
