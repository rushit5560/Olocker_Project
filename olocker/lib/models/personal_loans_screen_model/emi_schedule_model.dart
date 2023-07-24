// To parse this JSON data, do
//
//     final emiScheduleModel = emiScheduleModelFromJson(jsonString);

import 'dart:convert';

import '../error_info_model/error_info_model.dart';

EmiScheduleModel emiScheduleModelFromJson(String str) =>
    EmiScheduleModel.fromJson(json.decode(str));

class EmiScheduleModel {
  int statusCode;
  Data data;

  EmiScheduleModel({
    required this.statusCode,
    required this.data,
  });

  factory EmiScheduleModel.fromJson(Map<String, dynamic> json) =>
      EmiScheduleModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  int emiSrNo;
  String loanApplicationId;
  String message;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.emiSrNo,
    required this.loanApplicationId,
    required this.message,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        emiSrNo: json["emiSrNo"] ?? 0,
        loanApplicationId: json["loanApplicationId"] ?? "",
        message: json["message"] ?? "",
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}
