// To parse this JSON data, do
//
//     final deleteInvoiceModel = deleteInvoiceModelFromJson(jsonString);

import 'dart:convert';

DeleteInvoiceModel deleteInvoiceModelFromJson(String str) =>
    DeleteInvoiceModel.fromJson(json.decode(str));

String deleteInvoiceModelToJson(DeleteInvoiceModel data) =>
    json.encode(data.toJson());

class DeleteInvoiceModel {
  DeleteInvoiceModel({
    required this.deleteInvoice,
    required this.success,
    required this.errorInfo,
  });

  final bool deleteInvoice;
  final bool success;
  final ErrorInfo errorInfo;

  factory DeleteInvoiceModel.fromJson(Map<String, dynamic> json) =>
      DeleteInvoiceModel(
        deleteInvoice: json["DeleteInvoice"] ?? false,
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "DeleteInvoice": deleteInvoice,
        "success": success,
        "error_info": errorInfo.toJson(),
      };
}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    required this.errorData,
  });

  int errorType;
  String extraInfo;
  String description;
  String errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorType: json["error_type"] ?? 0,
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        errorData: json["error_data"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "error_type": errorType,
        "extra_info": extraInfo,
        "description": description,
        "error_data": errorData,
      };
}
