// To parse this JSON data, do
//
//     final favouritesModel = favouritesModelFromJson(jsonString);

import 'dart:convert';

FavouritesModel favouritesModelFromJson(String str) =>
    FavouritesModel.fromJson(json.decode(str));

String favouritesModelToJson(FavouritesModel data) =>
    json.encode(data.toJson());

class FavouritesModel {
  FavouritesModel({
    required this.favProduct,
    required this.success,
    required this.errorInfo,
  });

  final List<FavProduct> favProduct;
  final bool success;
  final ErrorInfo errorInfo;

  factory FavouritesModel.fromJson(Map<String, dynamic> json) =>
      FavouritesModel(
        favProduct: List<FavProduct>.from(
            (json["FavProduct"] ?? []).map((x) => FavProduct.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "FavProduct": List<dynamic>.from(favProduct.map((x) => x.toJson())),
        "success": success,
        "error_info": errorInfo.toJson(),
      };
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

class FavProduct {
  FavProduct({
    required this.id,
    required this.product,
    required this.isSupplierProduct,
    this.partnerName,
    required this.partnerSrNo,
    required this.customerId,
    required this.dateAdded,
    required this.productDetails,
  });

  final int id;
  final int product;
  final bool isSupplierProduct;
  final dynamic partnerName;
  final int partnerSrNo;
  final int customerId;
  final String dateAdded;
  final ProductDetails productDetails;

  factory FavProduct.fromJson(Map<String, dynamic> json) => FavProduct(
        id: json["Id"] ?? 0,
        product: json["Product"] ?? 0,
        isSupplierProduct: json["IsSupplierProduct"] ?? false,
        partnerName: json["PartnerName"] ?? "",
        partnerSrNo: json["PartnerSrNo"] ?? 0,
        customerId: json["CustomerId"] ?? 0,
        dateAdded: json["DateAdded"] ?? "",
        productDetails: ProductDetails.fromJson(json["ProductDetails"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Product": product,
        "IsSupplierProduct": isSupplierProduct,
        "PartnerName": partnerName,
        "PartnerSrNo": partnerSrNo,
        "CustomerId": customerId,
        "DateAdded": dateAdded,
        "ProductDetails": productDetails.toJson(),
      };
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
  final List<dynamic> diamonddetails;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        srNo: json["SrNo"] ?? 0,
        productSku: json["ProductSku"] ?? "",
        itemType: json["ItemType"] ?? "",
        itemTypeName: json["ItemTypeName"] ?? "",
        productTypeName: json["ProductTypeName"] ?? "",
        partnerName: json["PartnerName"] ?? "",
        description: json["Description"] ?? "",
        weight: json["Weight"] ?? "",
        width: json["Width"] ?? "",
        height: json["Height"] ?? "",
        length: json["Length"] ?? "",
        breadth: json["Breadth"] ?? "",
        size: json["Size"] ?? "",
        unitWidth: json["UnitWidth"] ?? "",
        unitHeight: json["UnitHeight"] ?? "",
        unitLength: json["UnitLength"] ?? "",
        unitBreadth: json["UnitBreadth"] ?? "",
        unitSize: json["UnitSize"] ?? "",
        tryBeforeBuy: json["TryBeforeBuy"] ?? false,
        price: json["Price"] ?? "",
        gst: json["GST"] ?? "",
        fullPayment: json["FullPayment"] ?? "",
        advancePayment: json["AdvancePayment"] ?? "",
        productStatus: json["ProductStatus"] ?? "",
        estimateDeliveryDays: json["EstimateDeliveryDays"] ?? "",
        productImageList: List<ProductImageList>.from(
            (json["ProductImageList"] ?? [])
                .map((x) => ProductImageList.fromJson(x))),
        similarProductList: List<SimilarProductList>.from(
            (json["SimilarProductList"] ?? [])
                .map((x) => SimilarProductList.fromJson(x))),
        metaldetails: List<Metaldetail>.from(
            (json["metaldetails"] ?? []).map((x) => Metaldetail.fromJson(x))),
        decorativedetails:
            List<dynamic>.from((json["decorativedetails"] ?? []).map((x) => x)),
        stonedetails: List<Stonedetail>.from(
            (json["stonedetails"] ?? []).map((x) => Stonedetail.fromJson(x))),
        diamonddetails:
            List<dynamic>.from((json["diamonddetails"] ?? []).map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "ProductSku": productSku,
        "ItemType": itemType,
        "ItemTypeName": itemTypeName,
        "ProductTypeName": productTypeName,
        "PartnerName": partnerName,
        "Description": description,
        "Weight": weight,
        "Width": width,
        "Height": height,
        "Length": length,
        "Breadth": breadth,
        "Size": size,
        "UnitWidth": unitWidth,
        "UnitHeight": unitHeight,
        "UnitLength": unitLength,
        "UnitBreadth": unitBreadth,
        "UnitSize": unitSize,
        "TryBeforeBuy": tryBeforeBuy,
        "Price": price,
        "GST": gst,
        "FullPayment": fullPayment,
        "AdvancePayment": advancePayment,
        "ProductStatus": productStatus,
        "EstimateDeliveryDays": estimateDeliveryDays,
        "ProductImageList":
            List<dynamic>.from(productImageList.map((x) => x.toJson())),
        "SimilarProductList":
            List<dynamic>.from(similarProductList.map((x) => x.toJson())),
        "metaldetails": List<dynamic>.from(metaldetails.map((x) => x.toJson())),
        "decorativedetails":
            List<dynamic>.from(decorativedetails.map((x) => x)),
        "stonedetails": List<dynamic>.from(stonedetails.map((x) => x.toJson())),
        "diamonddetails": List<dynamic>.from(diamonddetails.map((x) => x)),
      };
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
        metalWt: json["MetalWt"] ?? "",
        unitMetalWt: json["UnitMetalWt"] ?? "",
        metalType: json["MetalType"] ?? "",
        metalPurity: json["MetalPurity"] ?? "",
        isHallmarked: json["isHallmarked"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "MetalWt": metalWt,
        "UnitMetalWt": unitMetalWt,
        "MetalType": metalType,
        "MetalPurity": metalPurity,
        "isHallmarked": isHallmarked,
      };
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
        srNo: json["SrNo"] ?? 0,
        imageName: json["ImageName"] ?? "",
        imageLocation: json["ImageLocation"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "ImageName": imageName,
        "ImageLocation": imageLocation,
      };
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
        srNo: json["SrNo"] ?? 0,
        name: json["Name"] ?? "",
        price: json["Price"] ?? "",
        productImage: json["ProductImage"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "Name": name,
        "Price": price,
        "ProductImage": productImage,
      };
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
        stoneName: json["StoneName"] ?? "",
        stoneWt: json["StoneWt"] ?? "",
        unitStoneWt: json["UnitStoneWt"] ?? "",
        stoneChargeableAmount: json["StoneChargeableAmount"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "StoneName": stoneName,
        "StoneWt": stoneWt,
        "UnitStoneWt": unitStoneWt,
        "StoneChargeableAmount": stoneChargeableAmount,
      };
}
