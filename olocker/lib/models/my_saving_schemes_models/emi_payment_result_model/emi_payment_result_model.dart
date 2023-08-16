// To parse this JSON data, do
//
//     final emiPaymentResultModel = emiPaymentResultModelFromJson(jsonString);

import 'dart:convert';

import '../../error_info_model/error_info_model.dart';

EmiPaymentResultModel emiPaymentResultModelFromJson(String str) => EmiPaymentResultModel.fromJson(json.decode(str));


class EmiPaymentResultModel {
  int statusCode;
  Data data;

  EmiPaymentResultModel({
    required this.statusCode,
    required this.data,
  });

  factory EmiPaymentResultModel.fromJson(Map<String, dynamic> json) => EmiPaymentResultModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );


}

class Data {
  String paymentId;
  int customerPurchaseSavingSchemeNo;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.paymentId,
    required this.customerPurchaseSavingSchemeNo,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    paymentId: json["paymentId"] ?? "",
    customerPurchaseSavingSchemeNo: json["customerPurchaseSavingSchemeNo"] ?? 0,
    success: json["success"] ?? false,
    errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
  );

}

