/*
// To parse this JSON data, do
//
//     final getOfferDetailResultModel = getOfferDetailResultModelFromJson(jsonString);

import 'dart:convert';

GetOfferDetailResultModel getOfferDetailResultModelFromJson(String str) =>
    GetOfferDetailResultModel.fromJson(json.decode(str));

// String getOfferDetailResultModelToJson(GetOfferDetailResultModel data) =>
//     json.encode(data.toJson());

class GetOfferDetailResultModel {
  GetOfferDetailResultModel({
    required this.offerId,
    required this.partnerSrNo,
    required this.offerType,
    required this.fromDate,
    required this.toDate,
    required this.dealType,
    required this.discountPer,
    required this.discountAmt,
    required this.discountQty,
    required this.dealDescription,
    required this.offerName,
    required this.creativeImage,
    required this.getProduct,
    required this.success,
    required this.errorInfo,
  });

  final int offerId;
  final int partnerSrNo;
  final String offerType;
  final String fromDate;
  final String toDate;
  final String dealType;
  final double discountPer;
  final double discountAmt;
  final int discountQty;
  final String dealDescription;
  final String offerName;
  final bool creativeImage;
  final List<GetProduct> getProduct;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetOfferDetailResultModel.fromJson(Map<String, dynamic> json) =>
      GetOfferDetailResultModel(
        offerId: json["offerId"] ?? 0,
        partnerSrNo: json["partnerSrNo"] ?? 0,
        offerType: json["offerType"] ?? "",
        fromDate: json["fromDate"] ?? "",
        toDate: json["toDate"] ?? "",
        dealType: json["dealType"] ?? "",
        discountPer: json["discountPer"] ?? 0.0,
        discountAmt: json["discountAmt"] ?? 0.0,
        discountQty: json["discountQty"] ?? 0,
        dealDescription: json["dealDescription"] ?? "",
        offerName: json["offerName"] ?? "",
        creativeImage: json["creativeImage"] ?? false,
        getProduct: List<GetProduct>.from(
            (json["getProduct"] ?? []).map((x) => GetProduct.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

 */
/* Map<String, dynamic> toJson() => {
        "OfferId": offerId,
        "PartnerSrNo": partnerSrNo,
        "OfferType": offerType,
        "FromDate": fromDate,
        "ToDate": toDate,
        "DealType": dealType,
        "DiscountPer": discountPer,
        "DiscountAmt": discountAmt,
        "DiscountQty": discountQty,
        "DealDescription": dealDescription,
        "offerName": offerName,
        "CreativeImage": creativeImage,
        "GetProduct": List<dynamic>.from(getProduct.map((x) => x.toJson())),
        "success": success,
        "error_info": errorInfo.toJson(),
      };*//*

}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    this.errorData,
  });

  final int errorType;
  final String extraInfo;
  final String description;
  final dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorType: json["error_type"] ?? 0,
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        errorData: json["error_data"] ?? "",
      );
*/
/*
  Map<String, dynamic> toJson() => {
        "error_type": errorType,
        "extra_info": extraInfo,
        "description": description,
        "error_data": errorData,
      };*//*

}

class GetProduct {
  GetProduct({
    required this.categoryName,
    required this.subCategoryName,
    required this.productSrNo,
    required this.itemDescription,
    required this.productsPrice,
    required this.stockNo,
    required this.productName,
    required this.metalPurities,
    required this.productType,
    // this.height,
    // this.width,
    // this.size,
    required this.brandCollection,
    required this.productImage,
    required this.tryBeforeBuy,
    required this.isFav,
    required this.favId,
  });

  final String categoryName;
  final String subCategoryName;
  final int productSrNo;
  final String itemDescription;
  final String productsPrice;
  final String stockNo;
  final String productName;
  final List<MetalPurity> metalPurities;
  final String productType;
  // final dynamic height;
  // final dynamic width;
  // final dynamic size;
  final String brandCollection;
  final String productImage;
  final bool tryBeforeBuy;
  bool isFav;
  int favId;

  factory GetProduct.fromJson(Map<String, dynamic> json) => GetProduct(
        categoryName: json["categoryName"] ?? "",
        subCategoryName: json["subCategoryName"] ?? "",
        productSrNo: json["productSrNo"] ?? 0,
        itemDescription: json["itemDescription"] ?? "",
        productsPrice: json["productsPrice"] ?? "",
        stockNo: json["stockNo"] ?? "",
        productName: json["productName"] ?? "",
        metalPurities: List<MetalPurity>.from(
            (json["metalPurities"] ?? []).map((x) => MetalPurity.fromJson(x))),
        productType: json["productType"] ?? "",
        // height: json["Height"],
        // width: json["Width"],
        // size: json["Size"],
        brandCollection: json["brandCollection"] ?? "",
        productImage: json["productImage"] ?? "",
        tryBeforeBuy: json["tryBeforeBuy"] ?? false,
        isFav: json["IsFav"] ?? false,
    favId: json["FavId"] ?? 0,
      );

 */
/* Map<String, dynamic> toJson() => {
        "CategoryName": categoryName,
        "SubCategoryName": subCategoryName,
        "ProductSrNo": productSrNo,
        "ItemDescription": itemDescription,
        "ProductsPrice": productsPrice,
        "StockNo": stockNo,
        "ProductName": productName,
        "MetalPurities":
            List<MetalPurity>.from(metalPurities.map((x) => x.toJson())),
        "ProductType": productType,
        // "Height": height,
        // "Width": width,
        // "Size": size,
        "BrandCollection": brandCollection,
        "ProductImage": productImage,
        "TryBeforeBuy": tryBeforeBuy,
        "IsFav": isFav,
      };*//*

}

class MetalPurity {
  MetalPurity({
    required this.metalPurity,
  });

  final String metalPurity;

  factory MetalPurity.fromJson(Map<String, dynamic> json) => MetalPurity(
        metalPurity: json["MetalPurity"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "MetalPurity": metalPurity,
      };
}
*/



import 'dart:convert';

GetOfferDetailResultModel getOfferDetailResultModelFromJson(String str) => GetOfferDetailResultModel.fromJson(json.decode(str));


class GetOfferDetailResultModel {
  int statusCode;
  GetOfferDetailResultData data;

  GetOfferDetailResultModel({
    required this.statusCode,
    required this.data,
  });

  factory GetOfferDetailResultModel.fromJson(Map<String, dynamic> json) => GetOfferDetailResultModel(
    statusCode: json["statusCode"],
    data: GetOfferDetailResultData.fromJson(json["data"]),
  );


}

class GetOfferDetailResultData {
  GetOfferDetailResultData({
    required this.offerId,
    required this.partnerSrNo,
    required this.offerType,
    required this.fromDate,
    required this.toDate,
    required this.dealType,
    required this.discountPer,
    required this.discountAmt,
    required this.discountQty,
    required this.dealDescription,
    required this.offerName,
    required this.creativeImage,
    required this.getProduct,
    required this.success,
    required this.errorInfo,
  });

  final int offerId;
  final int partnerSrNo;
  final String offerType;
  final String fromDate;
  final String toDate;
  final String dealType;
  final int discountPer;
  final int discountAmt;
  final int discountQty;
  final String dealDescription;
  final String offerName;
  final bool creativeImage;
  final List<GetProduct> getProduct;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetOfferDetailResultData.fromJson(Map<String, dynamic> json) =>
      GetOfferDetailResultData(
        offerId: json["offerId"] ?? 0,
        partnerSrNo: json["partnerSrNo"] ?? 0,
        offerType: json["offerType"] ?? "",
        fromDate: json["fromDate"] ?? "",
        toDate: json["toDate"] ?? "",
        dealType: json["dealType"] ?? "",
        discountPer: json["discountPer"] ?? 0,
        discountAmt: json["discountAmt"] ?? 0,
        discountQty: json["discountQty"] ?? 0,
        dealDescription: json["dealDescription"] ?? "",
        offerName: json["offerName"] ?? "",
        creativeImage: json["creativeImage"] ?? false,
        getProduct: List<GetProduct>.from(
            (json["getProduct"] ?? []).map((x) => GetProduct.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );




}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    this.errorData,
  });

  final int errorType;
  final String extraInfo;
  final String description;
  final dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
    errorType: json["error_type"] ?? 0,
    extraInfo: json["extra_info"] ?? "",
    description: json["description"] ?? "",
    errorData: json["error_data"] ?? "",
  );

  Map<String, dynamic> toJson() => {
        "error_type": errorType,
        "extra_info": extraInfo,
        "description": description,
        "error_data": errorData,
      };

}

class GetProduct {
  GetProduct({
    required this.categoryName,
    required this.subCategoryName,
    required this.productSrNo,
    required this.itemDescription,
    required this.productsPrice,
    required this.stockNo,
    required this.productName,
    required this.metalPurities,
    required this.productType,
    // this.height,
    // this.width,
    // this.size,
    required this.brandCollection,
    required this.productImage,
    required this.tryBeforeBuy,
    required this.isFav,
    required this.favId,
  });

  final String categoryName;
  final String subCategoryName;
  final int productSrNo;
  final String itemDescription;
  final String productsPrice;
  final String stockNo;
  final String productName;
  final List<MetalPurity> metalPurities;
  final String productType;
  // final dynamic height;
  // final dynamic width;
  // final dynamic size;
  final String brandCollection;
  final String productImage;
  final bool tryBeforeBuy;
  bool isFav;
  int favId;

  factory GetProduct.fromJson(Map<String, dynamic> json) => GetProduct(
        categoryName: json["categoryName"] ?? "",
        subCategoryName: json["subCategoryName"] ?? "",
        productSrNo: json["productSrNo"] ?? 0,
        itemDescription: json["itemDescription"] ?? "",
        productsPrice: json["productsPrice"] ?? "",
        stockNo: json["stockNo"] ?? "",
        productName: json["productName"] ?? "",
        metalPurities: List<MetalPurity>.from(
            (json["metalPurities"] ?? []).map((x) => MetalPurity.fromJson(x))),
        productType: json["productType"] ?? "",
        // height: json["Height"],
        // width: json["Width"],
        // size: json["Size"],
        brandCollection: json["brandCollection"] ?? "",
        productImage: json["productImage"] ?? "",
        tryBeforeBuy: json["tryBeforeBuy"] ?? false,
        isFav: json["IsFav"] ?? false,
        favId: json["FavId"] ?? 0,
      );


}
class MetalPurity {
  MetalPurity({
    required this.metalPurity,
  });

  final String metalPurity;

  factory MetalPurity.fromJson(Map<String, dynamic> json) => MetalPurity(
    metalPurity: json["MetalPurity"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "MetalPurity": metalPurity,
  };
}