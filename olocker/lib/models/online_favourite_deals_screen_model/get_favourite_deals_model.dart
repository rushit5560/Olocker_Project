import 'dart:convert';

FavouriteOnlineDealsModel smartDealsOnlineModelFromJson(String str) => FavouriteOnlineDealsModel.fromJson(json.decode(str));

String smartDealsOnlineModelToJson(FavouriteOnlineDealsModel data) => json.encode(data.toJson());

class FavouriteOnlineDealsModel {
  FavouriteOnlineDealsModel({
    required this.vendorDealsList,
    required this.success,
    required this.errorInfo,
  });

  List<VendorDealsList1> vendorDealsList;
  bool success;
  ErrorInfo errorInfo;

  factory FavouriteOnlineDealsModel.fromJson(Map<String, dynamic> json) => FavouriteOnlineDealsModel(
    vendorDealsList: List<VendorDealsList1>.from((json["FavDealList"] ?? []).map((x) => VendorDealsList1.fromJson(x))),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "FavDealList": List<dynamic>.from(vendorDealsList.map((x) => x.toJson())),
    "success": success,
    "error_info": errorInfo.toJson(),
  };
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

  Map<String, dynamic> toJson() => {
    "error_type": errorType,
    "extra_info": extraInfo,
    "description": description,
    "error_data": errorData,
  };
}

class VendorDealsList1 {
  VendorDealsList1({
    required this.category,
    required this.categoryImage,
    required this.onLineDeals,
  });

  String category;
  String categoryImage;
  List<OnLineDealFav> onLineDeals;

  factory VendorDealsList1.fromJson(Map<String, dynamic> json) => VendorDealsList1(
    category: json["Category"] ?? "",
    categoryImage: json["CategoryImage"] ?? "",
    onLineDeals: List<OnLineDealFav>.from(json["OnLineDeals"].map((x) => OnLineDealFav.fromJson(x ?? {}))),
  );

  Map<String, dynamic> toJson() => {
    "Category": category,
    "CategoryImage": categoryImage,
    "OnLineDeals": List<dynamic>.from(onLineDeals.map((x) => x.toJson())),
  };
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
    srNo: json["SrNo"] ?? 0,
    validTillDate: json["ValidTillDate"].toString(),
    dealCode: json["DealCode"] ?? "",
    termsAndCondition: json["TermsAndCondition"] ?? "",
    pushDealToEndUser: json["PushDealToEndUser"] ?? "",
    pushDealToRetailer: json["PushDealToRetailer"] ?? "",
    pushDealToSupplier: json["PushDealToSupplier"] ?? "",
    isActive: json["IsActive"] ?? false,
    startDate: json["StartDate"].toString(),
    discountPercentage: json["DiscountPercentage"].toString(),
    discountRs: json["DiscountRs"].toString(),
    isCreatedByVendor: json["IsCreatedByVendor"] ?? false,
    rejecrReason: json["RejecrReason"] ?? "",
    dealType: json["DealType"] ?? "",
    vendorName: json["VendorName"] ?? "",
    dealLocation: json["DealLocation"] ?? "",
    vendorImageUrl: json["VendorImageUrl"] ?? "",
    isThirdPartyVendor: json["IsThirdPartyVendor"] ?? false,
    thirdPartyVendorName: json["ThirdPartyVendorName"].toString(),
    couponHeading: json["CouponHeading"] ?? "",
    isFavoriteDeal: json["IsFavoriteDeal"] ?? false,
    isExpired: json["Is_Expired"] ?? false,
    isThirdPartyDeal: json["IsThirdPartyDeal"] ?? false,
    // imagelist: List<Imagelist>.from(json["Imagelist"].map((x) => Imagelist.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "ValidTillDate": validTillDate,
    "DealCode": dealCode,
    "TermsAndCondition": termsAndCondition,
    "PushDealToEndUser": pushDealToEndUser,
    "PushDealToRetailer": pushDealToRetailer,
    "PushDealToSupplier": pushDealToSupplier,
    "IsActive": isActive,
    "StartDate": startDate,
    "DiscountPercentage": discountPercentage,
    "DiscountRs": discountRs,
    "IsCreatedByVendor": isCreatedByVendor,
    "RejecrReason": rejecrReason,
    "DealType": dealType,
    "VendorName": vendorName,
    "DealLocation": dealLocation,
    "VendorImageUrl": vendorImageUrl,
    "IsThirdPartyVendor": isThirdPartyVendor,
    "ThirdPartyVendorName": thirdPartyVendorName,
    "CouponHeading": couponHeading,
    "IsFavoriteDeal": isFavoriteDeal,
    "Is_Expired": isExpired,
    "IsThirdPartyDeal": isThirdPartyDeal,
    // "Imagelist": List<dynamic>.from(imagelist.map((x) => x.toJson())),
  };
}



class Imagelist {
  Imagelist({
    required this.imageType,
    required this.imageUrl,
  });

  String imageType;
  String imageUrl;

  factory Imagelist.fromJson(Map<String, dynamic> json) => Imagelist(
    imageType: json["ImageType"] ?? "",
    imageUrl: json["ImageUrl"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "ImageType": imageType,
    "ImageUrl": imageUrl,
  };
}










