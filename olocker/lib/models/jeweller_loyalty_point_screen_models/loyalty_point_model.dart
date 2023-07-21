import 'dart:convert';

import '../error_info_model/error_info_model.dart';

LoyaltyPointsModel loyaltyPointsModelFromJson(String str) =>
    LoyaltyPointsModel.fromJson(json.decode(str));

class LoyaltyPointsModel {
  int statusCode;
  Data data;

  LoyaltyPointsModel({
    required this.statusCode,
    required this.data,
  });

  factory LoyaltyPointsModel.fromJson(Map<String, dynamic> json) =>
      LoyaltyPointsModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<PartnerPoint> partnerPoint;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.partnerPoint,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        partnerPoint: List<PartnerPoint>.from(
            (json["partnerPoint"] ?? []).map((x) => PartnerPoint.fromJson(x)) ??
                {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class PartnerPoint {
  String partner;
  String totalPoints;
  String valuePerPoint;
  String totalReedemedPoint;
  String totalRemainingPoint;
  int totalExpirePoint;
  String logoUrl;
  String expirePoint;
  String partnerSrNo;
  List<PointsEarnedSummary> pointsEarnedSummary;
  List<PointsRedeemedSummary> pointsRedeemedSummary;
  List<ExpirePointModel> expirePointModels;

  PartnerPoint({
    required this.partner,
    required this.totalPoints,
    required this.valuePerPoint,
    required this.totalReedemedPoint,
    required this.totalRemainingPoint,
    required this.totalExpirePoint,
    required this.logoUrl,
    required this.expirePoint,
    required this.partnerSrNo,
    required this.pointsEarnedSummary,
    required this.pointsRedeemedSummary,
    required this.expirePointModels,
  });

  factory PartnerPoint.fromJson(Map<String, dynamic> json) => PartnerPoint(
        partner: json["partner"] ?? "",
        totalPoints: (json["totalPoints"] ?? 0).toString(),
        valuePerPoint: (json["valuePerPoint"] ?? 0.0 ?? 0).toString(),
        totalReedemedPoint: (json["totalReedemedPoint"] ?? 0).toString(),
        totalRemainingPoint: (json["totalRemainingPoint"] ?? 0).toString(),
        totalExpirePoint: json["totalExpirePoint"] ?? 0,
        logoUrl: json["logoUrl"] ?? "",
        expirePoint: (json["expirePoint"] ?? 0).toString(),
        partnerSrNo: (json["partnerSrNo"] ?? 0).toString(),
        pointsEarnedSummary: List<PointsEarnedSummary>.from(
            (json["pointsEarnedSummary"] ?? [])
                    .map((x) => PointsEarnedSummary.fromJson(x)) ??
                {}),
        pointsRedeemedSummary: List<PointsRedeemedSummary>.from(
            (json["PointsRedeemedSummary"] ?? [])
                    .map((x) => PointsRedeemedSummary.fromJson(x)) ??
                {}),
        expirePointModels: List<ExpirePointModel>.from(
            (json["expirePointModels"] ?? [])
                    .map((x) => ExpirePointModel.fromJson(x)) ??
                {}),
      );
}

class ExpirePointModel {
  String pointExpiryDate;
  String points;

  ExpirePointModel({
    required this.pointExpiryDate,
    required this.points,
  });

  factory ExpirePointModel.fromJson(Map<String, dynamic> json) =>
      ExpirePointModel(
        pointExpiryDate: json["pointExpiryDate"] ?? "",
        points: (json["points"] ?? 0.0 ?? 0).toString(),
      );
}

class PointsRedeemedSummary {
  String dateRedeemed;
  int pointsRdeemed;
  String redeemtionType;

  PointsRedeemedSummary({
    required this.dateRedeemed,
    required this.pointsRdeemed,
    required this.redeemtionType,
  });

  factory PointsRedeemedSummary.fromJson(Map<String, dynamic> json) =>
      PointsRedeemedSummary(
        dateRedeemed: json["dateRedeemed "] ?? "",
        pointsRdeemed: json["pointsRdeemed"] ?? 0,
        redeemtionType: json["redeemtionType"] ?? "",
      );
}

class PointsEarnedSummary {
  int points;
  String dateAdded;
  String creditType;
  String pointExpiryDate;

  PointsEarnedSummary({
    required this.points,
    required this.dateAdded,
    required this.creditType,
    required this.pointExpiryDate,
  });

  factory PointsEarnedSummary.fromJson(Map<String, dynamic> json) =>
      PointsEarnedSummary(
        points: json["points"] ?? 0,
        dateAdded: json["dateAdded"] ?? "",
        creditType: json["creditType"] ?? "",
        pointExpiryDate: json["pointExpiryDate"] ?? "",
      );
}
