import 'dart:convert';

GetOfferFavouriteVendorModel getOfferFavouriteVendorModelFromJson(String str) =>
    GetOfferFavouriteVendorModel.fromJson(json.decode(str));

String getOfferFavouriteVendorModelToJson(GetOfferFavouriteVendorModel data) =>
    json.encode(data.toJson());

class GetOfferFavouriteVendorModel {
  GetOfferFavouriteVendorModel({
    required this.getProductModel,
    required this.success,
    required this.errorInfo,
  });

  GetProductModel getProductModel;
  bool success;
  ErrorInfo errorInfo;

  factory GetOfferFavouriteVendorModel.fromJson(Map<String, dynamic> json) =>
      GetOfferFavouriteVendorModel(
        getProductModel:
            GetProductModel.fromJson(json["GetProductModel"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "GetProductModel": getProductModel.toJson(),
        "success": success,
        "error_info": errorInfo.toJson(),
      };
}

class ErrorInfo {
  ErrorInfo({
    // required this.errorType,
    required this.extraInfo,
    required this.description,
    // required this.errorData,
  });

  // int errorType;
  String extraInfo;
  String description;
  // dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        // errorType: json["error_type"],
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        // errorData: json["error_data"],
      );

  Map<String, dynamic> toJson() => {
        // "error_type": errorType,
        "extra_info": extraInfo,
        "description": description,
        // "error_data": errorData,
      };
}

class GetProductModel {
  GetProductModel({
    this.productsrno,
    this.partnersrno,
    this.suppliersrno,
    this.name,
    this.productType,
    // required this.grosswt,
    this.hallmarked,
    this.tryBeforeBuy,
    this.price,
    this.productsku,
    // required this.description,
    this.width,
    this.unitofwidth,
    this.height,
    this.unitofheight,
    this.length,
    this.unitoflength,
    this.breadth,
    this.unitofbreadth,
    this.size,
    this.unitofsize,
    this.certified,
    this.certBy,
    this.mrpbasis,
    this.preinsured,
    this.charges,
    this.wastagePercent,
    this.gender,
    this.categoryType,
    this.productStatus,
    this.estimateDeliveryDays,
    this.isFav,
    this.favId,
    this.metaldetails,
    this.decorativedetails,
    this.stonedetails,
    this.diamonddetails,
    this.productimages,
    this.collectionIds,
    this.subcategoryIds,
  });

  int? productsrno;
  int? partnersrno;
  int? suppliersrno;
  String? name;
  String? productType;
  // double grosswt;
  bool? hallmarked;
  bool? tryBeforeBuy;
  String? price;
  String? productsku;
  // dynamic description;
  String? width;
  String? unitofwidth;
  String? height;
  String? unitofheight;
  String? length;
  String? unitoflength;
  String? breadth;
  String? unitofbreadth;
  String? size;
  String? unitofsize;
  bool? certified;
  String? certBy;
  bool? mrpbasis;
  bool? preinsured;
  String? charges;
  String? wastagePercent;
  String? gender;
  String? categoryType;
  String? productStatus;
  String? estimateDeliveryDays;
  bool? isFav;
  int? favId;
  List<Metaldetail>? metaldetails;
  List<Decorativedetail>? decorativedetails;
  List<Stonedetail>? stonedetails;
  List<Diamonddetail>? diamonddetails;
  List<Productimage>? productimages;
  List<CollectionId>? collectionIds;
  List<SubcategoryId>? subcategoryIds;

  factory GetProductModel.fromJson(Map<String, dynamic> json) =>
      GetProductModel(
        productsrno: json["productsrno"] ?? 0,
        partnersrno: json["partnersrno"] ?? 0,
        suppliersrno: json["suppliersrno"] ?? 0,
        name: json["name"] ?? "",
        productType: json["product_type"] ?? "",
        // grosswt: json["grosswt"].toDouble(),
        hallmarked: json["hallmarked"] ?? false,
        tryBeforeBuy: json["try_before_buy"] ?? false,
        price: json["price"] ?? "",
        productsku: json["productsku"] ?? "",
        // description: json["description"],
        width: json["width"] ?? "",
        unitofwidth: json["unitofwidth"] ?? "",
        height: json["height"] ?? "",
        unitofheight: json["unitofheight"] ?? "",
        length: json["length"] ?? "",
        unitoflength: json["unitoflength"] ?? "",
        breadth: json["breadth"] ?? "",
        unitofbreadth: json["unitofbreadth"] ?? "",
        size: json["size"] ?? "",
        unitofsize: json["unitofsize"] ?? "",
        certified: json["certified"] ?? false,
        certBy: json["cert_by"] ?? "",
        mrpbasis: json["mrpbasis"] ?? false,
        preinsured: json["preinsured"] ?? false,
        charges: json["charges"] ?? "",
        wastagePercent: json["wastage_percent"] ?? "",
        gender: json["gender"] ?? "",
        categoryType: json["category_type"] ?? "",
        productStatus: json["product_status"] ?? "",
        estimateDeliveryDays: json["estimate_delivery_days"] ?? "",
        isFav: json["IsFav"] ?? false,
        favId: json["favId"] ?? 0,
        metaldetails: List<Metaldetail>.from(
            (json["metaldetails"] ?? []).map((x) => Metaldetail.fromJson(x))),
        decorativedetails: List<Decorativedetail>.from(
            (json["decorativedetails"] ?? [])
                .map((x) => Decorativedetail.fromJson(x))),
        stonedetails: List<Stonedetail>.from(
            (json["stonedetails"] ?? []).map((x) => Stonedetail.fromJson(x))),
        diamonddetails: List<Diamonddetail>.from((json["diamonddetails"] ?? [])
            .map((x) => Diamonddetail.fromJson(x))),
        productimages: List<Productimage>.from(
            (json["productimages"] ?? []).map((x) => Productimage.fromJson(x))),
        collectionIds: List<CollectionId>.from((json["collection_ids"] ?? [])
            .map((x) => CollectionId.fromJson(x))),
        subcategoryIds: List<SubcategoryId>.from((json["subcategory_ids"] ?? [])
            .map((x) => SubcategoryId.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productsrno": productsrno,
        "partnersrno": partnersrno,
        "suppliersrno": suppliersrno,
        "name": name,
        "product_type": productType,
        // "grosswt": grosswt,
        "hallmarked": hallmarked,
        "try_before_buy": tryBeforeBuy,
        "price": price,
        "productsku": productsku,
        // "description": description,
        "width": width,
        "unitofwidth": unitofwidth,
        "height": height,
        "unitofheight": unitofheight,
        "length": length,
        "unitoflength": unitoflength,
        "breadth": breadth,
        "unitofbreadth": unitofbreadth,
        "size": size,
        "unitofsize": unitofsize,
        "certified": certified,
        "cert_by": certBy,
        "mrpbasis": mrpbasis,
        "preinsured": preinsured,
        "charges": charges,
        "wastage_percent": wastagePercent,
        "gender": gender,
        "category_type": categoryType,
        "product_status": productStatus,
        "estimate_delivery_days": estimateDeliveryDays,
        "IsFav": isFav,
        "metaldetails":
            List<dynamic>.from(metaldetails!.map((x) => x.toJson())),
        // "decorativedetails": List<dynamic>.from(decorativedetails.map((x) => x)),
        "stonedetails":
            List<dynamic>.from(stonedetails!.map((x) => x.toJson())),
        "diamonddetails": List<dynamic>.from(diamonddetails!.map((x) => x)),
        "productimages":
            List<dynamic>.from(productimages!.map((x) => x.toJson())),
        "collection_ids":
            List<dynamic>.from(collectionIds!.map((x) => x.toJson())),
        "subcategory_ids":
            List<dynamic>.from(subcategoryIds!.map((x) => x.toJson())),
      };
}

class CollectionId {
  CollectionId({
    required this.collectionSrNo,
  });

  String collectionSrNo;

  factory CollectionId.fromJson(Map<String, dynamic> json) => CollectionId(
        collectionSrNo: json["CollectionSrNo"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "CollectionSrNo": collectionSrNo,
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

  String metalWt;
  String unitMetalWt;
  String metalType;
  String metalPurity;
  bool isHallmarked;

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

class Productimage {
  Productimage({
    required this.imageName,
    required this.imageLocation,
  });

  String imageName;
  String imageLocation;

  factory Productimage.fromJson(Map<String, dynamic> json) => Productimage(
        imageName: json["ImageName"] ?? "",
        imageLocation: json["ImageLocation"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "ImageName": imageName,
        "ImageLocation": imageLocation,
      };
}

class Stonedetail {
  Stonedetail({
    required this.stoneName,
    required this.stoneWt,
    required this.unitStoneWt,
    required this.stoneChargeableAmount,
  });

  String stoneName;
  String stoneWt;
  String unitStoneWt;
  String stoneChargeableAmount;

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

class SubcategoryId {
  SubcategoryId({
    required this.subcategorySrNo,
  });

  String subcategorySrNo;

  factory SubcategoryId.fromJson(Map<String, dynamic> json) => SubcategoryId(
        subcategorySrNo: json["SubcategorySrNo"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "SubcategorySrNo": subcategorySrNo,
      };
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

  Map<String, dynamic> toJson() => {
        "DecorativeItemName": decorativeItemName,
        "DecorativeItemWt": decorativeItemWt,
        "UnitDecoItemWt": unitDecoItemWt,
        // "DecorativeChargeableAmount": decorativeChargeableAmount,
      };
}

class Diamonddetail {
  Diamonddetail({
    required this.stoneName,
    required this.stoneWt,
    required this.unitStoneWt,
    // this.stoneShape,
    // this.stoneQuality,
    // this.stoneChargeableAmount,
  });

  final String stoneName;
  final String stoneWt;
  final String unitStoneWt;
  // final dynamic stoneShape;
  // final dynamic stoneQuality;
  // final dynamic stoneChargeableAmount;

  factory Diamonddetail.fromJson(Map<String, dynamic> json) => Diamonddetail(
        stoneName: json["StoneName"] ?? "",
        stoneWt: json["StoneWt"] ?? "",
        unitStoneWt: json["UnitStoneWt"] ?? "",
        // stoneShape: json["StoneShape"],
        // stoneQuality: json["StoneQuality"],
        // stoneChargeableAmount: json["StoneChargeableAmount"],
      );

  Map<String, dynamic> toJson() => {
        "StoneName": stoneName,
        "StoneWt": stoneWt,
        "UnitStoneWt": unitStoneWt,
        // "StoneShape": stoneShape,
        // "StoneQuality": stoneQuality,
        // "StoneChargeableAmount": stoneChargeableAmount,
      };
}

// To parse this JSON data, do
//
//     final getOfferFavouriteVendorModel = getOfferFavouriteVendorModelFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'package:olocker/models/error_info_model/error_info_model.dart';
//
// GetOfferFavouriteVendorModel getOfferFavouriteVendorModelFromJson(String str) =>
//     GetOfferFavouriteVendorModel.fromJson(json.decode(str));
//
// class GetOfferFavouriteVendorModel {
//   int statusCode;
//   Data data;
//
//   GetOfferFavouriteVendorModel({
//     required this.statusCode,
//     required this.data,
//   });
//
//   factory GetOfferFavouriteVendorModel.fromJson(Map<String, dynamic> json) =>
//       GetOfferFavouriteVendorModel(
//         statusCode: json["statusCode"] ?? 0,
//         data: Data.fromJson(json["data"] ?? {}),
//       );
// }
//
// class Data {
//   GetProductModel getProductModel;
//   bool success;
//   ErrorInfoModel errorInfo;
//
//   Data({
//     required this.getProductModel,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         getProductModel:
//             GetProductModel.fromJson(json["productDetailsData"] ?? {}),
//         success: json["success"] ?? false,
//         errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
//       );
// }
//
// class GetProductModel {
//   int? srNo;
//   String? productSku;
//   String? itemType;
//   String? itemTypeName;
//   String? productTypeName;
//   String? partnerName;
//   String? description;
//   String? weight;
//   String? width;
//   String? height;
//   String? length;
//   String? breadth;
//   String? size;
//   String? unitWidth;
//   String? unitHeight;
//   String? unitLength;
//   String? unitBreadth;
//   String? unitSize;
//   bool? tryBeforeBuy;
//   String? price;
//   String? gst;
//   String? fullPayment;
//   String? advancePayment;
//   String? productStatus;
//   String? estimateDeliveryDays;
//   bool? isFav;
//   int? favId;
//   List<Productimage>? productImageList;
//   List<SimilarProduct>? similarProductList;
//   List<Metaldetail>? metaldetails;
//   List<Decorativedetail>? decorativedetails;
//   List<Stonedetail>? stonedetails;
//   List<Diamonddetail>? diamonddetails;
//
//   GetProductModel({
//     this.srNo,
//     this.productSku,
//     this.itemType,
//     this.itemTypeName,
//     this.productTypeName,
//     this.partnerName,
//     this.description,
//     this.weight,
//     this.width,
//     this.height,
//     this.length,
//     this.breadth,
//     this.size,
//     this.unitWidth,
//     this.unitHeight,
//     this.unitLength,
//     this.unitBreadth,
//     this.unitSize,
//     this.tryBeforeBuy,
//     this.price,
//     this.gst,
//     this.fullPayment,
//     this.advancePayment,
//     this.productStatus,
//     this.estimateDeliveryDays,
//     this.favId,
//     this.isFav,
//     this.productImageList,
//     this.similarProductList,
//     this.metaldetails,
//     this.decorativedetails,
//     this.stonedetails,
//     this.diamonddetails,
//   });
//
//   factory GetProductModel.fromJson(Map<String, dynamic> json) =>
//       GetProductModel(
//         srNo: json["srNo"] ?? 0,
//         productSku: json["productSku"] ?? "",
//         itemType: json["itemType"] ?? "",
//         itemTypeName: json["itemTypeName"] ?? "",
//         productTypeName: json["productTypeName"] ?? "",
//         partnerName: json["partnerName"] ?? "",
//         description: json["description"] ?? "",
//         weight: json["weight"] ?? "",
//         width: json["width"] ?? "",
//         height: json["height"] ?? "",
//         length: json["length"] ?? "",
//         breadth: json["breadth"] ?? "",
//         size: json["size"] ?? "",
//         unitWidth: json["unitWidth"] ?? "",
//         unitHeight: json["unitHeight"] ?? "",
//         unitLength: json["unitLength"] ?? "",
//         unitBreadth: json["unitBreadth"] ?? "",
//         unitSize: json["unitSize"] ?? "",
//         tryBeforeBuy: json["tryBeforeBuy"] ?? "",
//         price: json["price"] ?? "",
//         gst: json["gst"] ?? "",
//         fullPayment: json["fullPayment"] ?? "",
//         advancePayment: json["advancePayment"] ?? "",
//         productStatus: json["productStatus"] ?? "",
//         estimateDeliveryDays: json["estimateDeliveryDays"] ?? "",
//         isFav: json["isFav"] ?? false,
//         favId: json["favId"] ?? 0,
//         productImageList: List<Productimage>.from(
//             (json["productimages"] ?? []).map((x) => Productimage.fromJson(x))),
//         similarProductList: List<SimilarProduct>.from(
//             (json["similarProductList"] ?? []).map((x) => x)),
//         metaldetails: List<Metaldetail>.from(
//             (json["metaldetails"] ?? []).map((x) => Metaldetail.fromJson(x))),
//         decorativedetails: List<Decorativedetail>.from(
//             (json["decorativedetails"] ?? [])
//                 .map((x) => Decorativedetail.fromJson(x))),
//         stonedetails: List<Stonedetail>.from(
//             (json["stonedetails"] ?? []).map((x) => Stonedetail.fromJson(x))),
//         diamonddetails: List<Diamonddetail>.from((json["diamonddetails"] ?? [])
//             .map((x) => Diamonddetail.fromJson(x))),
//       );
// }
//
// class Diamonddetail {
//   String stoneName;
//   String stoneWt;
//   String unitStoneWt;
//   String stoneShape;
//   String stoneQuality;
//   String stoneChargeableAmount;
//
//   Diamonddetail({
//     required this.stoneName,
//     required this.stoneWt,
//     required this.unitStoneWt,
//     required this.stoneShape,
//     required this.stoneQuality,
//     required this.stoneChargeableAmount,
//   });
//
//   factory Diamonddetail.fromJson(Map<String, dynamic> json) => Diamonddetail(
//         stoneName: json["stoneName"] ?? "",
//         stoneWt: json["stoneWt"] ?? "",
//         unitStoneWt: json["unitStoneWt"] ?? "",
//         stoneShape: json["stoneShape"] ?? "",
//         stoneQuality: json["stoneQuality"] ?? "",
//         stoneChargeableAmount: json["stoneChargeableAmount"] ?? "",
//       );
// }
//
// class Productimage {
//   Productimage({
//     required this.imageName,
//     required this.imageLocation,
//   });
//
//   String imageName;
//   String imageLocation;
//
//   factory Productimage.fromJson(Map<String, dynamic> json) => Productimage(
//         imageName: json["imageName"] ?? "",
//         imageLocation: json["imageLocation"] ?? "",
//       );
// }
//
// class Metaldetail {
//   String metalWt;
//   String unitMetalWt;
//   String metalType;
//   String metalPurity;
//   bool isHallmarked;
//
//   Metaldetail({
//     required this.metalWt,
//     required this.unitMetalWt,
//     required this.metalType,
//     required this.metalPurity,
//     required this.isHallmarked,
//   });
//
//   factory Metaldetail.fromJson(Map<String, dynamic> json) => Metaldetail(
//         metalWt: json["metalWt"] ?? "",
//         unitMetalWt: json["unitMetalWt"] ?? "",
//         metalType: json["metalType"] ?? "",
//         metalPurity: json["metalPurity"] ?? "",
//         isHallmarked: json["isHallmarked"] ?? false,
//       );
// }
//
// class Decorativedetail {
//   Decorativedetail({
//     required this.decorativeItemName,
//     required this.decorativeItemWt,
//     required this.unitDecoItemWt,
//     // this.decorativeChargeableAmount,
//   });
//
//   final String decorativeItemName;
//   final String decorativeItemWt;
//   final String unitDecoItemWt;
//
//   // final dynamic decorativeChargeableAmount;
//
//   factory Decorativedetail.fromJson(Map<String, dynamic> json) =>
//       Decorativedetail(
//         decorativeItemName: json["decorativeItemName"] ?? "",
//         decorativeItemWt: json["decorativeItemWt"] ?? "",
//         unitDecoItemWt: json["unitDecoItemWt"] ?? "",
//         // decorativeChargeableAmount: json["DecorativeChargeableAmount"] ,
//       );
// }
//
// class SimilarProduct {
//   SimilarProduct({
//     required this.srNo,
//     required this.name,
//     required this.price,
//     required this.productImage,
//     // this.decorativeChargeableAmount,
//   });
//
//   final int srNo;
//   final String name;
//
//   final String price;
//
//   final String productImage;
//
//   // final dynamic decorativeChargeableAmount;
//
//   factory SimilarProduct.fromJson(Map<String, dynamic> json) => SimilarProduct(
//         srNo: json["srNo"] ?? 0,
//         name: json["name"] ?? "",
//         price: json["price"] ?? "",
//         productImage: json["productImage"] ?? "",
//       );
// }
//
// class Stonedetail {
//   String stoneName;
//   String stoneWt;
//   String unitStoneWt;
//   String stoneChargeableAmount;
//
//   Stonedetail({
//     required this.stoneName,
//     required this.stoneWt,
//     required this.unitStoneWt,
//     required this.stoneChargeableAmount,
//   });
//
//   factory Stonedetail.fromJson(Map<String, dynamic> json) => Stonedetail(
//         stoneName: json["stoneName"] ?? "",
//         stoneWt: json["stoneWt"] ?? "",
//         unitStoneWt: json["unitStoneWt"] ?? "",
//         stoneChargeableAmount: json["stoneChargeableAmount"] ?? "",
//       );
// }
