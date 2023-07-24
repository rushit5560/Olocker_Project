// To parse this JSON data, do
//
//     final paymentSchemeResultModel = paymentSchemeResultModelFromJson(jsonString);

import 'dart:convert';

import 'package:olocker/models/error_info_model/error_info_model.dart';

PaymentSchemeResultModel paymentSchemeResultModelFromJson(String str) => PaymentSchemeResultModel.fromJson(json.decode(str));

String paymentSchemeResultModelToJson(PaymentSchemeResultModel data) => json.encode(data.toJson());

class PaymentSchemeResultModel {
  int statusCode;
  Data data;

  PaymentSchemeResultModel({
    required this.statusCode,
    required this.data,
  });

  factory PaymentSchemeResultModel.fromJson(Map<String, dynamic> json) => PaymentSchemeResultModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data.toJson(),
  };
}

class Data {
  int customerPurchaseSavingSchemeSrNo;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.customerPurchaseSavingSchemeSrNo,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    customerPurchaseSavingSchemeSrNo: json["customerPurchaseSavingSchemeSrNo"] ?? 0,
    success: json["success"] ?? false,
    errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "customerPurchaseSavingSchemeSrNo": customerPurchaseSavingSchemeSrNo,
    "success": success,
    // "error_info": errorInfo.toJson(),
  };
}

