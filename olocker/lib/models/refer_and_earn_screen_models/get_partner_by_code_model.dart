// // To parse this JSON data, do
// //
// //     final getPartnerByCodeModel = getPartnerByCodeModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GetPartnerByCodeModel getPartnerByCodeModelFromJson(String str) =>
//     GetPartnerByCodeModel.fromJson(json.decode(str));
//
// String getPartnerByCodeModelToJson(GetPartnerByCodeModel data) =>
//     json.encode(data.toJson());
//
// class GetPartnerByCodeModel {
//   GetPartnerByCodeModel({
//     required this.partner,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   final PartnerDetails partner;
//   final bool success;
//   final ErrorInfo errorInfo;
//
//   factory GetPartnerByCodeModel.fromJson(Map<String, dynamic> json) =>
//       GetPartnerByCodeModel(
//         partner: PartnerDetails.fromJson(json["Partner"] ?? {}),
//         success: json["success"] ?? false,
//         errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Partner": partner.toJson(),
//         "success": success,
//         "error_info": errorInfo.toJson(),
//       };
// }
//
// class ErrorInfo {
//   ErrorInfo({
//     required this.errorType,
//     required this.extraInfo,
//     required this.description,
//     this.errorData,
//   });
//
//   final int errorType;
//   final String extraInfo;
//   final String description;
//   final dynamic errorData;
//
//   factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
//         errorType: json["error_type"] ?? 0,
//         extraInfo: json["extra_info"] ?? "",
//         description: json["description"] ?? "",
//         errorData: json["error_data"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "error_type": errorType,
//         "extra_info": extraInfo,
//         "description": description,
//         "error_data": errorData,
//       };
// }
//
// class PartnerDetails {
//   PartnerDetails({
//     required this.partnerId,
//     required this.partnerName,
//     required this.city,
//     required this.state,
//     required this.zip,
//   });
//
//   final String partnerId;
//   final String partnerName;
//   final String city;
//   final String state;
//   final String zip;
//
//   factory PartnerDetails.fromJson(Map<String, dynamic> json) => PartnerDetails(
//         partnerId: json["PartnerId"] ?? "",
//         partnerName: json["PartnerName"] ?? "",
//         city: json["City"] ?? "",
//         state: json["State"] ?? "",
//         zip: json["Zip"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "PartnerId": partnerId,
//         "PartnerName": partnerName,
//         "City": city,
//         "State": state,
//         "Zip": zip,
//       };
// }
//
//
//
//

import 'dart:convert';

import '../error_info_model/error_info_model.dart';

GetPartnerByCodeModel getPartnerByCodeModelFromJson(String str) =>
    GetPartnerByCodeModel.fromJson(json.decode(str));

class GetPartnerByCodeModel {
  int statusCode;
  Data data;

  GetPartnerByCodeModel({
    required this.statusCode,
    required this.data,
  });

  factory GetPartnerByCodeModel.fromJson(Map<String, dynamic> json) =>
      GetPartnerByCodeModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  PartnerDetails partner;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.partner,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        partner: PartnerDetails.fromJson(json["partner"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
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
        partnerId: (json["partnerId"] ?? 0).toString(),
        partnerName: json["partnerName"] ?? "",
        city: json["city"] ?? "",
        state: json["state"] ?? "",
        zip: json["zip"] ?? "",
      );
}
