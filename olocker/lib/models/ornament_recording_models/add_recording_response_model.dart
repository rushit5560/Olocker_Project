// To parse this JSON data, do
//
//     final addRecordingResponseModel = addRecordingResponseModelFromJson(jsonString);

import 'dart:convert';

AddRecordingResponseModel addRecordingResponseModelFromJson(String str) =>
    AddRecordingResponseModel.fromJson(json.decode(str));

String addRecordingResponseModelToJson(AddRecordingResponseModel data) =>
    json.encode(data.toJson());

class AddRecordingResponseModel {
  AddRecordingResponseModel({
    // this.ornamentHistory,
    required this.success,
    required this.errorInfo,
  });

  // final dynamic ornamentHistory;
  final bool success;
  final ErrorInfo errorInfo;

  factory AddRecordingResponseModel.fromJson(Map<String, dynamic> json) =>
      AddRecordingResponseModel(
        // ornamentHistory: json["OrnamentHistory"],
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        // "OrnamentHistory": ornamentHistory,
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
