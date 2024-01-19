import 'dart:convert';

import '../error_info_model/error_info_model.dart';

GetOfferFavouriteVendorModel getOfferFavouriteVendorModelFromJson(String str) =>
    GetOfferFavouriteVendorModel.fromJson(json.decode(str));

class GetOfferFavouriteVendorModel {
  int statusCode;
  Data data;

  GetOfferFavouriteVendorModel({
    required this.statusCode,
    required this.data,
  });

  factory GetOfferFavouriteVendorModel.fromJson(Map<String, dynamic> json) =>
      GetOfferFavouriteVendorModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  GetProductModel productDetailsData;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.productDetailsData,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        productDetailsData:
            GetProductModel.fromJson(json["ProductDetailsData"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class GetProductModel {
  int? srNo;
  String? productSku;
  String? itemType;
  String? itemTypeName;
  String? productTypeName;
  String? partnerName;
  String? description;
  String? weight;
  dynamic width;
  dynamic height;
  dynamic length;
  dynamic breadth;
  dynamic size;
  dynamic unitWidth;
  dynamic unitHeight;
  dynamic unitLength;
  dynamic unitBreadth;
  dynamic unitSize;
  bool? tryBeforeBuy;
  String? price;
  String? gst;
  String? fullPayment;
  String? advancePayment;
  String? productStatus;
  dynamic estimateDeliveryDays;
  List<Metaldetail>? metaldetails;
  List<Diamonddetail>? diamonddetails;
  List<Stonedetail>? stonedetails;
  List<SubcategoryId>? subcategoryId;

  List<Decorativedetail>?decorativedetails ;
  List<ProductImageList>?productImageList ;
  List<CollectionId>? collectionIdList;
  bool? isFav;
  int? favId;

  GetProductModel({
    this.srNo,
    this.productSku,
    this.itemType,
    this.itemTypeName,
    this.productTypeName,
    this.partnerName,
    this.description,
    this.weight,
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
    this.tryBeforeBuy,
    this.price,
    this.gst,
    this.fullPayment,
    this.advancePayment,
    this.productStatus,
    this.estimateDeliveryDays,
    this.productImageList,
    this.collectionIdList,
    this.metaldetails,
    this.decorativedetails,
    this.stonedetails,
    this.diamonddetails,
    this.subcategoryId,
    this.isFav,
    this.favId,
  });

  factory GetProductModel.fromJson(Map<String, dynamic> json) =>
      GetProductModel(
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
        collectionIdList: List<CollectionId>.from(
            (json["Collection_ids"] ?? []).map((x) => Productimage.fromJson(x))),
        subcategoryId: List<SubcategoryId>.from((json["subcategory_ids"] ?? [])
            .map((x) => SubcategoryId.fromJson(x))),
        metaldetails: List<Metaldetail>.from(
            (json["metaldetails"] ?? []).map((x) => Metaldetail.fromJson(x))),
        decorativedetails: List<Decorativedetail>.from(
            (json["decorativedetails"] ?? [])
                .map((x) => CollectionId.fromJson(x))),
        stonedetails: List<Stonedetail>.from(
            (json["stonedetails"] ?? []).map((x) => Stonedetail.fromJson(x))),
        diamonddetails: List<Diamonddetail>.from((json["diamonddetails"] ?? [])
            .map((x) => Diamonddetail.fromJson(x))),
        isFav: json["isFav"] ?? false,
        favId: json["favId"] ?? 0,
      );
}

class Decorativedetail {
  Decorativedetail({
    required this.decorativeItemName,
    required this.decorativeItemWt,
    required this.unitDecoItemWt,
    // this.decorativeChargeableAmount,
  });

  final String decorativeItemName;
  final String decorativeItemWt;
  final String unitDecoItemWt;

  // final dynamic decorativeChargeableAmount;

  factory Decorativedetail.fromJson(Map<String, dynamic> json) =>
      Decorativedetail(
        decorativeItemName: json["DecorativeItemName"] ?? "",
        decorativeItemWt: json["DecorativeItemWt"] ?? "",
        unitDecoItemWt: json["UnitDecoItemWt"] ?? "",
        // decorativeChargeableAmount: json["DecorativeChargeableAmount"] ,
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

class Productimage {
  Productimage({
    required this.imageName,
    required this.imageLocation,
  });

  String imageName;
  String imageLocation;

  factory Productimage.fromJson(Map<String, dynamic> json) => Productimage(
        imageName: json["imageName"] ?? "",
        imageLocation: json["imageLocation"] ?? "",
      );
}

class ProductImageList {
  int srNo;
  String imageName;
  String imageLocation;

  ProductImageList({
    required this.srNo,
    required this.imageName,
    required this.imageLocation,
  });

  factory ProductImageList.fromJson(Map<String, dynamic> json) => ProductImageList(
    srNo: json["SrNo"] ?? 0,
    imageName: json["ImageName"] ?? "",
    imageLocation: json["ImageLocation"] ?? "",
  );


}

class Metaldetail {
  String metalWt;
  String unitMetalWt;
  String metalType;
  String metalPurity;
  bool isHallmarked;

  Metaldetail({
    required this.metalWt,
    required this.unitMetalWt,
    required this.metalType,
    required this.metalPurity,
    required this.isHallmarked,
  });

  factory Metaldetail.fromJson(Map<String, dynamic> json) => Metaldetail(
        metalWt: json["MetalWt"] ?? "",
        unitMetalWt: json["UnitMetalWt"] ?? "",
        metalType: json["MetalType"] ?? "",
        metalPurity: json["MetalPurity"] ?? "",
        isHallmarked: json["isHallmarked"] ?? false,
      );
}

class Stonedetail {
  String stoneName;
  String stoneWt;
  String unitStoneWt;
  String stoneChargeableAmount;

  Stonedetail({
    required this.stoneName,
    required this.stoneWt,
    required this.unitStoneWt,
    required this.stoneChargeableAmount,
  });

  factory Stonedetail.fromJson(Map<String, dynamic> json) => Stonedetail(
        stoneName: json["StoneName"] ?? "",
        stoneWt: json["StoneWt"] ?? "",
        unitStoneWt: json["UnitStoneWt"] ?? "",
        stoneChargeableAmount: json["StoneChargeableAmount"] ?? "",
      );
}

class CollectionId {
  CollectionId({
    required this.collectionSrNo,
  });

  String collectionSrNo;

  factory CollectionId.fromJson(Map<String, dynamic> json) => CollectionId(
        collectionSrNo: json["collectionSrNo"] ?? "",
      );
}

class SubcategoryId {
  SubcategoryId({
    required this.subcategorySrNo,
  });

  String subcategorySrNo;

  factory SubcategoryId.fromJson(Map<String, dynamic> json) => SubcategoryId(
        subcategorySrNo: json["subcategorySrNo"] ?? "",
      );
}
