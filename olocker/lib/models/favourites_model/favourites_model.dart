// To parse this JSON data, do
//
//     final favouritesModel = favouritesModelFromJson(jsonString);

import 'dart:convert';

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
  ErrorInfo errorInfo;

  Data({
    required this.favProduct,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        favProduct: List<FavProduct>.from(
            (json["favProduct"] ?? []).map((x) => FavProduct.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );
}

class ErrorInfo {
  int errorType;
  String extraInfo;
  String description;

  // dynamic errorData;

  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    // required this.errorData,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorType: json["error_type"] ?? 0,
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        // errorData: json["error_data "],
      );
}

class FavProduct {
  int id;
  int customerId;
  int product;
  String dateAdded;
  String partnerId;
  bool isSupplierProduct;
  int partnerSrNo;
  String partnerName;
  ProductDetails productDetails;

  FavProduct({
    required this.id,
    required this.customerId,
    required this.product,
    required this.dateAdded,
    required this.partnerId,
    required this.isSupplierProduct,
    required this.partnerSrNo,
    required this.partnerName,
    required this.productDetails,
  });

  factory FavProduct.fromJson(Map<String, dynamic> json) => FavProduct(
        id: json["Id"] ?? 0,
        customerId: json["CustomerId"] ?? 0,
        product: json["Product"] ?? 0,
        dateAdded: json["DateAdded"] ?? "",
        partnerId: json["PartnerId"] ?? "",
        isSupplierProduct: json["IsSupplierProduct"] ?? false,
        partnerSrNo: json["PartnerSrNo"] ?? 0,
        partnerName: json["PartnerName"] ?? "",
        productDetails: ProductDetails.fromJson(json["ProductDetails"] ?? {}),
      );
}

class ProductDetails {
  ProductDetailsData productDetailsData;

  ProductDetails({
    required this.productDetailsData,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        productDetailsData:
            ProductDetailsData.fromJson(json["ProductDetailsData"] ?? {}),
      );
}

class ProductDetailsData {
  int srNo;
  String productSku;
  String itemTypeName;
  String? partnerName;
  String itemType;
  String productTypeName;
  String description;
  String weight;

  // dynamic width;
  // dynamic height;
  // dynamic length;
  // dynamic breadth;
  // dynamic size;
  // dynamic unitWidth;
  // dynamic unitHeight;
  // dynamic unitLength;
  // dynamic unitBreadth;
  // dynamic unitSize;
  String gst;
  String price;
  String fullPayment;
  String advancePayment;
  bool tryBeforeBuy;
  String supplierSrNo;

  // dynamic estimateDeliveryDays;
  String productStatus;
  List<Metaldetail> metaldetails;

  // List<dynamic> decorativedetails;
  List<Stonedetail> stonedetails;
  List<Diamonddetail> diamonddetails;
  List<ProductImageList> productImageList;

  // List<dynamic> similarProductList;
  bool success;

  ProductDetailsData({
    required this.srNo,
    required this.productSku,
    required this.itemTypeName,
    required this.partnerName,
    required this.itemType,
    required this.productTypeName,
    required this.description,
    required this.weight,
    // required this.width,
    // required this.height,
    // required this.length,
    // required this.breadth,
    // required this.size,
    // required this.unitWidth,
    // required this.unitHeight,
    // required this.unitLength,
    // required this.unitBreadth,
    // required this.unitSize,
    required this.gst,
    required this.price,
    required this.fullPayment,
    required this.advancePayment,
    required this.tryBeforeBuy,
    required this.supplierSrNo,
    // required this.estimateDeliveryDays,
    required this.productStatus,
    required this.metaldetails,
    // required this.decorativedetails,
    required this.stonedetails,
    required this.diamonddetails,
    required this.productImageList,
    // required this.similarProductList,
    required this.success,
  });

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) =>
      ProductDetailsData(
        srNo: json["SrNo"] ?? 0,
        productSku: json["ProductSku"] ?? "",
        itemTypeName: json["ItemTypeName"] ?? "",
        partnerName: json["PartnerName"] ?? "",
        itemType: json["ItemType"] ?? "",
        productTypeName: json["ProductTypeName"] ?? "",
        description: json["Description"] ?? "",
        weight: json["Weight"] ?? "",
        // width: json["Width"],
        // height: json["Height"],
        // length: json["Length"],
        // breadth: json["Breadth"],
        // size: json["Size"],
        // unitWidth: json["UnitWidth"],
        // unitHeight: json["UnitHeight"],
        // unitLength: json["UnitLength"],
        // unitBreadth: json["UnitBreadth"],
        // unitSize: json["UnitSize"],
        gst: json["GST"] ?? "",
        price: json["Price"] ?? "",
        fullPayment: json["FullPayment"] ?? "",
        advancePayment: json["AdvancePayment"] ?? "",
        tryBeforeBuy: json["TryBeforeBuy"] ?? "",
        supplierSrNo: json["SupplierSrNo"] ?? "",
        // estimateDeliveryDays: json["EstimateDeliveryDays"],
        productStatus: json["ProductStatus"] ?? "",
        metaldetails: List<Metaldetail>.from(
            (json["metaldetails"] ?? []).map((x) => Metaldetail.fromJson(x))),
        // decorativedetails: List<dynamic>.from(json["decorativedetails"].map((x) => x)),
        stonedetails: List<Stonedetail>.from(
            (json["stonedetails"] ?? []).map((x) => Stonedetail.fromJson(x))),
        diamonddetails: List<Diamonddetail>.from((json["diamonddetails"] ?? [])
            .map((x) => Diamonddetail.fromJson(x))),
        productImageList: List<ProductImageList>.from(
            (json["ProductImageList"] ?? [])
                .map((x) => ProductImageList.fromJson(x))),
        // similarProductList: List<dynamic>.from(json["SimilarProductList"].map((x) => x)),
        success: json["success"],
      );
}

class Diamonddetail {
  int srNo;
  String productSrNo;
  String stoneName;

  // dynamic stoneProperties;
  String stoneWt;
  String unitStoneWt;

  // dynamic stoneCnt;
  // dynamic isStoneCertified;
  // dynamic stoneCertificateNo;
  // dynamic stoneCertificateDate;
  // dynamic stoneCertifiedBy;
  String timestamp;
  String stoneChargeableAmount;

  // dynamic stoneQuality;
  // dynamic stoneShape;
  String isDiamond;

  Diamonddetail({
    required this.srNo,
    required this.productSrNo,
    required this.stoneName,
    // required this.stoneProperties,
    required this.stoneWt,
    required this.unitStoneWt,
    // required this.stoneCnt,
    // required this.isStoneCertified,
    // required this.stoneCertificateNo,
    // required this.stoneCertificateDate,
    // required this.stoneCertifiedBy,
    required this.timestamp,
    required this.stoneChargeableAmount,
    // required this.stoneQuality,
    // required this.stoneShape,
    required this.isDiamond,
  });

  factory Diamonddetail.fromJson(Map<String, dynamic> json) => Diamonddetail(
        srNo: json["SrNo"] ?? 0,
        productSrNo: json["ProductSrNo"] ?? "",
        stoneName: json["StoneName"] ?? "",
        // stoneProperties: json["StoneProperties"],
        stoneWt: json["StoneWt"] ?? "",
        unitStoneWt: json["UnitStoneWt"] ?? "",
        // stoneCnt: json["StoneCnt"],
        // isStoneCertified: json["isStoneCertified"],
        // stoneCertificateNo: json["StoneCertificateNo"],
        // stoneCertificateDate: json["StoneCertificateDate"],
        // stoneCertifiedBy: json["StoneCertifiedBy"],
        timestamp: json["Timestamp"] ?? "",
        stoneChargeableAmount: json["StoneChargeableAmount"] ?? "",
        // stoneQuality: json["StoneQuality"],
        // stoneShape: json["StoneShape"],
        isDiamond: json["isDiamond"] ?? "",
      );
}

class Metaldetail {
  int srNo;
  String productSrNo;
  String metalWt;
  String unitMetalWt;
  String metalType;
  String metalPurity;
  String timestamp;
  bool isHallmarked;

  Metaldetail({
    required this.srNo,
    required this.productSrNo,
    required this.metalWt,
    required this.unitMetalWt,
    required this.metalType,
    required this.metalPurity,
    required this.timestamp,
    required this.isHallmarked,
  });

  factory Metaldetail.fromJson(Map<String, dynamic> json) => Metaldetail(
        srNo: json["SrNo"] ?? 0,
        productSrNo: json["ProductSrNo"] ?? "",
        metalWt: json["MetalWt"] ?? "",
        unitMetalWt: json["UnitMetalWt"] ?? "",
        metalType: json["MetalType"] ?? "",
        metalPurity: json["MetalPurity"] ?? "",
        timestamp: json["Timestamp"] ?? "",
        isHallmarked: json["isHallmarked"] ?? "",
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

  factory ProductImageList.fromJson(Map<String, dynamic> json) =>
      ProductImageList(
        srNo: json["SrNo"] ?? 0,
        imageName: json["ImageName"] ?? "",
        imageLocation: json["ImageLocation"] ?? "",
      );
}

class Stonedetail {
  int srNo;
  String productSrNo;
  String stoneName;

  // dynamic stoneProperties;
  String stoneWt;
  String unitStoneWt;

  // dynamic stoneCnt;
  // dynamic isStoneCertified;
  // dynamic stoneCertificateNo;
  // dynamic stoneCertificateDate;
  // dynamic stoneCertifiedBy;
  String timestamp;
  String stoneChargeableAmount;

  // dynamic stoneQuality;
  // dynamic stoneShape;
  // dynamic isDiamond;

  Stonedetail({
    required this.srNo,
    required this.productSrNo,
    required this.stoneName,
    // required this.stoneProperties,
    required this.stoneWt,
    required this.unitStoneWt,
    // required this.stoneCnt,
    // required this.isStoneCertified,
    // required this.stoneCertificateNo,
    // required this.stoneCertificateDate,
    // required this.stoneCertifiedBy,
    required this.timestamp,
    required this.stoneChargeableAmount,
    // required this.stoneQuality,
    // required this.stoneShape,
    // required this.isDiamond,
  });

  factory Stonedetail.fromJson(Map<String, dynamic> json) => Stonedetail(
        srNo: json["SrNo"] ?? 0,
        productSrNo: json["ProductSrNo"] ?? "",
        stoneName: json["StoneName"] ?? "",
        // stoneProperties: json["StoneProperties"],
        stoneWt: json["StoneWt"] ?? "",
        unitStoneWt: json["UnitStoneWt"] ?? "",
        // stoneCnt: json["StoneCnt"],
        // isStoneCertified: json["isStoneCertified"],
        // stoneCertificateNo: json["StoneCertificateNo"],
        // stoneCertificateDate: json["StoneCertificateDate"],
        // stoneCertifiedBy: json["StoneCertifiedBy"],
        timestamp: json["Timestamp"] ?? "",
        stoneChargeableAmount: json["StoneChargeableAmount"] ?? "",
        // stoneQuality: json["StoneQuality"],
        // stoneShape: json["StoneShape"],
        // isDiamond: json["isDiamond"],
      );
}
