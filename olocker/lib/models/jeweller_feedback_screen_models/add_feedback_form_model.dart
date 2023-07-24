// To parse this JSON data, do
//
//     final addFeedbackFormModel = addFeedbackFormModelFromJson(jsonString);

import 'dart:convert';

import '../error_info_model/error_info_model.dart';

AddFeedbackFormModel addFeedbackFormModelFromJson(String str) =>
    AddFeedbackFormModel.fromJson(json.decode(str));

class AddFeedbackFormModel {
  int statusCode;
  Data data;

  AddFeedbackFormModel({
    required this.statusCode,
    required this.data,
  });

  factory AddFeedbackFormModel.fromJson(Map<String, dynamic> json) =>
      AddFeedbackFormModel(
        statusCode: json["statusCode"] ?? false,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}
