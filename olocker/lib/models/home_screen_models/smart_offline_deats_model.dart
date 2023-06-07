// To parse this JSON data, do
//
//     final getOfflineDealsModel = getOfflineDealsModelFromJson(jsonString);

import 'dart:convert';

GetOfflineDealsModel getOfflineDealsModelFromJson(String str) =>
    GetOfflineDealsModel.fromJson(json.decode(str));

class GetOfflineDealsModel {
  List<VendorOfflineDealsList> vendorDealsList;
  bool success;
  ErrorInfo errorInfo;

  GetOfflineDealsModel({
    required this.vendorDealsList,
    required this.success,
    required this.errorInfo,
  });

  factory GetOfflineDealsModel.fromJson(Map<String, dynamic> json) =>
      GetOfflineDealsModel(
        vendorDealsList: List<VendorOfflineDealsList>.from(
            (json["VendorDealsList"] ?? [])
                .map((x) => VendorOfflineDealsList.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );
}

class ErrorInfo {
  int errorType;
  String extraInfo;
  String description;
  String errorData;

  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    required this.errorData,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorType: json["error_type"] ?? 0,
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        errorData: json["error_data"] ?? "",
      );
}

class VendorOfflineDealsList {
  String category;
  String categoryImage;
  List<OffLineDeal> offLineDeals;

  VendorOfflineDealsList({
    required this.category,
    required this.categoryImage,
    required this.offLineDeals,
  });

  factory VendorOfflineDealsList.fromJson(Map<String, dynamic> json) =>
      VendorOfflineDealsList(
        category: json["Category"] ?? "",
        categoryImage: json["CategoryImage"] ?? "",
        offLineDeals: List<OffLineDeal>.from(
            (json["OffLineDeals"] ?? []).map((x) => OffLineDeal.fromJson(x))),
      );
}

class OffLineDeal {
  int srNo;
  String validTillDate;
  String dealCode;
  String termsAndCondition;
  String pushDealToEndUser;
  String pushDealToRetailer;
  String pushDealToSupplier;
  bool isActive;
  String startDate;
  double discountPercentage;
  double discountRs;
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
  List<Imagelist> imagelist;

  OffLineDeal({
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
    required this.imagelist,
  });

  factory OffLineDeal.fromJson(Map<String, dynamic> json) => OffLineDeal(
        srNo: json["SrNo"] ?? 0,
        validTillDate: json["ValidTillDate"] ?? "",
        dealCode: json["DealCode"] ?? "",
        termsAndCondition: json["TermsAndCondition"] ?? "",
        pushDealToEndUser: json["PushDealToEndUser"] ?? "",
        pushDealToRetailer: json["PushDealToRetailer"] ?? "",
        pushDealToSupplier: json["PushDealToSupplier"] ?? "",
        isActive: json["IsActive"] ?? false,
        startDate: json["StartDate"].toString(),
        discountPercentage: json["DiscountPercentage"] ?? 0.0,
        discountRs: json["DiscountRs"] ?? 0.0,
        isCreatedByVendor: json["IsCreatedByVendor"] ?? false,
        rejecrReason: json["RejecrReason"] ?? "",
        dealType: json["DealType"] ?? "",
        vendorName: json["VendorName"] ?? "",
        dealLocation: json["DealLocation"] ?? "",
        vendorImageUrl: json["VendorImageUrl"] ?? "",
        isThirdPartyVendor: json["IsThirdPartyVendor"] ?? false,
        thirdPartyVendorName: json["ThirdPartyVendorName"] ?? "",
        couponHeading: json["CouponHeading"] ?? "",
        isFavoriteDeal: json["IsFavoriteDeal"] ?? false,
        isExpired: json["Is_Expired"] ?? false,
        isThirdPartyDeal: json["IsThirdPartyDeal"] ?? false,
        imagelist: List<Imagelist>.from(
            (json["Imagelist"] ?? []).map((x) => Imagelist.fromJson(x))),
      );
}

class Imagelist {
  String imageType;
  String imageUrl;

  Imagelist({
    required this.imageType,
    required this.imageUrl,
  });

  factory Imagelist.fromJson(Map<String, dynamic> json) => Imagelist(
        imageType: json["ImageType"] ?? "",
        imageUrl: json["ImageUrl"] ?? "",
      );
}
