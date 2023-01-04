// To parse this JSON data, do
//
//     final invoiceResponseModel = invoiceResponseModelFromJson(jsonString);

import 'dart:convert';

InvoiceResponseModel invoiceResponseModelFromJson(String str) =>
    InvoiceResponseModel.fromJson(json.decode(str));

String invoiceResponseModelToJson(InvoiceResponseModel data) =>
    json.encode(data.toJson());

class InvoiceResponseModel {
  InvoiceResponseModel({
    required this.uploadInvoice,
    required this.uploadInvoiceData,
    required this.success,
    required this.errorInfo,
  });

  final UploadInvoice uploadInvoice;
  final UploadInvoiceData uploadInvoiceData;
  final bool success;
  final ErrorInfo errorInfo;

  factory InvoiceResponseModel.fromJson(Map<String, dynamic> json) =>
      InvoiceResponseModel(
        uploadInvoice: UploadInvoice.fromJson(json["UploadInvoice"] ?? {}),
        uploadInvoiceData:
            UploadInvoiceData.fromJson(json["UploadInvoiceData"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "UploadInvoice": uploadInvoice.toJson(),
        "UploadInvoiceData": uploadInvoiceData.toJson(),
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

class UploadInvoice {
  UploadInvoice({
    required this.ornamentSrNo,
    required this.customerId,
    required this.invoiceImageBase64,
  });

  final int ornamentSrNo;
  final int customerId;
  final String invoiceImageBase64;

  factory UploadInvoice.fromJson(Map<String, dynamic> json) => UploadInvoice(
        ornamentSrNo: json["OrnamentSrNo"] ?? 0,
        customerId: json["CustomerId"] ?? 0,
        invoiceImageBase64: json["InvoiceImage_Base64"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "OrnamentSrNo": ornamentSrNo,
        "CustomerId": customerId,
        "InvoiceImage_Base64": invoiceImageBase64,
      };
}

class UploadInvoiceData {
  UploadInvoiceData({
    required this.ornamentSrNo,
    required this.customerId,
    required this.imageurl,
  });

  final int ornamentSrNo;
  final int customerId;
  final String imageurl;

  factory UploadInvoiceData.fromJson(Map<String, dynamic> json) =>
      UploadInvoiceData(
        ornamentSrNo: json["OrnamentSrNo"] ?? 0,
        customerId: json["CustomerId"] ?? "",
        imageurl: json["Imageurl"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "OrnamentSrNo": ornamentSrNo,
        "CustomerId": customerId,
        "Imageurl": imageurl,
      };
}
