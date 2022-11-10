// To parse this JSON data, do
//
//     final uploadEmiDocumentModel = uploadEmiDocumentModelFromJson(jsonString);

import 'dart:convert';

UploadEmiDocumentModel uploadEmiDocumentModelFromJson(String str) =>
    UploadEmiDocumentModel.fromJson(json.decode(str));

String uploadEmiDocumentModelToJson(UploadEmiDocumentModel data) =>
    json.encode(data.toJson());

class UploadEmiDocumentModel {
  UploadEmiDocumentModel({
    required this.emiSrNo,
    // this.emiTenorOptions,
    // this.loanApplicationId,
    required this.message,
    required this.success,
    required this.errorInfo,
  });

  final int emiSrNo;
  // final dynamic emiTenorOptions;
  // final dynamic loanApplicationId;
  final String message;
  final bool success;
  final ErrorInfo errorInfo;

  factory UploadEmiDocumentModel.fromJson(Map<String, dynamic> json) =>
      UploadEmiDocumentModel(
        emiSrNo: json["emiSrNo"] ?? 0,
        // emiTenorOptions: json["EMITenorOptions"],
        // loanApplicationId: json["LoanApplicationId"],
        message: json["Message"] ?? "",
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson((json["error_info"] ?? {})),
      );

  Map<String, dynamic> toJson() => {
        "emiSrNo": emiSrNo,
        // "EMITenorOptions": emiTenorOptions,
        // "LoanApplicationId": loanApplicationId,
        "Message": message,
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
