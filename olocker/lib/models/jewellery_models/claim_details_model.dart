// To parse this JSON data, do
//
//     final claimDetailsModel = claimDetailsModelFromJson(jsonString);

import 'dart:convert';

ClaimDetailsModel claimDetailsModelFromJson(String str) =>
    ClaimDetailsModel.fromJson(json.decode(str));

String claimDetailsModelToJson(ClaimDetailsModel data) =>
    json.encode(data.toJson());

class ClaimDetailsModel {
  ClaimDetailsModel({
    required this.claimData,
    required this.success,
    required this.errorInfo,
  });

  final List<ClaimDatum> claimData;
  final bool success;
  final ErrorInfo errorInfo;

  factory ClaimDetailsModel.fromJson(Map<String, dynamic> json) =>
      ClaimDetailsModel(
        claimData: List<ClaimDatum>.from(
            (json["ClaimData"] ?? []).map((x) => ClaimDatum.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "ClaimData": List<dynamic>.from(claimData.map((x) => x.toJson())),
        "success": success,
        "error_info": errorInfo.toJson(),
      };
}

class ClaimDatum {
  ClaimDatum({
    required this.certificateofInsuranceNo,
    required this.claimSrNo,
    required this.itemName,
    required this.claimAmount,
    required this.claimStatus,
    required this.description,
    required this.dateOfLoss,
    required this.lossLocation,
    required this.descriptionOfLoss,
  });

  final String certificateofInsuranceNo;
  final String claimSrNo;
  final String itemName;
  final String claimAmount;
  final String claimStatus;
  final String description;
  final String dateOfLoss;
  final String lossLocation;
  final String descriptionOfLoss;

  factory ClaimDatum.fromJson(Map<String, dynamic> json) => ClaimDatum(
        certificateofInsuranceNo: json["CertificateofInsuranceNo"] ?? "",
        claimSrNo: json["ClaimSrNo"] ?? "",
        itemName: json["ItemName"] ?? "",
        claimAmount: json["ClaimAmount"] ?? "",
        claimStatus: json["ClaimStatus"] ?? "",
        description: json["Description"] ?? "",
        dateOfLoss: json["DateOfLoss"] ?? "",
        lossLocation: json["LossLocation"] ?? "",
        descriptionOfLoss: json["DescriptionOfLoss"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "CertificateofInsuranceNo": certificateofInsuranceNo,
        "ClaimSrNo": claimSrNo,
        "ItemName": itemName,
        "ClaimAmount": claimAmount,
        "ClaimStatus": claimStatus,
        "Description": description,
        "DateOfLoss": dateOfLoss,
        "LossLocation": lossLocation,
        "DescriptionOfLoss": descriptionOfLoss,
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
