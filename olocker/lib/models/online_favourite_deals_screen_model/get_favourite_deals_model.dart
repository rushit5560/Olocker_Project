import 'dart:convert';

FavouriteOnlineDealsModel favouriteOnlineDealsModelFromJson(String str) =>
    FavouriteOnlineDealsModel.fromJson(json.decode(str));

class FavouriteOnlineDealsModel {
  int statusCode;
  Data data;

  FavouriteOnlineDealsModel({
    required this.statusCode,
    required this.data,
  });

  factory FavouriteOnlineDealsModel.fromJson(Map<String, dynamic> json) =>
      FavouriteOnlineDealsModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<FavDealList> favDealList;
  bool success;
  ErrorInfo errorInfo;

  Data({
    required this.favDealList,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        favDealList: List<FavDealList>.from(
            (json["favDealList"] ?? []).map((x) => FavDealList.fromJson(x)) ??
                {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );
}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    required this.errorData,
  });

  int errorType;
  String extraInfo;
  String description;
  String errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorType: json["error_type"] ?? 0,
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        errorData: json["error_data"].toString(),
      );
}

class FavDealList {
  String category;
  String categoryImage;
  List<OnLineDealFav> onLineDeals;

  FavDealList({
    required this.category,
    required this.categoryImage,
    required this.onLineDeals,
  });

  factory FavDealList.fromJson(Map<String, dynamic> json) => FavDealList(
        category: json["category"] ?? "",
        categoryImage: json["categoryImage"] ?? "",
        onLineDeals: List<OnLineDealFav>.from(
            (json["onLineDeals"] ?? []).map((x) => OnLineDealFav.fromJson(x)) ??
                {}),
      );
}

class OnLineDealFav {
  OnLineDealFav({
    required this.srNo,
    required this.validTillDate,
    required this.dealCode,
    required this.termsAndCondition,
    required this.pushDealToEndUser,
    required this.pushDealToRetailer,
    required this.pushDealToSupplier,
    required this.isActive,
    required this.startDate,
    required this.discountPercentage,
    required this.discountRs,
    required this.isCreatedByVendor,
    required this.rejecrReason,
    required this.dealType,
    required this.vendorName,
    required this.dealLocation,
    required this.vendorImageUrl,
    required this.isThirdPartyVendor,
    required this.thirdPartyVendorName,
    required this.couponHeading,
    required this.isFavoriteDeal,
    required this.isExpired,
    required this.isThirdPartyDeal,
    // required this.imagelist,
  });

  int srNo;
  String validTillDate;
  String dealCode;
  String termsAndCondition;
  String pushDealToEndUser;
  String pushDealToRetailer;
  String pushDealToSupplier;
  bool isActive;
  String startDate;
  String discountPercentage;
  String discountRs;
  bool isCreatedByVendor;
  String rejecrReason;
  String dealType;
  String vendorName;
  String dealLocation;
  String vendorImageUrl;
  bool isThirdPartyVendor;
  String thirdPartyVendorName;
  String couponHeading;
  bool isFavoriteDeal;
  bool isExpired;
  bool isThirdPartyDeal;

  // List<Imagelist> imagelist;

  factory OnLineDealFav.fromJson(Map<String, dynamic> json) => OnLineDealFav(
        srNo: json["srNo"] ?? 0,
        validTillDate: json["validTillDate"].toString(),
        dealCode: json["dealCode"] ?? "",
        termsAndCondition: json["termsAndCondition"] ?? "",
        pushDealToEndUser: json["pushDealToEndUser"] ?? "",
        pushDealToRetailer: json["pushDealToRetailer"] ?? "",
        pushDealToSupplier: json["pushDealToSupplier"] ?? "",
        isActive: json["isActive"] ?? false,
        startDate: json["startDate"].toString(),
        discountPercentage: json["discountPercentage"].toString(),
        discountRs: json["discountRs"].toString(),
        isCreatedByVendor: json["isCreatedByVendor"] ?? false,
        rejecrReason: json["rejecrReason"] ?? "",
        dealType: json["dealType"] ?? "",
        vendorName: json["vendorName"] ?? "",
        dealLocation: json["dealLocation"] ?? "",
        vendorImageUrl: json["vendorImageUrl"] ?? "",
        isThirdPartyVendor: json["isThirdPartyVendor"] ?? false,
        thirdPartyVendorName: json["thirdPartyVendorName"].toString(),
        couponHeading: json["couponHeading"] ?? "",
        isFavoriteDeal: json["isFavoriteDeal"] ?? false,
        isExpired: json["is_Expired"] ?? false,
        isThirdPartyDeal: json["isThirdPartyDeal"] ?? false,
        // imagelist: List<Imagelist>.from(json["Imagelist"].map((x) => Imagelist.fromJson(x))),
      );
}

class Imagelist {
  Imagelist({
    required this.imageType,
    required this.imageUrl,
  });

  String imageType;
  String imageUrl;

  factory Imagelist.fromJson(Map<String, dynamic> json) => Imagelist(
        imageType: json["imageType"] ?? "",
        imageUrl: json["imageUrl"] ?? "",
      );
}
