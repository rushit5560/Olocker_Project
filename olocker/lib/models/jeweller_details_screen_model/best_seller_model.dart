// To parse this JSON data, do
//
//     final bestSellerModel = bestSellerModelFromJson(jsonString);

import 'dart:convert';

import '../error_info_model/error_info_model.dart';

BestSellerModel bestSellerModelFromJson(String str) =>
    BestSellerModel.fromJson(json.decode(str));

class BestSellerModel {
  int statusCode;
  Data data;

  BestSellerModel({
    required this.statusCode,
    required this.data,
  });

  factory BestSellerModel.fromJson(Map<String, dynamic> json) =>
      BestSellerModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<FavProductList> favProductList;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.favProductList,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        favProductList: List<FavProductList>.from((json["favProductList"] ?? [])
                .map((x) => FavProductList.fromJson(x)) ??
            {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class FavProductList {
  int srNo;
  String itemName;
  int partnerSrNo;
  String productImage;
  String productPrice;

  FavProductList({
    required this.srNo,
    required this.itemName,
    required this.partnerSrNo,
    required this.productImage,
    required this.productPrice,
  });

  factory FavProductList.fromJson(Map<String, dynamic> json) => FavProductList(
        srNo: json["srNo"] ?? 0,
        itemName: json["itemName"] ?? "",
        partnerSrNo: json["partnerSrNo"] ?? 0,
        productImage: json["productImage"] ?? "",
        productPrice: json["productPrice"] ?? "",
      );
}
