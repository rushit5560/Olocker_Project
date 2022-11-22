// To parse this JSON data, do
//
//     final getPartnerByCodeModel = getPartnerByCodeModelFromJson(jsonString);

import 'dart:convert';

GetPartnerByCodeModel getPartnerByCodeModelFromJson(String str) =>
    GetPartnerByCodeModel.fromJson(json.decode(str));

String getPartnerByCodeModelToJson(GetPartnerByCodeModel data) =>
    json.encode(data.toJson());

class GetPartnerByCodeModel {
  GetPartnerByCodeModel({
    required this.partner,
    required this.success,
    required this.errorInfo,
  });

  final PartnerDetails partner;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetPartnerByCodeModel.fromJson(Map<String, dynamic> json) =>
      GetPartnerByCodeModel(
        partner: PartnerDetails.fromJson(json["Partner"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "Partner": partner.toJson(),
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

class PartnerDetails {
  PartnerDetails({
    required this.partnerId,
    required this.partnerName,
    required this.city,
    required this.state,
    required this.zip,
  });

  final String partnerId;
  final String partnerName;
  final String city;
  final String state;
  final String zip;

  factory PartnerDetails.fromJson(Map<String, dynamic> json) => PartnerDetails(
        partnerId: json["PartnerId"] ?? "",
        partnerName: json["PartnerName"] ?? "",
        city: json["City"] ?? "",
        state: json["State"] ?? "",
        zip: json["Zip"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "PartnerId": partnerId,
        "PartnerName": partnerName,
        "City": city,
        "State": state,
        "Zip": zip,
      };
}
