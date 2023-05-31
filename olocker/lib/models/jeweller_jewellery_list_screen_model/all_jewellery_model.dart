import 'dart:convert';

AllJewelleryModel allJewelleryModelFromJson(String str) =>
    AllJewelleryModel.fromJson(json.decode(str));

String allJewelleryModelToJson(AllJewelleryModel data) =>
    json.encode(data.toJson());

class AllJewelleryModel {
  AllJewelleryModel({
    required this.searchProductListData,
    required this.success,
    required this.errorInfo,
  });

  List<SearchProductListDatum> searchProductListData;
  bool success;
  ErrorInfo errorInfo;

  factory AllJewelleryModel.fromJson(Map<String, dynamic> json) =>
      AllJewelleryModel(
        searchProductListData: List<SearchProductListDatum>.from(
            (json["SearchProductListData"] ?? [])
                .map((x) => SearchProductListDatum.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "SearchProductListData":
            List<dynamic>.from(searchProductListData.map((x) => x.toJson())),
        "success": success,
        "error_info": errorInfo.toJson(),
      };
}

class ErrorInfo {
  ErrorInfo({
    // this.errorType,
    // this.extraInfo,
    required this.description,
    // this.errorData,
  });

  // int errorType;
  // String extraInfo;
  String description;
  // dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        // errorType: json["error_type"],
        // extraInfo: json["extra_info"],
        description: json["description"] ?? "",
        // errorData: json["error_data"],
      );

  Map<String, dynamic> toJson() => {
        // "error_type": errorType,
        // "extra_info": extraInfo,
        "description": description,
        // "error_data": errorData,
      };
}

class SearchProductListDatum {
  SearchProductListDatum({
    required this.categoryName,
    required this.subCategoryName,
    required this.productSrNo,
    required this.itemDescription,
    required this.productsPrice,
    required this.stockNo,
    required this.productStatus,
    // required this.estimateDeliveryDays,
    required this.productName,
    required this.metalPurities,
    required this.productType,
    // required this.height,
    // required this.width,
    // required this.size,
    required this.brandCollection,
    required this.productImage,
    required this.tryBeforeBuy,
    required this.type,
    required this.isFav,
  });

  String categoryName;
  String subCategoryName;
  int productSrNo;
  String itemDescription;
  String productsPrice;
  String stockNo;
  String productStatus;
  // dynamic estimateDeliveryDays;
  String productName;
  List<MetalPurity> metalPurities;
  String productType;
  // dynamic height;
  // dynamic width;
  // dynamic size;
  String brandCollection;
  String productImage;
  bool tryBeforeBuy;
  String type;
  bool isFav;

  factory SearchProductListDatum.fromJson(Map<String, dynamic> json) =>
      SearchProductListDatum(
        categoryName: json["CategoryName"] ?? "",
        subCategoryName: json["SubCategoryName"] ?? "",
        productSrNo: json["ProductSrNo"] ?? 0,
        itemDescription: json["ItemDescription"] ?? "",
        productsPrice: json["ProductsPrice"] == "PRICE ON REQUEST"
            ? "PRICE ON REQUEST"
            : json["ProductsPrice"].toString(),
        stockNo: json["StockNo"] ?? "",
        productStatus: json["ProductStatus"] ?? "",
        // estimateDeliveryDays: json["EstimateDeliveryDays"],
        productName: json["ProductName"] ?? "",
        metalPurities: List<MetalPurity>.from(
            (json["MetalPurities"] ?? []).map((x) => MetalPurity.fromJson(x))),
        productType: json["ProductType"] ?? "",
        // height: json["Height"],
        // width: json["Width"],
        // size: json["Size"],
        brandCollection: json["BrandCollection"] ?? "",
        productImage: json["ProductImage"] ?? "",
        tryBeforeBuy: json["TryBeforeBuy"] ?? false,
        type: json["Type"] ?? "",
        isFav: json["IsFav"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "CategoryName": categoryName,
        "SubCategoryName": subCategoryName,
        "ProductSrNo": productSrNo,
        "ItemDescription": itemDescription,
        "ProductsPrice": productsPrice,
        "StockNo": stockNo,
        "ProductStatus": productStatus,
        // "EstimateDeliveryDays": estimateDeliveryDays,
        "ProductName": productName,
        "MetalPurities":
            List<dynamic>.from(metalPurities.map((x) => x.toJson())),
        "ProductType": productType,
        // "Height": height,
        // "Width": width,
        // "Size": size,
        "BrandCollection": brandCollection,
        "ProductImage": productImage,
        "TryBeforeBuy": tryBeforeBuy,
        "Type": type,
      };
}

class MetalPurity {
  MetalPurity({
    required this.metalPurity,
  });

  String metalPurity;

  factory MetalPurity.fromJson(Map<String, dynamic> json) => MetalPurity(
        metalPurity: json["MetalPurity"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "MetalPurity": metalPurity,
      };
}
