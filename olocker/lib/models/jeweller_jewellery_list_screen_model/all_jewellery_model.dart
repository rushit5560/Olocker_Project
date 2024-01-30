// To parse this JSON data, do
//
//     final allJewelleryModel = allJewelleryModelFromJson(jsonString);

import 'dart:convert';

import 'package:olocker/models/error_info_model/error_info_model.dart';

AllJewelleryModel allJewelleryModelFromJson(String str) =>
    AllJewelleryModel.fromJson(json.decode(str));

class AllJewelleryModel {
  int statusCode;
  Data data;

  AllJewelleryModel({
    required this.statusCode,
    required this.data,
  });

  factory AllJewelleryModel.fromJson(Map<String, dynamic> json) =>
      AllJewelleryModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<SearchProductListDatum> searchProductListData;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.searchProductListData,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        searchProductListData: List<SearchProductListDatum>.from(
            (json["SearchProductListData"] ?? [])
                .map((x) => SearchProductListDatum.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class SearchProductListDatum {
  int productSrNo;
  String productsPrice;
  String productName;
  String supplierSrNo;
  String productImage;
  bool isFav;
  String id;

  SearchProductListDatum({
    required this.productSrNo,
    required this.productsPrice,
    required this.productName,
    required this.supplierSrNo,
    required this.productImage,
    required this.isFav,
    required this.id,
  });

  factory SearchProductListDatum.fromJson(Map<String, dynamic> json) =>
      SearchProductListDatum(
        productSrNo: json["ProductSrNo"] ?? 0,
        productsPrice: json["ProductsPrice"] ?? "",
        productName: json["ProductName"] ?? "",
        supplierSrNo: json["SupplierSrNo"] ?? "",
        productImage: json["ProductImage"] ?? "",
        isFav: json["IsFav"] ?? false,
        id: json["Id"] ?? "",
      );
}
