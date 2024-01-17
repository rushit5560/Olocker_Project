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
    favProduct: List<FavProduct>.from((json["favProduct"]??[]).map((x) => FavProduct.fromJson(x))),
    success: json["success"]??false,
    errorInfo: ErrorInfoModel.fromJson(json["error_info"]??{}),
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
        id: json["Id"] ?? 0,
        product: json["Product"] ?? 0,
        isSupplierProduct: json["IsSupplierProduct"] ?? false,
        partnerName: json["PartnerName"] ?? "",
        partnerSrNo: json["PartnerSrNo"] ?? 0,
        customerId: json["CustomerId"] ?? 0,
        dateAdded: json["DateAdded"] ?? "",
        productDetails: ProductDetails.fromJson(json["ProductDetails"] ?? {}),
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
        price: json["Price"] ?? "0.0",
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
        stoneName: json["StoneName"] ?? "",
        stoneWt: json["StoneWt"] ?? "",
        unitStoneWt: json["UnitStoneWt"] ?? "",
        stoneShape: json["StoneShape"] ?? "",
        stoneQuality: json["StoneQuality"] ?? "",
        stoneChargeableAmount: json["StoneChargeableAmount"] ?? "",
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
        metalWt: json["MetalWt"] ?? "",
        unitMetalWt: json["UnitMetalWt"] ?? "",
        metalType: json["MetalType"] ?? "",
        metalPurity: json["MetalPurity"] ?? "",
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
        srNo: json["SrNo"] ?? 0,
        imageName: json["ImageName"] ?? "",
        imageLocation: json["ImageLocation"] ?? "",
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
        srNo: json["SrNo"] ?? 0,
        name: json["Name"] ?? "",
        price: json["Price"] ?? "",
        productImage: json["ProductImage"] ?? "",
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
        stoneName: json["StoneName"] ?? "",
        stoneWt: json["StoneWt"] ?? "",
        unitStoneWt: json["UnitStoneWt"] ?? "",
        stoneChargeableAmount: json["StoneChargeableAmount"] ?? "",
      );
}
