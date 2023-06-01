import 'dart:convert';

LoyaltyPointsModel loyaltyPointsModelFromJson(String str) => LoyaltyPointsModel.fromJson(json.decode(str));

String loyaltyPointsModelToJson(LoyaltyPointsModel data) => json.encode(data.toJson());

class LoyaltyPointsModel {
  LoyaltyPointsModel({
    required this.partnerPoint,
    required this.success,
    required this.errorInfo,
  });

  List<PartnerPoint> partnerPoint;
  bool success;
  ErrorInfo errorInfo;

  factory LoyaltyPointsModel.fromJson(Map<String, dynamic> json) => LoyaltyPointsModel(
    partnerPoint: List<PartnerPoint>.from((json["PartnerPoint"] ?? []).map((x) => PartnerPoint.fromJson(x))),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "PartnerPoint": List<dynamic>.from(partnerPoint.map((x) => x.toJson())),
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

class ErrorInfo {
  ErrorInfo({
    // this.errorType,
    required this.extraInfo,
    // this.description,
    // this.errorData,
  });

  // int errorType;
  String extraInfo;
  // String description;
  // dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
    // errorType: json["error_type"],
    extraInfo: json["extra_info"] ?? "",
    // description: json["description"],
    // errorData: json["error_data"],
  );

  Map<String, dynamic> toJson() => {
    // "error_type": errorType,
    "extra_info": extraInfo,
    // "description": description,
    // "error_data": errorData,
  };
}

class PartnerPoint {
  PartnerPoint({
    required this.partner,
    required this.totalPoints,
    required this.valuePerPoint,
    required this.totalReedemedPoint,
    required this.totalRemainingPoint,
    required this.logoUrl,
    required this.partnerSrNo,
    required this.pointsEarnedSummary,
    required this.pointsRedeemedSummary,
  });

  String partner;
  String totalPoints;
  String valuePerPoint;
  String totalReedemedPoint;
  String totalRemainingPoint;
  String logoUrl;
  String partnerSrNo;
  List<PointsEarnedSummary> pointsEarnedSummary;
  List<PointsRedeemedSummary> pointsRedeemedSummary;

  factory PartnerPoint.fromJson(Map<String, dynamic> json) => PartnerPoint(
    partner: json["Partner"] ?? "",
    totalPoints: json["TotalPoints"].toString(),
    valuePerPoint: json["ValuePerPoint"].toString(),
    totalReedemedPoint: (json["TotalReedemedPoint"] ?? 0).toString(),
    totalRemainingPoint: json["TotalRemainingPoint"].toString(),
    logoUrl: json["LogoUrl"] ?? "",
    partnerSrNo: json["PartnerSrNo"].toString(),
    pointsEarnedSummary: List<PointsEarnedSummary>.from((json["PointsEarnedSummary"] ?? []).map((x) => PointsEarnedSummary.fromJson(x))),
    pointsRedeemedSummary: List<PointsRedeemedSummary>.from((json["PointsRedeemedSummary"] ??[ ]).map((x) => PointsRedeemedSummary.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Partner": partner,
    "TotalPoints": totalPoints,
    "ValuePerPoint": valuePerPoint,
    "TotalReedemedPoint": totalReedemedPoint,
    "TotalRemainingPoint": totalRemainingPoint,
    "LogoUrl": logoUrl,
    "PartnerSrNo": partnerSrNo,
    "PointsEarnedSummary": List<dynamic>.from(pointsEarnedSummary.map((x) => x.toJson())),
    // "PointsRedeemedSummary": List<dynamic>.from(pointsRedeemedSummary.map((x) => x)),
  };
}

class PointsEarnedSummary {
  PointsEarnedSummary({
    required this.points,
    required this.dateAdded,
    required this.creditType,
    required this.pointExpiryDate,
  });

  int points;
  String dateAdded;
  String creditType;
  String pointExpiryDate;

  factory PointsEarnedSummary.fromJson(Map<String, dynamic> json) => PointsEarnedSummary(
    points: json["Points"] ?? 0,
    dateAdded: json["DateAdded"] ?? "",
    creditType: json["CreditType"] ?? "",
    pointExpiryDate: json["PointExpiryDate"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "Points": points,
    "DateAdded": dateAdded,
    "CreditType": creditType,
    "PointExpiryDate": pointExpiryDate,
  };
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

    factory PointsRedeemedSummary.fromJson(Map<String, dynamic> json) => PointsRedeemedSummary(
        dateRedeemed: json["DateRedeemed"] ?? "",
        pointsRdeemed: json["PointsRdeemed"] ?? 0,
        redeemtionType: json["RedeemtionType"] ?? "",
    );

}