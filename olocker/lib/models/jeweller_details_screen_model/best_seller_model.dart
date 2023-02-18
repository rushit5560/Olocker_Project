/*
import 'dart:convert';

BestSellerModel bestSellerModelFromJson(String str) => BestSellerModel.fromJson(json.decode(str));

String bestSellerModelToJson(BestSellerModel data) => json.encode(data.toJson());

class BestSellerModel {
  BestSellerModel({
    required this.listOfProducts,
    required this.success,
    required this.errorInfo,
  });

  List<ListOfProduct> listOfProducts;
  bool success;
  ErrorInfo errorInfo;

  factory BestSellerModel.fromJson(Map<String, dynamic> json) => BestSellerModel(
    listOfProducts: List<ListOfProduct>.from((json["FavProductList"] ?? []).map((x) => ListOfProduct.fromJson(x ?? {}))),
    // listOfProducts: List<ListOfProduct>.from((json["ListOfProducts"] ?? []).map((x) => ListOfProduct.fromJson(x ?? {}))),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "FavProductList": List<dynamic>.from(listOfProducts.map((x) => x.toJson())),
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

class ErrorInfo {
  ErrorInfo({
    // this.errorType,
    required this.extraInfo,
    // this.description,
    // this.errorData,
  });

  // int errorType;
  String extraInfo;
  // String description;
  // dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
    // errorType: json["error_type"],
    extraInfo: json["extra_info"] ?? "",
    // description: json["description"],
    // errorData: json["error_data"],
  );

  Map<String, dynamic> toJson() => {
    // "error_type": errorType,
    "extra_info": extraInfo,
    // "description": description,
    // "error_data": errorData,
  };
}

class ListOfProduct {
  ListOfProduct({
    required this.productsrno,
    required this.partnersrno,
    required this.suppliersrno,
    required this.name,
    required this.productType,
    required this.grosswt,
    required this.hallmarked,
    required this.tryBeforeBuy,
    required this.price,
    required this.productsku,
    required this.description,
    required this.width,
    required this.unitofwidth,
    required this.height,
    required this.unitofheight,
    required this.length,
    required this.unitoflength,
    required this.breadth,
    required this.unitofbreadth,
    required this.size,
    required this.unitofsize,
    required this.certified,
    required this.certBy,
    required this.mrpbasis,
    required this.preinsured,
    required this.charges,
    required this.wastagePercent,
    required this.gender,
    required this.categoryType,
    required this.productStatus,
    required this.estimateDeliveryDays,
    required this.metaldetails,
    // required this.decorativedetails,
    required this.stonedetails,
    required this.diamonddetails,
    required this.productimages,
    required this.collectionIds,
    required this.subcategoryIds,
  });

  int productsrno;
  int partnersrno;
  int suppliersrno;
  String name;
  String productType;
  String grosswt;
  bool hallmarked;
  bool tryBeforeBuy;
  String price;
  String productsku;
  String description;
  String width;
  String unitofwidth;
  String height;
  String unitofheight;
  String length;
  String unitoflength;
  String breadth;
  String unitofbreadth;
  String size;
  String unitofsize;
  bool certified;
  String certBy;
  bool mrpbasis;
  bool preinsured;
  String charges;
  String wastagePercent;
  String gender;
  String categoryType;
  String productStatus;
  String estimateDeliveryDays;
  List<MetalDetailItem> metaldetails;
  // List<dynamic> decorativedetails;
  List<StoneDetailsItem> stonedetails;
  List<DiamondDetailsItem> diamonddetails;
  List<ProductImageItem> productimages;
  List<CollectionIdItem> collectionIds;
  List<SubCategoryIdItem> subcategoryIds;

  factory ListOfProduct.fromJson(Map<String, dynamic> json) => ListOfProduct(
    productsrno: json["productsrno"] ?? 0,
    partnersrno: json["partnersrno"] ?? 0,
    suppliersrno: json["suppliersrno"] ?? 0,
    name: json["name"] ?? "",
    productType: json["product_type"] ?? "",
    grosswt: json["grosswt"].toString(),
    hallmarked: json["hallmarked"] ?? false,
    tryBeforeBuy: json["try_before_buy"] ?? false,
    price: json["price"] ?? "",
    productsku: json["productsku"] ?? "",
    description: json["description"].toString(),
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
    gender: json["gender"].toString(),
    categoryType: json["category_type"] ?? "",
    productStatus: json["product_status"].toString(),
    estimateDeliveryDays: json["estimate_delivery_days"] ?? "",
    metaldetails: List<MetalDetailItem>.from(json["metaldetails"].map((x) => MetalDetailItem.fromJson(x))),
    // decorativedetails: List<dynamic>.from(json["decorativedetails"].map((x) => x)),
    stonedetails: List<StoneDetailsItem>.from(json["stonedetails"].map((x) => StoneDetailsItem.fromJson(x))),
    diamonddetails: List<DiamondDetailsItem>.from(json["diamonddetails"].map((x) => DiamondDetailsItem.fromJson(x))),
    productimages: List<ProductImageItem>.from(json["productimages"].map((x) => ProductImageItem.fromJson(x))),
    collectionIds: List<CollectionIdItem>.from(json["collection_ids"].map((x) => CollectionIdItem.fromJson(x))),
    subcategoryIds: List<SubCategoryIdItem>.from(json["subcategory_ids"].map((x) => SubCategoryIdItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "productsrno": productsrno,
    "partnersrno": partnersrno,
    "suppliersrno": suppliersrno,
    "name": name,
    "product_type": productType,
    "grosswt": grosswt,
    "hallmarked": hallmarked,
    "try_before_buy": tryBeforeBuy,
    "price": price,
    "productsku": productsku,
    "description": description,
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
    "metaldetails": List<dynamic>.from(metaldetails.map((x) => x.toJson())),
    // "decorativedetails": List<dynamic>.from(decorativedetails.map((x) => x)),
    "stonedetails": List<dynamic>.from(stonedetails.map((x) => x.toJson())),
    "diamonddetails": List<dynamic>.from(diamonddetails.map((x) => x.toJson())),
    "productimages": List<dynamic>.from(productimages.map((x) => x.toJson())),
    "collection_ids": List<dynamic>.from(collectionIds.map((x) => x.toJson())),
    "subcategory_ids": List<dynamic>.from(subcategoryIds.map((x) => x.toJson())),
  };
}

class MetalDetailItem {
  MetalDetailItem({
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

  factory MetalDetailItem.fromJson(Map<String, dynamic> json) => MetalDetailItem(
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

class StoneDetailsItem {
  StoneDetailsItem({
    required this.stoneName,
    required this.stoneWt,
    required this.unitStoneWt,
    required this.stoneChargeableAmount,
  });

  String stoneName;
  String stoneWt;
  String unitStoneWt;
  String stoneChargeableAmount;

  factory StoneDetailsItem.fromJson(Map<String, dynamic> json) => StoneDetailsItem(
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

class DiamondDetailsItem {
  DiamondDetailsItem({
    required this.stoneName,
    required this.stoneWt,
    required this.unitStoneWt,
    // required this.stoneShape,
    // required this.stoneQuality,
    required this.stoneChargeableAmount,
  });

  String stoneName;
  String stoneWt;
  String unitStoneWt;
  // dynamic stoneShape;
  // dynamic stoneQuality;
  String stoneChargeableAmount;

  factory DiamondDetailsItem.fromJson(Map<String, dynamic> json) => DiamondDetailsItem(
    stoneName: json["StoneName"] ?? "",
    stoneWt: json["StoneWt"] ?? "",
    unitStoneWt: json["UnitStoneWt"] ?? "",
    // stoneShape: json["StoneShape"],
    // stoneQuality: json["StoneQuality"],
    stoneChargeableAmount: json["StoneChargeableAmount"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "StoneName": stoneName,
    "StoneWt": stoneWt,
    "UnitStoneWt": unitStoneWt,
    // "StoneShape": stoneShape,
    // "StoneQuality": stoneQuality,
    "StoneChargeableAmount": stoneChargeableAmount,
  };
}

class ProductImageItem {
  ProductImageItem({
    required this.imageName,
    required this.imageLocation,
  });

  String imageName;
  String imageLocation;

  factory ProductImageItem.fromJson(Map<String, dynamic> json) => ProductImageItem(
    imageName: json["ImageName"] ?? "",
    imageLocation: json["ImageLocation"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "ImageName": imageName,
    "ImageLocation": imageLocation,
  };
}

class CollectionIdItem {
  CollectionIdItem({
    required this.collectionSrNo,
  });

  String collectionSrNo;

  factory CollectionIdItem.fromJson(Map<String, dynamic> json) => CollectionIdItem(
    collectionSrNo: json["CollectionSrNo"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "CollectionSrNo": collectionSrNo,
  };
}

class SubCategoryIdItem {
  SubCategoryIdItem({
    required this.subcategorySrNo,
  });

  String subcategorySrNo;

  factory SubCategoryIdItem.fromJson(Map<String, dynamic> json) => SubCategoryIdItem(
    subcategorySrNo: json["SubcategorySrNo"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "SubcategorySrNo": subcategorySrNo,
  };
}














*/


import 'dart:convert';

BestSellerModel bestSellerModelFromJson(String str) => BestSellerModel.fromJson(json.decode(str));

String bestSellerModelToJson(BestSellerModel data) => json.encode(data.toJson());

class BestSellerModel {
  BestSellerModel({
    required this.favProductList,
    required this.success,
    required this.errorInfo,
  });

  List<FavProductList> favProductList;
  bool success;
  ErrorInfo errorInfo;

  factory BestSellerModel.fromJson(Map<String, dynamic> json) => BestSellerModel(
    favProductList: List<FavProductList>.from((json["FavProductList"] ?? []).map((x) => FavProductList.fromJson(x))),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "FavProductList": List<dynamic>.from(favProductList.map((x) => x.toJson())),
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    // this.errorData,
  });

  int errorType;
  String extraInfo;
  String description;
  // dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
    errorType: json["error_type"] ?? 0,
    extraInfo: json["extra_info"] ?? "",
    description: json["description"] ?? "",
    // errorData: json["error_data"],
  );

  Map<String, dynamic> toJson() => {
    "error_type": errorType,
    "extra_info": extraInfo,
    "description": description,
    // "error_data": errorData,
  };
}

class FavProductList {
  FavProductList({
    required this.srNo,
    required this.itemName,
    required this.partnerSrNo,
    required this.productImage,
    required this.productPrice,
  });

  int srNo;
  String itemName;
  int partnerSrNo;
  String productImage;
  String productPrice;

  factory FavProductList.fromJson(Map<String, dynamic> json) => FavProductList(
    srNo: json["SrNo"] ?? 0,
    itemName: json["ItemName"] ?? "",
    partnerSrNo: json["PartnerSrNo"] ?? 0,
    productImage: json["ProductImage"] ?? "",
    productPrice: json["ProductPrice"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "ItemName": itemName,
    "PartnerSrNo": partnerSrNo,
    "ProductImage": productImage,
    "ProductPrice": productPrice,
  };
}

