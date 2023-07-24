// To parse this JSON data, do
//
//     final favouritesModel = favouritesModelFromJson(jsonString);
// import 'dart:convert';
//
// FavouritesModel favouritesModelFromJson(String str) =>
//     FavouritesModel.fromJson(json.decode(str));
//
// class FavouritesModel {
//   FavouritesModel({
//     required this.favProduct,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   final List<FavProduct> favProduct;
//   final bool success;
//   final ErrorInfo errorInfo;
//
//   factory FavouritesModel.fromJson(Map<String, dynamic> json) =>
//       FavouritesModel(
//         favProduct: List<FavProduct>.from(
//             (json["FavProduct"] ?? []).map((x) => FavProduct.fromJson(x))),
//         success: json["success"] ?? false,
//         errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
//       );
// }
//
// class ErrorInfo {
//   ErrorInfo({
//     required this.errorType,
//     required this.extraInfo,
//     required this.description,
//     this.errorData,
//   });
//
//   final int errorType;
//   final String extraInfo;
//   final String description;
//   final dynamic errorData;
//
//   factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
//         errorType: json["error_type"] ?? 0,
//         extraInfo: json["extra_info"] ?? "",
//         description: json["description"] ?? "",
//         errorData: json["error_data"] ?? "",
//       );
// }
//

import 'dart:convert';

import '../error_info_model/error_info_model.dart';

FavouritesModel favouritesModelFromJson(String str) =>
    FavouritesModel.fromJson(json.decode(str));

class FavouritesModel {
  int statusCode;
  Data data;

  FavouritesModel({
    required this.statusCode,
    required this.data,
  });

  factory FavouritesModel.fromJson(Map<String, dynamic> json) =>
      FavouritesModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<FavProduct> favProduct;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.favProduct,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        favProduct: List<FavProduct>.from(
            json["favProduct"].map((x) => FavProduct.fromJson(x))),
        success: json["success"],
        errorInfo: ErrorInfoModel.fromJson(json["error_info"]),
      );
}

class FavProduct {
  FavProduct({
    required this.id,
    required this.product,
    required this.isSupplierProduct,
    required this.partnerName,
    required this.partnerSrNo,
    required this.customerId,
    required this.dateAdded,
    required this.productDetails,
  });

  final int id;
  final int product;
  final bool isSupplierProduct;
  final String partnerName;
  final int partnerSrNo;
  final int customerId;
  final String dateAdded;
  final ProductDetails productDetails;

  factory FavProduct.fromJson(Map<String, dynamic> json) => FavProduct(
        id: json["id"] ?? 0,
        product: json["product"] ?? 0,
        isSupplierProduct: json["isSupplierProduct"] ?? false,
        partnerName: json["partnerName"] ?? "",
        partnerSrNo: json["partnerSrNo"] ?? 0,
        customerId: json["customerId"] ?? 0,
        dateAdded: json["dateAdded"] ?? "",
        productDetails: ProductDetails.fromJson(json["productDetails"] ?? {}),
      );
}

class ProductDetails {
  ProductDetails({
    required this.srNo,
    required this.productSku,
    required this.itemType,
    required this.itemTypeName,
    required this.productTypeName,
    required this.partnerName,
    required this.description,
    required this.weight,
    this.width,
    this.height,
    this.length,
    this.breadth,
    this.size,
    this.unitWidth,
    this.unitHeight,
    this.unitLength,
    this.unitBreadth,
    this.unitSize,
    required this.tryBeforeBuy,
    required this.price,
    required this.gst,
    required this.fullPayment,
    required this.advancePayment,
    required this.productStatus,
    this.estimateDeliveryDays,
    required this.productImageList,
    required this.similarProductList,
    required this.metaldetails,
    required this.decorativedetails,
    required this.stonedetails,
    required this.diamonddetails,
  });

  final int srNo;
  final String productSku;
  final String itemType;
  final String itemTypeName;
  final String productTypeName;
  final String partnerName;
  final String description;
  final String weight;
  final dynamic width;
  final dynamic height;
  final dynamic length;
  final dynamic breadth;
  final dynamic size;
  final dynamic unitWidth;
  final dynamic unitHeight;
  final dynamic unitLength;
  final dynamic unitBreadth;
  final dynamic unitSize;
  final bool tryBeforeBuy;
  final String price;
  final String gst;
  final String fullPayment;
  final String advancePayment;
  final String productStatus;
  final dynamic estimateDeliveryDays;
  final List<ProductImageList> productImageList;
  final List<SimilarProductList> similarProductList;
  final List<Metaldetail> metaldetails;
  final List<dynamic> decorativedetails;
  final List<Stonedetail> stonedetails;
  final List<Diamonddetail> diamonddetails;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        srNo: json["srNo"] ?? 0,
        productSku: json["productSku"] ?? "",
        itemType: json["itemType"] ?? "",
        itemTypeName: json["itemTypeName"] ?? "",
        productTypeName: json["productTypeName"] ?? "",
        partnerName: json["partnerName"] ?? "",
        description: json["description"] ?? "",
        weight: json["weight"] ?? "",
        width: json["width"] ?? "",
        height: json["height"] ?? "",
        length: json["length"] ?? "",
        breadth: json["breadth"] ?? "",
        size: json["size"] ?? "",
        unitWidth: json["unitWidth"] ?? "",
        unitHeight: json["unitHeight"] ?? "",
        unitLength: json["unitLength"] ?? "",
        unitBreadth: json["unitBreadth"] ?? "",
        unitSize: json["unitSize"] ?? "",
        tryBeforeBuy: json["tryBeforeBuy"] ?? false,
        price: json["price"] ?? "0.0",
        gst: json["gST"] ?? "",
        fullPayment: json["fullPayment"] ?? "",
        advancePayment: json["advancePayment"] ?? "",
        productStatus: json["productStatus"] ?? "",
        estimateDeliveryDays: json["estimateDeliveryDays"] ?? "",
        productImageList: List<ProductImageList>.from(
            (json["productImageList"] ?? [])
                .map((x) => ProductImageList.fromJson(x))),
        similarProductList: List<SimilarProductList>.from(
            (json["similarProductList"] ?? [])
                .map((x) => SimilarProductList.fromJson(x))),
        metaldetails: List<Metaldetail>.from(
            (json["metaldetails"] ?? []).map((x) => Metaldetail.fromJson(x))),
        decorativedetails:
            List<dynamic>.from((json["decorativedetails"] ?? []).map((x) => x)),
        stonedetails: List<Stonedetail>.from(
            (json["stonedetails"] ?? []).map((x) => Stonedetail.fromJson(x))),
        diamonddetails: List<Diamonddetail>.from((json["diamonddetails"] ?? [])
            .map((x) => Diamonddetail.fromJson(x))),
      );
}

class Diamonddetail {
  String stoneName;
  String stoneWt;
  String unitStoneWt;
  dynamic stoneShape;
  dynamic stoneQuality;
  String stoneChargeableAmount;

  Diamonddetail({
    required this.stoneName,
    required this.stoneWt,
    required this.unitStoneWt,
    this.stoneShape,
    this.stoneQuality,
    required this.stoneChargeableAmount,
  });

  factory Diamonddetail.fromJson(Map<String, dynamic> json) => Diamonddetail(
        stoneName: json["stoneName"] ?? "",
        stoneWt: json["stoneWt"] ?? "",
        unitStoneWt: json["unitStoneWt"] ?? "",
        stoneShape: json["stoneShape"] ?? "",
        stoneQuality: json["stoneQuality"] ?? "",
        stoneChargeableAmount: json["stoneChargeableAmount"] ?? "",
      );
}

class Metaldetail {
  Metaldetail({
    required this.metalWt,
    required this.unitMetalWt,
    required this.metalType,
    required this.metalPurity,
    required this.isHallmarked,
  });

  final String metalWt;
  final String unitMetalWt;
  final String metalType;
  final String metalPurity;
  final bool isHallmarked;

  factory Metaldetail.fromJson(Map<String, dynamic> json) => Metaldetail(
        metalWt: json["metalWt"] ?? "",
        unitMetalWt: json["unitMetalWt"] ?? "",
        metalType: json["metalType"] ?? "",
        metalPurity: json["metalPurity"] ?? "",
        isHallmarked: json["isHallmarked"] ?? false,
      );
}

class ProductImageList {
  ProductImageList({
    required this.srNo,
    required this.imageName,
    required this.imageLocation,
  });

  final int srNo;
  final String imageName;
  final String imageLocation;

  factory ProductImageList.fromJson(Map<String, dynamic> json) =>
      ProductImageList(
        srNo: json["srNo"] ?? 0,
        imageName: json["imageName"] ?? "",
        imageLocation: json["imageLocation"] ?? "",
      );
}

class SimilarProductList {
  SimilarProductList({
    required this.srNo,
    required this.name,
    required this.price,
    required this.productImage,
  });

  final int srNo;
  final String name;
  final String price;
  final String productImage;

  factory SimilarProductList.fromJson(Map<String, dynamic> json) =>
      SimilarProductList(
        srNo: json["srNo"] ?? 0,
        name: json["name"] ?? "",
        price: json["price"] ?? "",
        productImage: json["productImage"] ?? "",
      );
}

class Stonedetail {
  Stonedetail({
    required this.stoneName,
    required this.stoneWt,
    required this.unitStoneWt,
    required this.stoneChargeableAmount,
  });

  final String stoneName;
  final String stoneWt;
  final String unitStoneWt;
  final String stoneChargeableAmount;

  factory Stonedetail.fromJson(Map<String, dynamic> json) => Stonedetail(
        stoneName: json["stoneName"] ?? "",
        stoneWt: json["stoneWt"] ?? "",
        unitStoneWt: json["unitStoneWt"] ?? "",
        stoneChargeableAmount: json["stoneChargeableAmount"] ?? "",
      );
}
