// To parse this JSON data, do
//
//     final paymentSchemeResultModel = paymentSchemeResultModelFromJson(jsonString);

import 'dart:convert';

PaymentSchemeResultModel paymentSchemeResultModelFromJson(String str) =>
    PaymentSchemeResultModel.fromJson(json.decode(str));

String paymentSchemeResultModelToJson(PaymentSchemeResultModel data) =>
    json.encode(data.toJson());

class PaymentSchemeResultModel {
  PaymentSchemeResultModel({
    required this.customerPurchaseSavingSchemeSrNo,
    required this.success,
    required this.errorInfo,
  });

  final int customerPurchaseSavingSchemeSrNo;
  final bool success;
  final ErrorInfo errorInfo;

  factory PaymentSchemeResultModel.fromJson(Map<String, dynamic> json) =>
      PaymentSchemeResultModel(
        customerPurchaseSavingSchemeSrNo:
            json["CustomerPurchaseSavingSchemeSrNo"] ?? 0,
        success: json["success"] ?? "",
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "CustomerPurchaseSavingSchemeSrNo": customerPurchaseSavingSchemeSrNo,
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
