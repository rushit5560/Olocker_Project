// To parse this JSON data, do
//
//     final emiPaymentResultModel = emiPaymentResultModelFromJson(jsonString);

import 'dart:convert';

EmiPaymentResultModel emiPaymentResultModelFromJson(String str) =>
    EmiPaymentResultModel.fromJson(json.decode(str));

String emiPaymentResultModelToJson(EmiPaymentResultModel data) =>
    json.encode(data.toJson());

class EmiPaymentResultModel {
  EmiPaymentResultModel({
    required this.paymentId,
    required this.customerPurchaseSavingSchemeNo,
    required this.success,
    required this.errorInfo,
  });

  final String paymentId;
  final int customerPurchaseSavingSchemeNo;
  final bool success;
  final ErrorInfo errorInfo;

  factory EmiPaymentResultModel.fromJson(Map<String, dynamic> json) =>
      EmiPaymentResultModel(
        paymentId: json["PaymentId"] ?? "",
        customerPurchaseSavingSchemeNo:
            json["CustomerPurchaseSavingSchemeNo"] ?? 0,
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "PaymentId": paymentId,
        "CustomerPurchaseSavingSchemeNo": customerPurchaseSavingSchemeNo,
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
