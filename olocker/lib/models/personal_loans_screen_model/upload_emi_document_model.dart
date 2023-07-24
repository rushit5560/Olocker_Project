// To parse this JSON data, do
//
//     final uploadEmiDocumentModel = uploadEmiDocumentModelFromJson(jsonString);

import 'dart:convert';

import 'package:olocker/models/error_info_model/error_info_model.dart';

UploadEmiDocumentModel uploadEmiDocumentModelFromJson(String str) =>
    UploadEmiDocumentModel.fromJson(json.decode(str));

class UploadEmiDocumentModel {
  int statusCode;
  Data data;

  UploadEmiDocumentModel({
    required this.statusCode,
    required this.data,
  });

  factory UploadEmiDocumentModel.fromJson(Map<String, dynamic> json) =>
      UploadEmiDocumentModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  int emiSrNo;
  String emiTenorOptions;
  String loanApplicationId;
  String message;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.emiSrNo,
    required this.emiTenorOptions,
    required this.loanApplicationId,
    required this.message,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        emiSrNo: json["emiSrNo"] ?? 0,
        emiTenorOptions: json["emiTenorOptions"] ?? "",
        loanApplicationId: json["loanApplicationId"] ?? "",
        message: json["message"] ?? "",
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}
