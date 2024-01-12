// To parse this JSON data, do
//
//     final getLoyalityPlanModel = getLoyalityPlanModelFromJson(jsonString);
//
// import 'dart:convert';
//
//   GetLoyalityPlanModel getLoyalityPlanModelFromJson(String str) =>
//     GetLoyalityPlanModel.fromJson(json.decode(str));
//
// String getLoyalityPlanModelToJson(GetLoyalityPlanModel data) =>
//     json.encode(data.toJson());
//
// class GetLoyalityPlanModel {
//   GetLoyalityPlanModel({
//     required this.loyalityPlan,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   final LoyalityPlan loyalityPlan;
//   final bool success;
//   final ErrorInfo errorInfo;
//
//   factory GetLoyalityPlanModel.fromJson(Map<String, dynamic> json) =>
//       GetLoyalityPlanModel(
//         loyalityPlan: LoyalityPlan.fromJson(json["LoyalityPlan"] ?? {}),
//         success: json["success"] ?? false,
//         errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "LoyalityPlan": loyalityPlan.toJson(),
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
// class LoyalityPlan {
//   LoyalityPlan({
//     required this.partnerSrno,
//     required this.planName,
//     required this.perDownloadPointsEnabled,
//     required this.perDownloadPoints,
//     required this.percentSaleValueEnabled,
//     required this.percentSaleValue,
//     required this.perReferralEnabled,
//     required this.perReferralPoints,
//     required this.valuePerPoint,
//     required this.startDate,
//     required this.endDate,
//     required this.pointsRedemptionMode,
//     required this.isActive,
//     required this.pointExpireDate,
//     required this.pointExpire,
//     required this.perDownloadStartDate,
//     required this.perDownloadEndDate,
//     required this.percentSaleStartDate,
//     required this.percentSaleEndDate,
//     required this.perReferralStartDate,
//     required this.perReferralEndDate,
//     required this.perRatingStartDate,
//     required this.perRatingEndDate,
//     required this.perRatingPoint,
//     required this.perRatingPointEnabled,
//   });
//
//   final int partnerSrno;
//   final String planName;
//   final bool perDownloadPointsEnabled;
//   final int perDownloadPoints;
//   final bool percentSaleValueEnabled;
//   final int percentSaleValue;
//   final bool perReferralEnabled;
//   final int perReferralPoints;
//   final int valuePerPoint;
//   final String startDate;
//   final String endDate;
//   final int pointsRedemptionMode;
//   final bool isActive;
//   final String pointExpireDate;
//   final int pointExpire;
//   final String perDownloadStartDate;
//   final String perDownloadEndDate;
//   final String percentSaleStartDate;
//   final String percentSaleEndDate;
//   final String perReferralStartDate;
//   final String perReferralEndDate;
//   final String perRatingStartDate;
//   final String perRatingEndDate;
//   final int perRatingPoint;
//   final bool perRatingPointEnabled;
//
//   factory LoyalityPlan.fromJson(Map<String, dynamic> json) => LoyalityPlan(
//         partnerSrno: json["PartnerSrno"] ?? 0,
//         planName: json["PlanName"] ?? "",
//         perDownloadPointsEnabled: json["PerDownloadPointsEnabled"] ?? false,
//         perDownloadPoints: json["PerDownloadPoints"] ?? 0,
//         percentSaleValueEnabled: json["PercentSaleValueEnabled"] ?? false,
//         percentSaleValue: json["PercentSaleValue"] ?? 0,
//         perReferralEnabled: json["PerReferralEnabled"] ?? false,
//         perReferralPoints: json["PerReferralPoints"] ?? 0,
//         valuePerPoint: json["ValuePerPoint"] ?? 0,
//         startDate: (json["StartDate"] ?? "").toString(),
//         endDate: (json["EndDate"] ?? "").toString(),
//         pointsRedemptionMode: json["PointsRedemptionMode"] ?? 0,
//         isActive: json["IsActive"] ?? false,
//         pointExpireDate: (json["PointExpireDate"] ?? "").toString(),
//         pointExpire: json["PointExpire"] ?? 0,
//         perDownloadStartDate: (json["PerDownloadStartDate"] ?? "").toString(),
//         perDownloadEndDate: (json["PerDownloadEndDate"] ?? "").toString(),
//         percentSaleStartDate: (json["PercentSaleStartDate"] ?? "").toString(),
//         percentSaleEndDate: (json["PercentSaleEndDate"] ?? "").toString(),
//         perReferralStartDate: (json["PerReferralStartDate"] ?? "").toString(),
//         perReferralEndDate: (json["PerReferralEndDate"] ?? "").toString(),
//         perRatingStartDate: (json["PerRatingStartDate"] ?? "").toString(),
//         perRatingEndDate: (json["PerRatingEndDate"] ?? "").toString(),
//         perRatingPoint: json["PerRatingPoint"] ?? 0,
//         perRatingPointEnabled: json["PerRatingPointEnabled"] ?? false,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "PartnerSrno": partnerSrno,
//         "PlanName": planName,
//         "PerDownloadPointsEnabled": perDownloadPointsEnabled,
//         "PerDownloadPoints": perDownloadPoints,
//         "PercentSaleValueEnabled": percentSaleValueEnabled,
//         "PercentSaleValue": percentSaleValue,
//         "PerReferralEnabled": perReferralEnabled,
//         "PerReferralPoints": perReferralPoints,
//         "ValuePerPoint": valuePerPoint,
//         "StartDate": startDate,
//         "EndDate": endDate,
//         "PointsRedemptionMode": pointsRedemptionMode,
//         "IsActive": isActive,
//         "PointExpireDate": pointExpireDate,
//         "PointExpire": pointExpire,
//         "PerDownloadStartDate": perDownloadStartDate,
//         "PerDownloadEndDate": perDownloadEndDate,
//         "PercentSaleStartDate": percentSaleStartDate,
//         "PercentSaleEndDate": percentSaleEndDate,
//         "PerReferralStartDate": perReferralStartDate,
//         "PerReferralEndDate": perReferralEndDate,
//         "PerRatingStartDate": perRatingStartDate,
//         "PerRatingEndDate": perRatingEndDate,
//         "PerRatingPoint": perRatingPoint,
//         "PerRatingPointEnabled": perRatingPointEnabled,
//       };
// }
//
//

import 'dart:convert';

import '../error_info_model/error_info_model.dart';

GetLoyalityPlanModel getLoyalityPlanModelFromJson(String str) =>
    GetLoyalityPlanModel.fromJson(json.decode(str));

class GetLoyalityPlanModel {
  int statusCode;
  Data data;

  GetLoyalityPlanModel({
    required this.statusCode,
    required this.data,
  });

  factory GetLoyalityPlanModel.fromJson(Map<String, dynamic> json) =>
      GetLoyalityPlanModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  LoyalityPlan loyalityPlan;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.loyalityPlan,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        loyalityPlan: LoyalityPlan.fromJson(json["loyalityPlan"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class LoyalityPlan {
  LoyalityPlan({
    required this.partnerSrno,
    required this.planName,
    required this.perDownloadPointsEnabled,
    required this.perDownloadPoints,
    required this.percentSaleValueEnabled,
    required this.percentSaleValue,
    required this.perReferralEnabled,
    required this.perReferralPoints,
    required this.valuePerPoint,
    required this.startDate,
    required this.endDate,
    required this.pointsRedemptionMode,
    required this.isActive,
    required this.pointExpireDate,
    required this.pointExpire,
    required this.perDownloadStartDate,
    required this.perDownloadEndDate,
    required this.percentSaleStartDate,
    required this.percentSaleEndDate,
    required this.perReferralStartDate,
    required this.perReferralEndDate,
    required this.perRatingStartDate,
    required this.perRatingEndDate,
    required this.perRatingPoint,
    required this.perRatingPointEnabled,
  });

  final int partnerSrno;
  final String planName;
  final bool perDownloadPointsEnabled;
  final int perDownloadPoints;
  final bool percentSaleValueEnabled;
  final int percentSaleValue;
  final bool perReferralEnabled;
  final int perReferralPoints;
  final int valuePerPoint;
  final String startDate;
  final String endDate;
  final int pointsRedemptionMode;
  final bool isActive;
  final String pointExpireDate;
  final int pointExpire;
  final String perDownloadStartDate;
  final String perDownloadEndDate;
  final String percentSaleStartDate;
  final String percentSaleEndDate;
  final String perReferralStartDate;
  final String perReferralEndDate;
  final String perRatingStartDate;
  final String perRatingEndDate;
  final int perRatingPoint;
  final bool perRatingPointEnabled;

  factory LoyalityPlan.fromJson(Map<String, dynamic> json) => LoyalityPlan(
        partnerSrno: json["PartnerSrno"] ?? 0,
        planName: json["PlanName"] ?? "",
        perDownloadPointsEnabled: json["PerDownloadPointsEnabled"] ?? false,
        perDownloadPoints: json["PerDownloadPoints"] ?? 0,
        percentSaleValueEnabled: json["PercentSaleValueEnabled"] ?? false,
        percentSaleValue: json["PercentSaleValue"] ?? 0,
        perReferralEnabled: json["PerReferralEnabled"] ?? false,
        perReferralPoints: json["PerReferralPoints"] ?? 0,
        valuePerPoint: json["ValuePerPoint"] ?? 0,
        startDate: (json["StartDate"] ?? "").toString(),
        endDate: (json["EndDate"] ?? "").toString(),
        pointsRedemptionMode: json["PointsRedemptionMode"] ?? 0,
        isActive: json["IsActive"] ?? false,
        pointExpireDate: (json["PointExpireDate"] ?? "").toString(),
        pointExpire: json["PointExpire"] ?? 0,
        perDownloadStartDate: (json["PerDownloadStartDate"] ?? "").toString(),
        perDownloadEndDate: (json["PerDownloadEndDate"] ?? "").toString(),
        percentSaleStartDate: (json["PercentSaleStartDate"] ?? "").toString(),
        percentSaleEndDate: (json["PercentSaleEndDate"] ?? "").toString(),
        perReferralStartDate: (json["PerReferralStartDate"] ?? "").toString(),
        perReferralEndDate: (json["PerReferralEndDate"] ?? "").toString(),
        perRatingStartDate: (json["PerRatingStartDate"] ?? "").toString(),
        perRatingEndDate: (json["PerRatingEndDate"] ?? "").toString(),
        perRatingPoint: json["PerRatingPoint"] ?? 0,
        perRatingPointEnabled: json["PerRatingPointEnabled"] ?? false,
      );
}
